<div id="page-content" class="clearfix p20">

	<!--Breadcrumb section-->
    <nav class="breadcrumb"> 
		<a class="breadcrumb-item" href="<?php echo get_uri("inicio_projects"); ?>"><?php echo lang("projects"); ?> /</a>
		<a class="breadcrumb-item" href="<?php echo get_uri("dashboard/view/".$project_info->id); ?>"><?php echo $project_info->title; ?> /</a>
		<a class="breadcrumb-item" href=""><?php echo lang("air_forecast_performance"); ?> </a>
    </nav>

<?php if($puede_ver == 1) { ?> <!-- Se aplica la configuración de perfil (ver todos) -->
    
    <div class="panel">
    	<div class="panel-default">
			
			<?php foreach ($stations as $station) { ?>
				
				<div class="panel panel-default">
					<div class="page-title clearfix">
						<h1><?php echo lang("station")." ".$station->name; ?> | <?php echo lang("machine_learning_model"); ?> </h1>
							<div class="p15">
								<span class="help" data-container="body" data-toggle="tooltip" title="<?php echo lang('forecast_performanc_msj') ?>"><i class="fa fa-question-circle"></i></span>
							
							<div class="form-control-col-md-3 p5 pl15 pt0 pull-right">
								<button class="btn btn-default btn-update-monitoring" data-station-id="<?php echo $station->id; ?>">
									<span class="fa fa-refresh"  data-toggle="tooltip" title="<?= lang('tooltip_button_update') . ' ' . $station->name; ?>"></span> <?php // echo lang('update'); ?>
								</button>
							</div>
							</div>
						<div class="div_update_monitoring_data_info_<?php echo $station->id; ?> p5 pl15 text-off"></div>
					</div>

					<div class="panel-body p0">
						<div class="col-md-12">
							<div id="chart_ml_<?php echo $station->id; ?>" style="margin: 0 auto;">
								<div style="margin-top: 100px; text-align: center">
									<strong><?php echo lang("no_information_available"); ?></strong>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="page-title clearfix">
						<h1><?php echo lang("station")." ".$station->name; ?> | <?php echo lang("neuronal_model"); ?></h1>
						<div class="p15">
								<span class="help" data-container="body" data-toggle="tooltip" title="<?php echo lang('forecast_performanc_msj') ?>"><i class="fa fa-question-circle"></i></span>
							
							<div class="form-control-col-md-3 p5 pl15 pt0 pull-right">
								<button class="btn btn-default btn-update-monitoring" data-station-id="<?php echo $station->id; ?>">
									<span class="fa fa-refresh"  data-toggle="tooltip" title="<?= lang('tooltip_button_update') . ' ' . $station->name; ?>"></span> <?php // echo lang('update'); ?>
								</button>
							</div>
							</div>
						<div class="div_update_monitoring_data_info_<?php echo $station->id; ?> p5 pl15 text-off"></div>
					</div>
					<div class="panel-body p0">
						<div class="col-md-12">
							<div id="chart_neur_<?php echo $station->id; ?>" style="margin: 0 auto;">
								<div style="margin-top: 100px; text-align: center">
									<strong><?php echo lang("no_information_available"); ?></strong>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="page-title clearfix">
						<h1><?php echo lang("station")." ".$station->name; ?> | <?php echo lang("numerical_model"); ?></h1>
						<div class="p15">
								<span class="help" data-container="body" data-toggle="tooltip" title="<?php echo lang('forecast_performanc_msj') ?>"><i class="fa fa-question-circle"></i></span>
							
							<div class="form-control-col-md-3 p5 pl15 pt0 pull-right">
								<button class="btn btn-default btn-update-monitoring" data-station-id="<?php echo $station->id; ?>">
									<span class="fa fa-refresh"  data-toggle="tooltip" title="<?= lang('tooltip_button_update') . ' ' . $station->name; ?>"></span> <?php // echo lang('update'); ?>
								</button>
							</div>
							</div>
						<div class="div_update_monitoring_data_info_<?php echo $station->id; ?> p5 pl15 text-off"></div>
					</div>
					<div class="panel-body p0">
						<div class="col-md-12">
							<div id="chart_num_<?php echo $station->id; ?>" style="margin: 0 auto;">
								<div style="margin-top: 100px; text-align: center">
									<strong><?php echo lang("no_information_available"); ?></strong>
								</div>
							</div>
						</div>
					</div>
				</div>

			<?php } ?>
			
        </div>
    </div>
    
</div>

<?php } else { ?><!-- Se aplica la configuración de perfil (ver ninguno) -->

    <div class="row"> 
        <div class="col-md-12 col-sm-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div id="app-alert-d1via" class="app-alert alert alert-danger alert-dismissible m0" role="alert"><!--<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>-->
                        <div class="app-alert-message"><?php echo lang("content_disabled"); ?></div>
                        <div class="progress">
                            <div class="progress-bar progress-bar-danger hide" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </div>

<?php } ?><!-- Fin configuración de perfil (ver todos) -->

<script type="text/javascript">
    $(document).ready(function () {
		
		// GENERAL SETTINGS
		var decimals_separator = AppHelper.settings.decimalSeparator;
		var thousands_separator = AppHelper.settings.thousandSeparator;
		var decimal_numbers = AppHelper.settings.decimalNumbers;

		$('[data-toggle="tooltip"]').tooltip();

		let array_days_name = [
			'<?php echo lang("sunday"); ?>', 
			'<?php echo lang("monday"); ?>', 
			'<?php echo lang("tuesday"); ?>', 
			'<?php echo lang("wednesday"); ?>', 
			'<?php echo lang("thursday"); ?>', 
			'<?php echo lang("friday"); ?>', 
			'<?php echo lang("saturday"); ?>', 
		];

		let array_days_short_name = [
			'<?php echo lang("sun"); ?>', 
			'<?php echo lang("mon"); ?>', 
			'<?php echo lang("tue"); ?>', 
			'<?php echo lang("wed"); ?>', 
			'<?php echo lang("thu"); ?>', 
			'<?php echo lang("fri"); ?>', 
			'<?php echo lang("sat"); ?>', 
		];

		/* DATOS MONITOREO POR DEFECTO PARA TODOS LOS GRÁFICOS */
		var default_data_m = <?php echo json_encode($chart_default_data_m); ?>; // DATOS
		let chart_default_data_m = [];
		for(var i in default_data_m){
			chart_default_data_m.push([i,default_data_m[i]]);
		}
		/* FIN DATOS MONITOREO POR DEFECTO PARA TODOS LOS GRÁFICOS */

		<?php foreach ($stations as $station) { ?>

			(function(){ // Esto se hace para encapsular el alcance de las variables, para que no se sobre-escriban en cada interación

				// ALERTA (COLORES Y VALORES MÍNIMOS, USADOS PARA AMBOS MODELOS Y GRÁFICOS)
				var array_alerts = <?php echo json_encode($array_alerts[$station->id]); ?>;
				var code_api_sgs = <?php echo json_encode($code_api_sgs[$station->id]); ?>;

				// Highcharts.Tooltip.prototype.hide = function(){}; // MANTENER TOOLTIPS SIEMPRE VISIBLES CUANDO EL CURSOR ESTÁ FUERA DEL FOCO DEL GRÁFICO
				var chart_categories = []; // CATEGORÍAS (USADAS PARA AMBOS MODELOS Y GRÁFICOS)


				/* DATOS PRONÓSTICO MODELO MACHINE LEARNING */

				var chart_data_ml_model_p = []; // DATOS
				var chart_ranges_ml_model_p = []; // RANGOS
				var chart_timestamp_values_p_ml_model = []; // DATOS, KEY: TIMESTAMP, VALUE: VALOR (PARA SETEAR RANGOS)

				// DATOS PRONÓSTICO 72 HORAS HACIA ATRÁS
				var chart_ml_model_values_p = <?php echo json_encode($chart_ml_model_values_p[$station->id]); ?>;
				var chart_ml_model_ranges_p = <?php echo json_encode($chart_ml_model_ranges_p[$station->id]); ?>;
				var chart_ml_model_intervalo_confianza = <?php echo json_encode($chart_ml_model_intervalo_confianza[$station->id]); ?>;
				var chart_ml_model_porc_conf = <?php echo json_encode($chart_ml_model_porc_conf[$station->id]); ?>;
				var chart_ml_model_formatted_dates = <?php echo json_encode($chart_ml_model_formatted_dates[$station->id]); ?>;

				Object.keys(chart_ml_model_values_p).forEach(function(date, idx, array) {
					var values_p = chart_ml_model_values_p[date];

					var datetime = new Date(date);
					var day_name = array_days_name[datetime.getUTCDay()];
					var day_short_name = array_days_short_name[datetime.getUTCDay()];

					Object.keys(values_p).forEach(function(time) {
						var value_p = parseFloat(values_p[time]);
						var hour = time.substring(5, 7);

						chart_data_ml_model_p.push([chart_ml_model_formatted_dates[date]+" "+hour+":00 hrs", value_p]);
						
						
						var timestamp = new Date(date+" "+hour+":00:00").getTime()/1000;
						chart_timestamp_values_p_ml_model[timestamp] = value_p;
					});
				});

				Object.keys(chart_ml_model_ranges_p).forEach(function(date, idx, array) {
					var ranges_p = chart_ml_model_ranges_p[date];

					var datetime = new Date(date);
					var day_name = array_days_name[datetime.getUTCDay()];
					var day_short_name = array_days_short_name[datetime.getUTCDay()];

					Object.keys(ranges_p).forEach(function(time) {
						var range_p = ranges_p[time];

						var hour = time.substring(5, 7);
						var timestamp = new Date(date+" "+hour+":00:00").getTime()/1000;
						
						chart_ranges_ml_model_p[chart_timestamp_values_p_ml_model[timestamp]] = range_p;
					});
				});
				/* FIN DATOS PRONÓSTICO */

				$('#chart_ml_<?php echo $station->id; ?>').highcharts('StockChart', {
					chart: {
						height: 390,
						marginBottom: 40,
					},
					credits: {
						enabled: false
					},
					scrollbar: {
						enabled: false
					},
					rangeSelector: {
						enabled: false
					},
					tooltip: {
						//crosshairs: [true, true],
						formatter: function() {
							var texto_fecha = '<b><span>' + this.points[0].key; + '</span></b>';
							return [texto_fecha].concat(
								this.points ?
									this.points.map(function (point) {
										if(point.series.name == "<?php echo lang("forecast"); ?>") {

											return  '<b><span>' + point.series.name + '</span></b><br>'
											+ '<span>' + chart_ranges_ml_model_p[point.y] + " (" + "<?php echo $unit; ?>" + ")" + '</span><br>'
											+ '<span style="color:' + Highcharts.getOptions().colors[0] + '">\u25CF</span> ' + '<?php echo lang("confidence_interval"); ?>: '
											+ numberFormat(chart_ml_model_intervalo_confianza[point.x][0], decimal_numbers, decimals_separator, thousands_separator) + ' - ' 
											+ numberFormat(chart_ml_model_intervalo_confianza[point.x][1], decimal_numbers, decimals_separator, thousands_separator)
											+ ' (' + "<?php echo $unit; ?>" + ') <br>'
											+ '<span style="color:' + Highcharts.getOptions().colors[0] + '">\u25CF</span> ' + '<?php echo lang("reliability_alert_range"); ?>: '
											+ numberFormat(chart_ml_model_porc_conf[point.x], decimal_numbers, decimals_separator, thousands_separator) + '%';

										} else if(point.series.name == "<?php echo lang("real"); ?>"){
											return  '<b><span>' + point.series.name + '</span></b><br>'
											+ '<span>' + numberFormat(point.y, decimal_numbers, decimals_separator, thousands_separator) + " (" + "<?php echo $unit; ?>" + ")" + '</span>';
										} else {
											return false;
										}
									}) : []
							);
						},
						/*style: {
							fontSize: "30px"
						},*/
						useHTML: true,
						// valueDecimals: 2,
						split: true
					},
					exporting: {
						enabled: false
					},
					xAxis: {
						//crosshair: true
						crosshair: {
							id: 'plot-line-1',
							width: 1,
							color: 'black',
							//dashStyle: 'shortdot'
						},
						//type: 'datetime',
						labels: {
							formatter: function() {
								if(this.pos > 47){
									return '<span style="color:black;font-weight:bold;">'+chart_categories[this.value]+'</span>';
								}else{
									return chart_categories[this.value];
								}
							}
						},
						plotBands: [	//Franjas de color por turno
							{from: 0, to: 8, color: '#F0F0F0'},
							{from: 8, to: 20, color: '#F7F7F7'},
							{from: 20, to: 32, color: '#F0F0F0'},
							{from: 32, to: 44, color: '#F7F7F7'},
							{from: 44, to: 56, color: '#F0F0F0'},
							{from: 56, to: 68, color: '#F7F7F7'},
							{from: 68, to: 71, color: '#F0F0F0'},
						],
						tickInterval: 1,
					},
					yAxis: [{
						labels: {
							formatter: function () {
								//return numberFormat(this.value, decimal_numbers, decimals_separator, thousands_separator) + "<?php echo $unit; ?>";
								//return (this.value > 0 ? '+' : '') + this.value + '%';
							}
						},
						lineColor: 'silver',
						//lineWidth: 1,
						min: 0,
						// max: 500,
						// tickInterval: 100
					}, {
						labels: {
							formatter: function () {
								return numberFormat(this.value, decimal_numbers, decimals_separator, thousands_separator) /*+ " <?php echo $unit; ?>"*/;
								//return this.value;
							}
						},
						lineColor: 'silver',
						//lineWidth: 1,
						linkedTo: 0,
						opposite: false,
						/*plotLines: [{
							value: 0,
							width: 2,
							color: 'silver'
						}],*/
						min: 0,
						// max: 500,
						// tickInterval: 100
					}],
					legend: {
						enabled: true,
						// y: -20,
						// floating: true
					},
					plotOptions: {
						series: {
							lineWidth: 1,
							states: {
								hover: {
									enabled: true,
									lineWidth: 1
								}
							},
							//compare: 'percent'
							//showInNavigator: true,
							connectNulls: false,
							marker: {
								enabled: true,
								radius: 4
							},
						}
					},
					series: [
						{
							accessibility: {
								keyboardNavigation: {
									enabled: false
								}
							},
							data: chart_default_data_m,
							//lineColor: Highcharts.getOptions().colors[1],
							color: '#000000',
							fillOpacity: 0, // TRANSPARENCIA PARA EL ÁREA
							name: '<?php echo lang("real") ?>',
							// zones: array_alerts,
							marker: {
								radius: 3
							}
						},
						{
							accessibility: {
								keyboardNavigation: {
									enabled: false
								}
							},
							data: chart_data_ml_model_p,
							//lineColor: Highcharts.getOptions().colors[1],
							//color: '#ff5454',
							fillOpacity: 0, // TRANSPARENCIA PARA EL ÁREA
							name: '<?php echo lang("forecast"); ?>',
							zones: array_alerts,
							marker: {
								radius: 3
							}
						}
					]
				});

				$('#chart_ml_<?php echo $station->id; ?>').highcharts().addSeries({
					name: 'Range',
					data: chart_ml_model_intervalo_confianza,
					type: 'arearange',
					lineWidth: 0,
					linkedTo: ':previous',
					color: Highcharts.getOptions().colors[0],
					fillOpacity: 0.3,
					zIndex: 0,
					marker: {
						enabled: false
					}
				});

				/* FIN DATOS PRONÓSTICO MODELO MACHINE LEARNING */



				/* DATOS PRONÓSTICO MODELO NEURONAL */
				var chart_data_neur_model_p = []; // DATOS
				var chart_ranges_neur_model_p = []; // RANGOS
				var chart_timestamp_values_neur_model_p = []; // DATOS, KEY: TIMESTAMP, VALUE: VALOR (PARA SETEAR RANGOS)

				// DATOS PRONÓSTICO 72 HORAS HACIA ATRÁS
				var chart_neur_model_values_p = <?php echo json_encode($chart_neur_model_values_p[$station->id]); ?>;
				var chart_neur_model_ranges_p = <?php echo json_encode($chart_neur_model_ranges_p[$station->id]); ?>;
				var chart_neur_model_intervalo_confianza = <?php echo json_encode($chart_neur_model_intervalo_confianza[$station->id]); ?>;
				var chart_neur_model_porc_conf = <?php echo json_encode($chart_neur_model_porc_conf[$station->id]); ?>;
				var chart_neur_formatted_dates = <?php echo json_encode($chart_neur_formatted_dates[$station->id]); ?>;

				Object.keys(chart_neur_model_values_p).forEach(function(date, idx, array) {
					var values_p = chart_neur_model_values_p[date];

					var datetime = new Date(date);
					var day_name = array_days_name[datetime.getUTCDay()];
					var day_short_name = array_days_short_name[datetime.getUTCDay()];

					Object.keys(values_p).forEach(function(time) {
						var value_p = parseFloat(values_p[time]);
						var hour = time.substring(5, 7);

						chart_data_neur_model_p.push([chart_neur_formatted_dates[date]+" "+hour+":00 hrs", value_p]);
						chart_categories.push(day_short_name+" "+hour+" hrs");
						
						var timestamp = new Date(date+" "+hour+":00:00").getTime()/1000;
						chart_timestamp_values_neur_model_p[timestamp] = value_p;
					});
				});

				Object.keys(chart_neur_model_ranges_p).forEach(function(date, idx, array) {
					var ranges_p = chart_neur_model_ranges_p[date];

					var datetime = new Date(date);
					var day_name = array_days_name[datetime.getUTCDay()];
					var day_short_name = array_days_short_name[datetime.getUTCDay()];

					Object.keys(ranges_p).forEach(function(time) {
						var range_p = ranges_p[time];

						var hour = time.substring(5, 7);
						var timestamp = new Date(date+" "+hour+":00:00").getTime()/1000;
						
						chart_ranges_neur_model_p[chart_timestamp_values_neur_model_p[timestamp]] = range_p;
					});
				});
				/* FIN DATOS PRONÓSTICO */

				$('#chart_neur_<?php echo $station->id; ?>').highcharts('StockChart', {
					chart: {
						height: 390,
						marginBottom: 40,
					},
					credits: {
						enabled: false
					},
					scrollbar: {
						enabled: false
					},
					rangeSelector: {
						enabled: false
					},
					tooltip: {
						//crosshairs: [true, true],
						formatter: function() {
							var texto_fecha = '<b><span>' + this.points[0].key; + '</span></b>';
							return [texto_fecha].concat(
								this.points ?
									this.points.map(function (point) {
										if(point.series.name == "<?php echo lang("forecast"); ?>") {

											return  '<b><span>' + point.series.name + '</span></b><br>'
											+ '<span>' + chart_ranges_neur_model_p[point.y] + " (" + "<?php echo $unit; ?>" + ")" + '</span><br>'
											+ '<span style="color:' + Highcharts.getOptions().colors[0] + '">\u25CF</span> ' + '<?php echo lang("confidence_interval"); ?>: '
											+ numberFormat(chart_neur_model_intervalo_confianza[point.x][0], decimal_numbers, decimals_separator, thousands_separator) + ' - ' 
											+ numberFormat(chart_neur_model_intervalo_confianza[point.x][1], decimal_numbers, decimals_separator, thousands_separator)
											+ ' (' + "<?php echo $unit; ?>" + ') <br>'
											+ '<span style="color:' + Highcharts.getOptions().colors[0] + '">\u25CF</span> ' + '<?php echo lang("reliability_alert_range"); ?>: '
											+ numberFormat(chart_neur_model_porc_conf[point.x], decimal_numbers, decimals_separator, thousands_separator) + '%';

										} else if(point.series.name == "<?php echo lang("real"); ?>"){
											return  '<b><span>' + point.series.name + '</span></b><br>'
											+ '<span>' + numberFormat(point.y, decimal_numbers, decimals_separator, thousands_separator) + " (" + "<?php echo $unit; ?>" + ")" + '</span>';
										} else {
											return false;
										}
									}) : []
							);
						},
						/*style: {
							fontSize: "30px"
						},*/
						useHTML: true,
						// valueDecimals: 2,
						split: true
					},
					exporting: {
						enabled: false
					},
					xAxis: {
						//crosshair: true
						crosshair: {
							id: 'plot-line-1',
							width: 1,
							color: 'black',
							//dashStyle: 'shortdot'
						},
						//type: 'datetime',
						labels: {
							formatter: function() {
								if(this.pos > 47){
									return '<span style="color:black;font-weight:bold;">'+chart_categories[this.value]+'</span>';
								}else{
									return chart_categories[this.value];
								}
							}
						},
						plotBands: [	//Franjas de color por turno
							{from: 0, to: 8, color: '#F0F0F0'},
							{from: 8, to: 20, color: '#F7F7F7'},
							{from: 20, to: 32, color: '#F0F0F0'},
							{from: 32, to: 44, color: '#F7F7F7'},
							{from: 44, to: 56, color: '#F0F0F0'},
							{from: 56, to: 68, color: '#F7F7F7'},
							{from: 68, to: 71, color: '#F0F0F0'},
						],
						tickInterval: 1,
					},
					yAxis: [{
						labels: {
							formatter: function () {
								//return numberFormat(this.value, decimal_numbers, decimals_separator, thousands_separator) + "<?php echo $unit; ?>";
								//return (this.value > 0 ? '+' : '') + this.value + '%';
							}
						},
						lineColor: 'silver',
						//lineWidth: 1,
						min: 0,
						// max: 500,
						// tickInterval: 100
					}, {
						labels: {
							formatter: function () {
								return numberFormat(this.value, decimal_numbers, decimals_separator, thousands_separator) /*+ " <?php echo $unit; ?>"*/;
								//return this.value;
							}
						},
						lineColor: 'silver',
						//lineWidth: 1,
						linkedTo: 0,
						opposite: false,
						/*plotLines: [{
							value: 0,
							width: 2,
							color: 'silver'
						}],*/
						min: 0,
						// max: 500,
						// tickInterval: 100
					}],
					legend: {
						enabled: true,
						// y: -20,
						// floating: true
					},
					plotOptions: {
						series: {
							lineWidth: 1,
							states: {
								hover: {
									enabled: true,
									lineWidth: 1
								}
							},
							//compare: 'percent'
							//showInNavigator: true,
							connectNulls: false,
							marker: {
								enabled: true,
								radius: 4
							},
						}
					},
					series: [
						{
							accessibility: {
								keyboardNavigation: {
									enabled: false
								}
							},
							data: chart_default_data_m,
							//lineColor: Highcharts.getOptions().colors[1],
							color: '#000000',
							fillOpacity: 0, // TRANSPARENCIA PARA EL ÁREA
							name: '<?php echo lang("real") ?>',
							// zones: array_alerts,
							marker: {
								radius: 3
							}
						},
						{
							accessibility: {
								keyboardNavigation: {
									enabled: false
								}
							},
							data: chart_data_neur_model_p,
							//lineColor: Highcharts.getOptions().colors[1],
							//color: '#ff5454',
							fillOpacity: 0, // TRANSPARENCIA PARA EL ÁREA
							name: '<?php echo lang("forecast"); ?>',
							zones: array_alerts,
							marker: {
								radius: 3
							}
						}
					]
				});

				$('#chart_neur_<?php echo $station->id; ?>').highcharts().addSeries({
					name: 'Range',
					data: chart_neur_model_intervalo_confianza,
					type: 'arearange',
					lineWidth: 0,
					linkedTo: ':previous',
					color: Highcharts.getOptions().colors[0],
					fillOpacity: 0.3,
					zIndex: 0,
					marker: {
						enabled: false
					}
				});

				/* FIN DATOS PRONÓSTICO MODELO NEURONAL */


				/* DATOS PRONÓSTICO MODELO NUMÉRICO */
				var chart_data_num_model_p = []; // DATOS
				var chart_ranges_num_model_p = []; // RANGOS
				var chart_timestamp_values_num_model_p = []; // DATOS, KEY: TIMESTAMP, VALUE: VALOR (PARA SETEAR RANGOS)

				// DATOS PRONÓSTICO 72 HORAS HACIA ATRÁS
				var chart_num_model_values_p = <?php echo json_encode($chart_num_model_values_p[$station->id]); ?>;
				var chart_num_model_ranges_p = <?php echo json_encode($chart_num_model_ranges_p[$station->id]); ?>;
				var chart_num_model_intervalo_confianza = <?php echo json_encode($chart_num_model_intervalo_confianza[$station->id]); ?>;
				var chart_num_model_porc_conf = <?php echo json_encode($chart_num_model_porc_conf[$station->id]); ?>;
				var chart_num_formatted_dates = <?php echo json_encode($chart_num_formatted_dates[$station->id]); ?>;

				Object.keys(chart_num_model_values_p).forEach(function(date, idx, array) {
					var values_p = chart_num_model_values_p[date];

					var datetime = new Date(date);
					var day_name = array_days_name[datetime.getUTCDay()];
					var day_short_name = array_days_short_name[datetime.getUTCDay()];

					Object.keys(values_p).forEach(function(time) {
						var value_p = parseFloat(values_p[time]);
						var hour = time.substring(5, 7);

						chart_data_num_model_p.push([chart_num_formatted_dates[date]+" "+hour+":00 hrs", value_p]);
						chart_categories.push(day_short_name+" "+hour+" hrs");
						
						var timestamp = new Date(date+" "+hour+":00:00").getTime()/1000;
						chart_timestamp_values_num_model_p[timestamp] = value_p;
					});
				});

				Object.keys(chart_num_model_ranges_p).forEach(function(date, idx, array) {
					var ranges_p = chart_num_model_ranges_p[date];

					var datetime = new Date(date);
					var day_name = array_days_name[datetime.getUTCDay()];
					var day_short_name = array_days_short_name[datetime.getUTCDay()];

					Object.keys(ranges_p).forEach(function(time) {
						var range_p = ranges_p[time];

						var hour = time.substring(5, 7);
						var timestamp = new Date(date+" "+hour+":00:00").getTime()/1000;
						
						chart_ranges_num_model_p[chart_timestamp_values_num_model_p[timestamp]] = range_p;
					});
				});
				/* FIN DATOS PRONÓSTICO */

				$('#chart_num_<?php echo $station->id; ?>').highcharts('StockChart', {
					chart: {
						height: 390,
						marginBottom: 40,
					},
					credits: {
						enabled: false
					},
					scrollbar: {
						enabled: false
					},
					rangeSelector: {
						enabled: false
					},
					tooltip: {
						//crosshairs: [true, true],
						formatter: function() {
							var texto_fecha = '<b><span>' + this.points[0].key; + '</span></b>';
							return [texto_fecha].concat(
								this.points ?
									this.points.map(function (point) {
										if(point.series.name == "<?php echo lang("forecast"); ?>") {

											return  '<b><span>' + point.series.name + '</span></b><br>'
											+ '<span>' + chart_ranges_num_model_p[point.y] + " (" + "<?php echo $unit; ?>" + ")" + '</span><br>'
											+ '<span style="color:' + Highcharts.getOptions().colors[0] + '">\u25CF</span> ' + '<?php echo lang("confidence_interval"); ?>: '
											+ numberFormat(chart_num_model_intervalo_confianza[point.x][0], decimal_numbers, decimals_separator, thousands_separator) + ' - ' 
											+ numberFormat(chart_num_model_intervalo_confianza[point.x][1], decimal_numbers, decimals_separator, thousands_separator)
											+ ' (' + "<?php echo $unit; ?>" + ') <br>'
											+ '<span style="color:' + Highcharts.getOptions().colors[0] + '">\u25CF</span> ' + '<?php echo lang("reliability_alert_range"); ?>: '
											+ numberFormat(chart_num_model_porc_conf[point.x], decimal_numbers, decimals_separator, thousands_separator) + '%';

										} else if(point.series.name == "<?php echo lang("real"); ?>"){
											return  '<b><span>' + point.series.name + '</span></b><br>'
											+ '<span>' + numberFormat(point.y, decimal_numbers, decimals_separator, thousands_separator) + " (" + "<?php echo $unit; ?>" + ")" + '</span>';
										} else {
											return false;
										}
									}) : []
							);
						},
						/*style: {
							fontSize: "30px"
						},*/
						useHTML: true,
						// valueDecimals: 2,
						split: true
					},
					exporting: {
						enabled: false
					},
					xAxis: {
						//crosshair: true
						crosshair: {
							id: 'plot-line-1',
							width: 1,
							color: 'black',
							//dashStyle: 'shortdot'
						},
						//type: 'datetime',
						labels: {
							formatter: function() {
								if(this.pos > 47){
									return '<span style="color:black;font-weight:bold;">'+chart_categories[this.value]+'</span>';
								}else{
									return chart_categories[this.value];
								}
							}
						},
						plotBands: [	//Franjas de color por turno
							{from: 0, to: 8, color: '#F0F0F0'},
							{from: 8, to: 20, color: '#F7F7F7'},
							{from: 20, to: 32, color: '#F0F0F0'},
							{from: 32, to: 44, color: '#F7F7F7'},
							{from: 44, to: 56, color: '#F0F0F0'},
							{from: 56, to: 68, color: '#F7F7F7'},
							{from: 68, to: 71, color: '#F0F0F0'},
						],
						tickInterval: 1,
					},
					yAxis: [{
						labels: {
							formatter: function () {
								//return numberFormat(this.value, decimal_numbers, decimals_separator, thousands_separator) + "<?php echo $unit; ?>";
								//return (this.value > 0 ? '+' : '') + this.value + '%';
							}
						},
						lineColor: 'silver',
						//lineWidth: 1,
						min: 0,
						// max: 500,
						// tickInterval: 100
					}, {
						labels: {
							formatter: function () {
								return numberFormat(this.value, decimal_numbers, decimals_separator, thousands_separator) /*+ " <?php echo $unit; ?>"*/;
								//return this.value;
							}
						},
						lineColor: 'silver',
						//lineWidth: 1,
						linkedTo: 0,
						opposite: false,
						/*plotLines: [{
							value: 0,
							width: 2,
							color: 'silver'
						}],*/
						min: 0,
						// max: 500,
						// tickInterval: 100
					}],
					legend: {
						enabled: true,
						// y: -20,
						// floating: true
					},
					plotOptions: {
						series: {
							lineWidth: 1,
							states: {
								hover: {
									enabled: true,
									lineWidth: 1
								}
							},
							//compare: 'percent'
							//showInNavigator: true,
							connectNulls: false,
							marker: {
								enabled: true,
								radius: 4
							},
						}
					},
					series: [
						{
							accessibility: {
								keyboardNavigation: {
									enabled: false
								}
							},
							data: chart_default_data_m,
							//lineColor: Highcharts.getOptions().colors[1],
							color: '#000000',
							fillOpacity: 0, // TRANSPARENCIA PARA EL ÁREA
							name: '<?php echo lang("real") ?>',
							// zones: array_alerts,
							marker: {
								radius: 3
							}
						},
						{
							accessibility: {
								keyboardNavigation: {
									enabled: false
								}
							},
							data: chart_data_num_model_p,
							//lineColor: Highcharts.getOptions().colors[1],
							//color: '#ff5454',
							fillOpacity: 0, // TRANSPARENCIA PARA EL ÁREA
							name: '<?php echo lang("forecast"); ?>',
							zones: array_alerts,
							marker: {
								radius: 3
							}
						}
					]
				});

				$('#chart_num_<?php echo $station->id; ?>').highcharts().addSeries({
					name: 'Range',
					data: chart_num_model_intervalo_confianza,
					type: 'arearange',
					lineWidth: 0,
					linkedTo: ':previous',
					color: Highcharts.getOptions().colors[0],
					fillOpacity: 0.3,
					zIndex: 0,
					marker: {
						enabled: false
					}
				});

				/* FIN DATOS PRONÓSTICO MODELO NUMÉRICO */

				

				/* TRAER DATOS DE MONITOREO DESDE APIs */
				//pasar el id station
				
				function get_monitoring_data(station_id) {
    				var url;
    				var dataToSend;

    				// Determinar la URL y los datos según el ID de la estación
    				switch (station_id) {
						case 2:

            				url = '<?php echo_uri("Air_forecast_performance/get_meteodata_monitoring_data"); ?>';
            				dataToSend = { api_station_code: "mlp_es_hm", station_id: station_id };
            			break;

        				case 13:
            				url = '<?php echo_uri("Air_forecast_performance/get_meteodata_monitoring_data"); ?>';
            				dataToSend = { api_station_code: "mlp_es_tranqcor_mp10", station_id: station_id };
            			break;
        				default:
            			url = '<?php echo_uri("Air_forecast_performance/get_sgs_monitoring_data"); ?>';
            			dataToSend = { api_station_code: code_api_sgs, station_id: station_id };
            			break;
    				}

					// Realizar la solicitud AJAX
					$.ajax({
						url: url,
						data: dataToSend,
						type: 'post',
						dataType: 'json',
						beforeSend: function() {
							$(".div_update_monitoring_data_info_" + station_id).html('<i class="fa fa-refresh fa-spin"></i> Obteniendo datos de monitoreo...');
						},
						success: function(result) {
							if (result.success) {
								let chart_data_m = [];
								for (var i in result.data) {
									chart_data_m.push([i, result.data[i]]);
								}
								$('#chart_ml_' + station_id).highcharts().series[0].setData(chart_data_m, false);
								$('#chart_ml_' + station_id).highcharts().redraw();
								$('#chart_neur_' + station_id).highcharts().series[0].setData(chart_data_m, false);
								$('#chart_neur_' + station_id).highcharts().redraw();
								$('#chart_num_' + station_id).highcharts().series[0].setData(chart_data_m, false);
								$('#chart_num_' + station_id).highcharts().redraw();
							}

							$(".div_update_monitoring_data_info_" + station_id).html(result.message);
						}
					});
					
				}
			
				$(document).ready(function() {
					//ejecutar al cargar la página
					// $('.btn-update-monitoring').each(function() {
					// 	var station_id = $(this).data('station-id');
					// 	get_monitoring_data(station_id);
					// });

					//ejecutar al presionar cualquier botón
					$(document).on('click', '.btn-update-monitoring', function() {
						var station_id = $(this).data('station-id');
						// Verificar si la estación ya se está actualizando
						var isUpdating = $(".div_update_monitoring_data_info_" + station_id).html().includes('fa fa-refresh fa-spin');
						if (!isUpdating) {
							get_monitoring_data(station_id);
						}
					});
				});

				get_monitoring_data(<?php echo $station->id; ?>);

				//FUNCIONA PERO LLAM 5 VECES AL AJAX
				/* $(document).ready(function() {
    				//iterar sobre todos los botones con la clase .btn-update-monitoring
    				$('.btn-update-monitoring').each(function() {
        			var station_id = $(this).data('station-id');
        			get_monitoring_data(station_id);
    				});
				}); 

				//mantener el evento click para los botones existentes
				$(document).on('click', '.btn-update-monitoring', function() {
					var station_id = $(this).data('station-id');
					get_monitoring_data(station_id);
				});
				 */

			

				//get_monitoring_data(station_id); // SE EJECUTA AL INGRESAR AL MÓDULO Y CADA 10 MINUTOS
				/* FIN TRAER DATOS DE MONITOREO DESDE APIs */

				
				// OCULTAR NAVEGADOR EN AMBOS GRÁFICOS
				$(".highcharts-navigator, .highcharts-areaspline-series, .highcharts-navigator-xaxis, .highcharts-navigator-yaxis").remove();
				$('#chart_ml_<?php echo $station->id; ?>, #chart_neur_<?php echo $station->id; ?>, #chart_num_<?php echo $station->id; ?>').highcharts().reflow();


			})();

		<?php } ?>	

    });
</script>
