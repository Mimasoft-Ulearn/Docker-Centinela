<?php

class Client_waste_settings_model extends Crud_model {

    private $table = null;

    function __construct() {
		$this->load->helper('database');
        $this->table = 'client_waste_settings';
        parent::__construct($this->table);
    }
	
	function get_project_waste_settings($id_cliente, $id_proyecto){
	
		$materials_db = getFCBD();
		//$materials_db = 'dev_mimasoft_fc';
		$categorias_table = $this->load->database(getFCBD(), TRUE)->dbprefix('categorias');
		//$categorias_table = $this->load->database('dev_mimasoft_fc', TRUE)->dbprefix('categorias');
		$client_waste_settings_table = $this->db->dbprefix('client_waste_settings');
		
		$sql = "SELECT $client_waste_settings_table.*, $categorias_table.nombre";
		$sql.= " FROM $client_waste_settings_table, $materials_db.$categorias_table";
		$sql.= " WHERE $client_waste_settings_table.deleted = 0";
		$sql.= " AND $client_waste_settings_table.id_categoria = $categorias_table.id";
		$sql.= " AND $client_waste_settings_table.id_cliente = $id_cliente";
		$sql.= " AND $client_waste_settings_table.id_proyecto = $id_proyecto";
		//echo $sql;
		return $this->db->query($sql);
	}
	
	function get_categories_of_client_project($id_cliente, $id_proyecto){
		
		$projects_table = $this->db->dbprefix('projects');
		$form_rel_project_table = $this->db->dbprefix('formulario_rel_proyecto');
		$forms_table = $this->db->dbprefix('formularios');
		$form_rel_materials_rel_categories_table = $this->db->dbprefix('formulario_rel_materiales_rel_categorias');
		
		$sql = "SELECT $form_rel_materials_rel_categories_table.id_categoria";
		$sql.= " FROM $projects_table, $form_rel_project_table, $forms_table, $form_rel_materials_rel_categories_table";
		$sql.= " WHERE $projects_table.client_id = $id_cliente AND $projects_table.id = $id_proyecto AND $projects_table.deleted = 0";
		$sql.= " AND $form_rel_project_table.id_proyecto = $projects_table.id AND $form_rel_project_table.deleted = 0";
		$sql.= " AND $forms_table.id = $form_rel_project_table.id_formulario AND $forms_table.flujo = 'Residuo' AND $forms_table.deleted = 0";
		$sql.= " AND $form_rel_materials_rel_categories_table.id_formulario = $forms_table.id";
		//echo $sql;
		return $this->db->query($sql);
		
	}
	

}