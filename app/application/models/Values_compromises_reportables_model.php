<?php

class Values_compromises_reportables_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'valores_compromisos_reportables';
        parent::__construct($this->table);
    }

    function get_details($options = array(), $order = array()) {
        
		$compromises_values_table = $this->db->dbprefix('valores_compromisos_reportables');
		$compromises_table = $this->db->dbprefix('compromisos_reportables');

        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where .= " AND $compromises_values_table.id = $id ";
        }
		
		$id_compromiso = get_array_value($options, "id_compromiso");
        if ($id_compromiso) {
            $where .= " AND $compromises_table.id = $id_compromiso ";
        }
        
        $this->db->query('SET SQL_BIG_SELECTS=1');
		
		$sql = "SELECT $compromises_table.id_proyecto, $compromises_values_table.*
				FROM $compromises_values_table, $compromises_table 
				WHERE $compromises_table.id = $compromises_values_table.id_compromiso
				AND $compromises_values_table.deleted = 0 
				$where 
				ORDER BY $compromises_values_table.created DESC";
		//var_dump($id_compromiso);
        return $this->db->query($sql);
    }
	
	function delete_values_compromises($id){
		
		$valores_compromisos_reportables = $this->db->dbprefix('valores_compromisos_reportables');
		
        $sql = "UPDATE $valores_compromisos_reportables SET $valores_compromisos_reportables.deleted=1 WHERE $valores_compromisos_reportables.id=$id; ";
        $this->db->query($sql);
	}

}