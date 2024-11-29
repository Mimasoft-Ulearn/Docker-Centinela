<?php
set_time_limit(0);

//ini_set('LimitRequestBody', 100024000);
//ini_set('post_max_size', 100024000);
//ini_set('upload_max_filesize', 100024000);
/*if (!defined('BASEPATH'))
    exit('No direct script access allowed');*/
//header('Access-Control-Allow-Origin: *');

require(APPPATH . '/libraries/REST_Controller.php');

class Api_monitoring extends REST_Controller
{

    private $API_USER_ID = 6;
    private $API_TOKEN = "lHmaMIvdbhe8uXJNqn3gjzgiCMN5cnyzCb313aVn2ANAhNnZcmBfS8xgmbqO5uwn";
    public function __construct()
    {
        parent::__construct();
    }


    /**
     * Valida el API token
     *@return bool
     */
    private function validateToken(): bool
    {
        $authorization = $this->input->get_request_header('Authorization', true);

        if(empty($authorization)) {
            $this->response([
                "message" => "No se encontro el token de autorizacion",
                "success" => false

            ], REST_Controller::HTTP_UNAUTHORIZED);
            return false;
        }

        // remover la palabra authorization
        $authorization = str_replace('Authorization ','', $authorization);

        // dividir header (explode)
        $parts = explode(" ", trim($authorization));

        // verificar barear token y extraerlo.
        if(count($parts) !== 2 || strtolower($parts[0]) !=='bearer') {
            $this->response([
                "message" => "El token de autorizacion es incorrecto. Debe ser 'Bearer {token}",
                "success" => false
            ], REST_Controller::HTTP_UNAUTHORIZED);
            return false;
        }

        $token = $parts[1]; // token segunda parte;
        // validamos el token extraido
        if($token != $this->API_TOKEN ) {
            $this->response([
                "message" => "Token de autorizacion invalido",
                "success" => false
            ], REST_Controller::HTTP_UNAUTHORIZED);
            return false;
        }
        return true;
    }

    /**
     * Guarda la data en un fichero para backup
     * @param array $data
     * @return string
     */
    private function saveMonitoringDataFile($data) {
        $json_data = json_encode($data);
        $filename = 'data_monitoring_' . date('YmdHis') . '.json';
        $file_path = FCPATH . 'files/API/' . $filename;
        file_put_contents($file_path, $json_data);
        return $filename;
    }

    /**
     * Procesar datos segun frecuencia 5m , 15m , 1H
     * @param array $frequency_data
     * @param string $frequency
     * @return array
     */
    private function processFrequencyData($frequency_data, $frequency): array
    {
        if (empty($frequency_data)) {
            return ["Info: No se ingresaron registros para la frecuencia."];
        }

        $response = [];
        $save_ids = [];

        foreach ($frequency_data as $load_code_api => $element_data) {
            $station = $this->Air_stations_model->get_one_where([
                "load_code_api" => $load_code_api,
                "deleted" => 0
            ]);

            if (!$station->id) {
                $response[$load_code_api] = "Error: Estación " . $load_code_api . " no existe. Datos no ingresados.";
                continue;
            }

            $save_id = $this->procesStationElements($station, $element_data, $frequency);
            if ($save_id) {
                $save_ids[] = $save_id;
            }
        }

        return [
            'response' => $response,
            'save_ids' => $save_ids
        ];
    }

    /**
     * Procesa la data de la estacion y guarda
     * @param object $station
     * @param array $station_data
     * @param string $frequency
     * @return int|bool
     */
    private function procesStationElements($station, $element_data, $frequency) {
        $variables_rel_station = $this->Air_stations_rel_variables_model->get_dropdown_list(
            ["id_air_variable"],
            "id_air_variable",
            ["id_air_station" => $station->id, "deleted" => 0]
        );

        $save_id = false;
        foreach($element_data as $element) {
            foreach ($element as $timestamp => $values) {
                $data_variables = $this->formatVariablesData($values, $variables_rel_station);
                $datetime = $this->getFormattedDateTime($timestamp);
                $save_id = $this->saveStationRecord($station, $timestamp, $datetime, $data_variables, $frequency);
            }
        }
        return $save_id;
    }

    /**
     * Formatear los datos de las variables con sus ID correspondientes
     * @param array $values
     * @param array $variables_rel_station
     * @return array
     */
    private function formatVariablesData($values, $variables_rel_station): array
    {
        $data_variables = [];

        foreach ($values as $sigla => $value) {
            $variable = $this->Air_variables_model->get_one_where([
                "sigla_api" => $sigla,
                "deleted" => 0
            ]);

            if ($variable && in_array($variable->id, $variables_rel_station)) {
                $data_variables[$variable->id] = (string)$value;
            } else {
                $data_variables[$sigla] = (string)$value;
            }
        }

        return $data_variables;
    }

    /**
     * Obtener fecha y hora formateadas a partir de un timestamp
     * @param int $timestamp
     * @return array
     */
    private function getFormattedDateTime($timestamp): array
    {
        $dt = new DateTime("@$timestamp", new DateTimeZone('UTC'));
        $dt->setTimeZone(new DateTimeZone('America/Santiago'));

        return [
            'date' => $dt->format('Y-m-d'),
            'hour' => $dt->format('H'),
            'minute' => $dt->format('i')
        ];
    }

    /**
     * Guardar o actualizar el registro de la estación
     * @param object $station
     * @param int $timestamp
     * @param array $datetime
     * @param array $data_variables
     * @param string $frequency
     * @return int|bool
     */
    private function saveStationRecord($station, $timestamp, $datetime, $data_variables, $frequency) {
        $model_name = "Air_stations_values_{$frequency}_model";

        $existing_record = $this->$model_name->get_one_where([
            "id_station" => $station->id,
            "timestamp" => $timestamp,
            "deleted" => 0
        ]);

        if ($existing_record->id) {
            return $this->updateStationRecord($model_name, $existing_record->id, $data_variables);
        }

        return $this->createStationRecord($model_name, $station, $timestamp, $datetime, $data_variables);
    }

    /**
     * Actualizar el registro de estación existente
     * @param string $model_name
     * @param int $record_id
     * @param array $data_variables
     * @return int|bool
     */
    private function updateStationRecord($model_name, $record_id, $data_variables) {
        $update_data = [
            "data" => json_encode($data_variables),
            "modified" => get_current_utc_time(),
            "modified_by" => $this->API_USER_ID
        ];

        return $this->$model_name->save($update_data, $record_id);
    }

    /**
     * Crear un nuevo registro de estación
     * @param string $model_name
     * @param object $station
     * @param int $timestamp
     * @param array $datetime
     * @param array $data_variables
     * @return int|bool
     */
    private function createStationRecord($model_name, $station, $timestamp, $datetime, $data_variables) {
        $insert_data = [
            "id_station" => $station->id,
            "timestamp" => $timestamp,
            "date" => $datetime['date'],
            "hour" => $datetime['hour'],
            "minute" => $datetime['minute'],
            "data" => json_encode($data_variables),
            "created" => get_current_utc_time(),
            "created_by" => $this->API_USER_ID
        ];
        return $this->$model_name->save($insert_data);
    }

    /**
     * Principal método de tratamiento de los datos
     * POST endpoint
     * @return Response
     */
    public function monitoring_data_post() {
        if (!$this->validateToken()) {
            return;
        }

        $input_data = json_decode(file_get_contents("php://input"), true);
        $this->saveMonitoringDataFile($input_data);

        $frequencies = ['5m', '15m', '1h'];
        $response = [];
        $save_ids = [];

        foreach ($frequencies as $frequency) {
            if (!empty($input_data[$frequency])) {
                $result = $this->processFrequencyData($input_data[$frequency], $frequency);
                $response[$frequency] = $result['response'];
                $save_ids = array_merge($save_ids, $result['save_ids']);
            } else {
                $response[$frequency] = "Info: No se ingresaron registros para la frecuencia.";
            }
        }

        if (!empty($save_ids)) {
            $response["success"] = true;
            return $this->response($response);
        }

        return $this->response([
            "success" => false,
            "message" => "Info: No se ingresaron registros."
        ]);
    }


   /* function monitoring_data_post()
    {

        $token = $this->input->get_request_header('Authorization', true);

        // VALIDO SI VIENE EL TOKEN (TOPIC)
        if (!$token) {
            return $this->response(array("message" => "Fallo de autenticidad! No se identifico un token de acceso.", "success" => false));
            exit();
        }

        // VALIDO SI EXISTE TOKEN
        $existe_token = $token == "ISCSL9bXp928IxQzM636fRwtx94YlSwv9vbz1OGh" ? true : false;
        //log_message('error', "tenemos token");
        if ($existe_token) {
            log_message('error', "sera que esta malo el token");
            return $this->response(array("message" => "Fallo de autenticidad! token incorrecto.", "success" => false));
            exit();
        }

        //$data = $this->post("data"); // POSTMAN: Body - form-data
        //$array_data = json_decode($data, true);
        // return $this->response($array_data);
        // exit();
        $data = json_decode(file_get_contents("php://input"), true); // POSTMAN: Body - raw

        $array_data = $data;

        // 	// // Guardar los datos en un archivo JSON
        $json_data = json_encode($array_data);
        $filename = 'data_monitoring_' . date('YmdHis') . '.json';
        $file_path = FCPATH . 'files/API/' . $filename;
        file_put_contents($file_path, $json_data);


        // return $this->response($array_data);
        // exit();

        $array_frequency_5m = $array_data["5m"];
        $array_frequency_15m = $array_data["15m"];
        $array_frequency_1h = $array_data["1h"];
        $response = array();

        // FRECUENCIA 5 MINUTOS
        if (count($array_frequency_5m)) {

            foreach ($array_frequency_5m as $load_code_api => $array_data) {

                $station = $this->Air_stations_model->get_one_where(array("load_code_api" => $load_code_api, "deleted" => 0));

                if ($station->id) {

                    $variables_rel_station = $this->Air_stations_rel_variables_model->get_dropdown_list(
                        array("id_air_variable"), // value
                        "id_air_variable", // key
                        array("id_air_station" => $station->id, "deleted" => 0) // where
                    );


                    foreach ($array_data as $timestamp => $array_values) {

                        // $dt = new DateTime('now', new DateTimeZone('UTC'));
                        // $dt->setTimestamp($timestamp);
                        $dt = new DateTime("@$timestamp", new DateTimeZone('UTC')); // Crear un objeto DateTime con la zona horaria UTC
                        $dt->setTimeZone(new DateTimeZone('America/Santiago')); // Cambiar la zona horaria a Santiago de Chile

                        $data_variables = array();

                        foreach ($array_values as $sigla => $value) {

                            $id_variable = $this->Air_variables_model->get_one_where(
                                array(
                                    "sigla_api" => $sigla,
                                    "deleted" => 0
                                )
                            )->id;

                            if (in_array($id_variable, $variables_rel_station)) {
                                $data_variables[$id_variable] = (string) $value;
                            } else {
                                $data_variables[$sigla] = (string) $value;
                            }

                        }

                        foreach ($variables_rel_station as $id_variable) {
                            $variable = $this->Air_variables_model->get_one($id_variable);
                            if (array_key_exists($id_variable, $data_variables)) {
                                $response["5m"][$load_code_api][$timestamp][$variable->sigla_api] = "Info: Ok";
                            } else {
                                $response["5m"][$load_code_api][$timestamp][$variable->sigla_api] = "Info: No se recibió variable " . $variable->sigla_api . " (" . $variable->name . ")";
                            }
                        }

                        // SI YA SE HA REGISTRADO DATA PARA UNA ESTACIÓN CON EL MISMO TIMESTAMP, SE ACTUALIZA EL REGISTRO. SI NO, SE INGRESA EL NUEVO REGISTRO
                        $record = $this->Air_stations_values_5m_model->get_one_where(
                            array(
                                "id_station" => $station->id,
                                "timestamp" => $timestamp,
                                "deleted" => 0
                            )
                        );

                        if ($record->id) {
                            $array_data_row = array(
                                "data" => json_encode($data_variables),
                                "modified" => get_current_utc_time(),
                                "modified_by" => 6 // API USER
                            );
                            $save_id_5m = $this->Air_stations_values_5m_model->save($array_data_row, $record->id);
                        } else {
                            $array_data_row = array(
                                "id_station" => $station->id,
                                "timestamp" => $timestamp,
                                "date" => $dt->format('Y-m-d'),
                                "hour" => $dt->format('H'),
                                "minute" => $dt->format('i'),
                                "data" => json_encode($data_variables),
                                "created" => get_current_utc_time(),
                                "created_by" => 6 // API USER
                            );
                            $save_id_5m = $this->Air_stations_values_5m_model->save($array_data_row);
                        }

                    }

                } else {

                    $response["5m"][$load_code_api] = "Error: Estación " . $load_code_api . " no existe. Datos no ingresados.";

                }

            }

        } else {
            $response["5m"] = "Info: No se ingresaron registros para la frecuencia.";
        }


        // FRECUENCIA 15 MINUTOS
        if (count($array_frequency_15m)) {

            foreach ($array_frequency_15m as $load_code_api => $array_data) {

                $station = $this->Air_stations_model->get_one_where(array("load_code_api" => $load_code_api, "deleted" => 0));

                if ($station->id) {

                    $variables_rel_station = $this->Air_stations_rel_variables_model->get_dropdown_list(
                        array("id_air_variable"), // value
                        "id_air_variable", // key
                        array("id_air_station" => $station->id, "deleted" => 0) // where
                    );

                    foreach ($array_data as $timestamp => $array_values) {

                        // $dt = new DateTime('now', new DateTimeZone('UTC'));
                        // $dt->setTimestamp($timestamp);
                        $dt = new DateTime("@$timestamp", new DateTimeZone('UTC')); // Crear un objeto DateTime con la zona horaria UTC
                        $dt->setTimeZone(new DateTimeZone('America/Santiago')); // Cambiar la zona horaria a Santiago de Chile

                        $data_variables = array();

                        foreach ($array_values as $sigla => $value) {

                            $id_variable = $this->Air_variables_model->get_one_where(
                                array(
                                    "sigla_api" => $sigla,
                                    "deleted" => 0
                                )
                            )->id;

                            if (in_array($id_variable, $variables_rel_station)) {
                                $data_variables[$id_variable] = (string) $value;
                            } else {
                                $data_variables[$sigla] = (string) $value;
                            }

                        }

                        foreach ($variables_rel_station as $id_variable) {
                            $variable = $this->Air_variables_model->get_one($id_variable);
                            if (array_key_exists($id_variable, $data_variables)) {
                                $response["15m"][$load_code_api][$timestamp][$variable->sigla_api] = "Info: Ok";
                            } else {
                                $response["15m"][$load_code_api][$timestamp][$variable->sigla_api] = "Info: No se recibió variable " . $variable->sigla_api . " (" . $variable->name . ")";
                            }
                        }

                        // SI YA SE HA REGISTRADO DATA PARA UNA ESTACIÓN CON EL MISMO TIMESTAMP, SE ACTUALIZA EL REGISTRO. SI NO, SE INGRESA EL NUEVO REGISTRO
                        $record = $this->Air_stations_values_15m_model->get_one_where(
                            array(
                                "id_station" => $station->id,
                                "timestamp" => $timestamp,
                                "deleted" => 0
                            )
                        );

                        if ($record->id) {
                            $array_data_row = array(
                                "data" => json_encode($data_variables),
                                "modified" => get_current_utc_time(),
                                "modified_by" => 6 // API USER
                            );
                            $save_id_15m = $this->Air_stations_values_15m_model->save($array_data_row, $record->id);
                        } else {
                            $array_data_row = array(
                                "id_station" => $station->id,
                                "timestamp" => $timestamp,
                                "date" => $dt->format('Y-m-d'),
                                "hour" => $dt->format('H'),
                                "minute" => $dt->format('i'),
                                "data" => json_encode($data_variables),
                                "created" => get_current_utc_time(),
                                "created_by" => 6 // API USER
                            );
                            $save_id_15m = $this->Air_stations_values_15m_model->save($array_data_row);
                        }

                    }

                } else {

                    $response["15m"][$load_code_api] = "Error: Estación " . $load_code_api . " no existe. Datos no ingresados.";

                }

            }

        } else {
            $response["15m"] = "Info: No se ingresaron registros para la frecuencia.";
        }



        // FRECUENCIA 1 HORA
        if (count($array_frequency_1h)) {

            foreach ($array_frequency_1h as $load_code_api => $array_data) {

                $station = $this->Air_stations_model->get_one_where(array("load_code_api" => $load_code_api, "deleted" => 0));

                if ($station->id) {

                    $variables_rel_station = $this->Air_stations_rel_variables_model->get_dropdown_list(
                        array("id_air_variable"), // value
                        "id_air_variable", // key
                        array("id_air_station" => $station->id, "deleted" => 0) // where
                    );

                    foreach ($array_data as $timestamp => $array_values) {

                        // $dt = new DateTime('now', new DateTimeZone('UTC'));
                        // $dt->setTimestamp($timestamp);
                        $dt = new DateTime("@$timestamp", new DateTimeZone('UTC')); // Crear un objeto DateTime con la zona horaria UTC
                        $dt->setTimeZone(new DateTimeZone('America/Santiago')); // Cambiar la zona horaria a Santiago de Chile

                        $data_variables = array();

                        foreach ($array_values as $sigla => $value) {

                            $id_variable = $this->Air_variables_model->get_one_where(
                                array(
                                    "sigla_api" => $sigla,
                                    "deleted" => 0
                                )
                            )->id;

                            if (in_array($id_variable, $variables_rel_station)) {
                                $data_variables[$id_variable] = (string) $value;
                            } else {
                                $data_variables[$sigla] = (string) $value;
                            }

                        }

                        foreach ($variables_rel_station as $id_variable) {
                            $variable = $this->Air_variables_model->get_one($id_variable);
                            if (array_key_exists($id_variable, $data_variables)) {
                                $response["1h"][$load_code_api][$timestamp][$variable->sigla_api] = "Info: Ok";
                            } else {
                                $response["1h"][$load_code_api][$timestamp][$variable->sigla_api] = "Info: No se recibió variable " . $variable->sigla_api . " (" . $variable->name . ")";
                            }
                        }

                        // SI YA SE HA REGISTRADO DATA PARA UNA ESTACIÓN CON EL MISMO TIMESTAMP, SE ACTUALIZA EL REGISTRO. SI NO, SE INGRESA EL NUEVO REGISTRO
                        $record = $this->Air_stations_values_1h_model->get_one_where(
                            array(
                                "id_station" => $station->id,
                                "timestamp" => $timestamp,
                                "deleted" => 0
                            )
                        );

                        if ($record->id) {
                            $array_data_row = array(
                                "data" => json_encode($data_variables),
                                "modified" => get_current_utc_time(),
                                "modified_by" => 6 // API USER
                            );
                            $save_id_1h = $this->Air_stations_values_1h_model->save($array_data_row, $record->id);
                        } else {
                            $array_data_row = array(
                                "id_station" => $station->id,
                                "timestamp" => $timestamp,
                                "date" => $dt->format('Y-m-d'),
                                "hour" => $dt->format('H'),
                                "minute" => $dt->format('i'),
                                "data" => json_encode($data_variables),
                                "created" => get_current_utc_time(),
                                "created_by" => 6 // API USER
                            );
                            $save_id_1h = $this->Air_stations_values_1h_model->save($array_data_row);
                            log_message('error', "que se esta intentando guardar?".$save_id_1h);
                        }

                    }

                } else {

                    $response["1h"][$load_code_api] = "Error: Estación " . $load_code_api . " no existe. Datos no ingresados.";

                }

            }

        } else {
            $response["1h"] = "Info: No se ingresaron registros para la frecuencia.";
        }

        // RESPONSE
        if ($save_id_5m || $save_id_15m || $save_id_1h) {
            $response["success"] = true;
            return $this->response($response);
        } else {
            return $this->response(array("success" => false, "message" => "Info: No se ingresaron registros."));
        }

    }*/

        function monitoring_data_1m_post()
        {

            /*$token = $this->input->get_request_header('Authorization', true);
            if (!$token || $token != "ISCSL9bXp928IxQzM636fRwtx94YlSwv9vbz1OGh") {
                return $this->response(["message" => "Fallo de autenticidad!", "success" => false]);
            }*/
            $token = $this->input->get_request_header('Authorization', true);

            // VALIDO SI VIENE EL TOKEN (TOPIC)
            if (!$token) {
                return $this->response(array("message" => "Fallo de autenticidad! No se identifico un token de acceso.", "success" => false));
                exit();
            }

            // VALIDO SI EXISTE TOKEN
            $existe_token = $token == "ISCSL9bXp928IxQzM636fRwtx94YlSwv9vbz1OGh" ? true : false;
            //log_message('error', "tenemos token");
            if ($existe_token) {

                return $this->response(array("message" => "Fallo de autenticidad! token incorrecto.", "success" => false));
                exit();
            }


            $array_data = json_decode(file_get_contents("php://input"), true); // recibe en json y transforma a array asociativa
            if (empty($array_data["1m"])) {
                return $this->response(["1m" => "Info: No se ingresaron registros para la frecuencia."]);
            }


            // 	// // Guardar los datos en un archivo JSON
            $json_data = json_encode($array_data);
            $filename = 'data_monitoring_' . date('YmdHis') . '.json';
            $file_path = FCPATH . 'files/API/' . $filename;
            file_put_contents($file_path, $json_data);


            $load_codes_api = array_keys($array_data["1m"]);
            $stations = $this->Air_stations_model->get_stations_by_load_codes($load_codes_api)->result();// TODO: traer solo load_api_code y id
            if (empty($stations)) {
                $this->output->set_status_header(400);
                return $this->response(["1m" => "Error: Ninguna estación coincide."]); // TODO: validar HTTP response code
            }

            $station_ids_by_load_code = [];
            $guardar_datos_api = [];
            foreach ($stations as $station) {
                $station_ids_by_load_code[$station->load_code_api] = $station->id;
            }
            $variables_rel_station = $this->Air_stations_rel_variables_model->get_all_related_variables(array_values($station_ids_by_load_code))->result(); // ???
            $response = ["1m" => []];
            // Mapear sigla_api a id_air_variable
            $sigla_api_to_id_air_variable = [];
            foreach ($variables_rel_station as $variable) {
                // Verificamos si la sigla es 'PM100' o 'PM10' y la modificamos
                if ($variable->sigla_api == 'PM100') {
                    $sigla_api_to_id_air_variable['pm100'] = $variable->id_air_variable;
                } elseif ($variable->sigla_api == 'PM10') {
                    $sigla_api_to_id_air_variable['pm10'] = $variable->id_air_variable;
                } else {
                    $sigla_api_to_id_air_variable[$variable->sigla_api] = $variable->id_air_variable;
                }
            }


            foreach ($array_data["1m"] as $station => $load_codes_api) {
                if (!isset($station_ids_by_load_code[$station])) {
                    $response["1m"][$station] = "Error: No se encontró la estación.";
                    continue;
                }

                $station_id = $station_ids_by_load_code[$station];
                $relevant_variables = $variables_rel_station[$station_id] ?? [];

                foreach ($load_codes_api as $timestamp => $sensor_values) {
                    // log_message('error', 'Valores de sensor_values: ' . json_encode($sensor_values) . ' y VALOR timestamp: ' . $timestamp);
                    // crear objeto DateTime con la zona horaria UTC
                    $dt = new DateTime("@$timestamp", new DateTimeZone('UTC')); // Crear un objeto DateTime con la zona horaria UTC
                    $dt->setTimeZone(new DateTimeZone('America/Santiago')); // Cambiar la zona horaria a Santiago de Chile

                    // guardar los datos
                    $data_variables = [];
                    foreach ($sensor_values as $sigla => $value) {
                        if (isset($sigla_api_to_id_air_variable[$sigla])) {

                            $id_air_variable = $sigla_api_to_id_air_variable[$sigla];
                            $data_variables[$id_air_variable] = (string)$value;

                        } else {
                            $data_variables[$sigla] = (string)$value;
                        }

                    }

                    // bucamos si ya existe un registro con el mismo timestamp y estación
                    $record = $this->Air_stations_values_1m_model->get_one_where(
                        array(
                            "id_station" => $station_id,
                            "timestamp" => $timestamp,
                            "deleted" => 0
                        )
                    );

                    if ($record->id) {
                        // con estas lineas se deberia actualizar el registro
                        $array_data_row = array(
                            "data" => json_encode($data_variables),
                            "modified" => get_current_utc_time(),
                            "modified_by" => 6 // API USER
                        );
                        $save_id_1m = $this->Air_stations_values_1m_model->save($array_data_row, $record->id);
                    } else {
                        // crea el registro si no existe
                        $array_data_row = array(
                            "id_station" => $station_id,
                            "timestamp" => $timestamp,
                            "date" => $dt->format('Y-m-d'),
                            "hour" => $dt->format('H'),
                            "minute" => $dt->format('i'),
                            "data" => json_encode($data_variables),
                            "created" => get_current_utc_time(),
                            "created_by" => 6 // API USER
                        );
                        $save_id_1m = $this->Air_stations_values_1m_model->save($array_data_row);

                    }
                }
            }
            // if ($save_id_1m) {
            if ($save_id_1m) {
                $response["success"] = true;
                return $this->response($response);
            } else {
                return $this->response(array("success" => false, "message" => "Info: No se ingresaron registros."));
            }
        }
    }


