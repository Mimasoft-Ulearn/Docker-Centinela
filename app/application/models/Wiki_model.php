<?php

class Wiki_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'wiki';
        parent::__construct($this->table);
    }
    
}