<?php

class AYN_Alert_projects_users_model extends Crud_model {

    private $table = null;
	
    function __construct() {
        $this->table = 'ayn_alert_projects_users';
        parent::__construct($this->table);
    }
	
}