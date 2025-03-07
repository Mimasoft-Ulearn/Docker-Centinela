<?php

class Project_members_model extends Crud_model {

    private $table = null;

    function __construct() {
        $this->table = 'project_members';
        parent::__construct($this->table);
    }

//NOT USED
    function save_member($data = array(), $id = 0) {
        $user_id = get_array_value($data, "user_id");
        $project_id = get_array_value($data, "project_id");
        if (!$user_id || !$project_id) {
            return false;
        }

        $exists = $this->get_one_where($where = array("user_id" => $user_id, "project_id" => $project_id));
        // print_r($exists);
        if ($exists->id && $exists->deleted == 0) {
            //already exists
            return "exists";
        } else if ($exists->id && $exists->deleted == 1) {
            //undelete the record
            if (parent::delete($exists->id, true)) {
                return $exists->id;
            }
        } else {
            //add new
            return parent::save($data, $id);
        }
    }

    function delete_members($project_id) {
        //don't delete the project leader
        $project_members_table = $this->db->dbprefix('project_members');
        $delete_members = "UPDATE $project_members_table SET $project_members_table.deleted=1 WHERE $project_members_table.project_id=$project_id; ";
        $this->db->query($delete_members);
    }
//NOT USED
    function get_details($options = array()) {
        $project_members_table = $this->db->dbprefix('project_members');
        $users_table = $this->db->dbprefix('users');

        $where = "";
        $id = get_array_value($options, "id");
        if ($id) {
            $where .= " AND $project_members_table.id=$id";
        }

        $project_id = get_array_value($options, "project_id");
        if ($project_id) {
            $where .= " AND $project_members_table.project_id=$project_id";
        }

        $sql = "SELECT $project_members_table.*, CONCAT($users_table.first_name, ' ',$users_table.last_name) AS member_name, $users_table.image as member_image, $users_table.job_title
        FROM $project_members_table
        LEFT JOIN $users_table ON $users_table.id= $project_members_table.user_id
        WHERE $project_members_table.deleted=0 $where";
        return $this->db->query($sql);
    }
//NOT USED
    function get_project_members_dropdown_list($project_id = 0) {
        $project_members_table = $this->db->dbprefix('project_members');
        $users_table = $this->db->dbprefix('users');

        $where = " AND $project_members_table.project_id=$project_id";

        $sql = "SELECT $project_members_table.user_id, CONCAT($users_table.first_name, ' ',$users_table.last_name) AS member_name
        FROM $project_members_table
        LEFT JOIN $users_table ON $users_table.id= $project_members_table.user_id
        WHERE $project_members_table.deleted=0 $where 
        GROUP BY $project_members_table.user_id";
        return $this->db->query($sql);
    }

    function is_user_a_project_member($project_id = 0, $user_id = 0) {
        $info = $this->get_one_where(array("project_id" => $project_id, "user_id" => $user_id, "deleted" => 0));
        if ($info->id) {
            return true;
        }
    }

	//Función implementada en projects controller
	function delete_project_members_related_to_project($id){
		
		$projects_members_table = $this->db->dbprefix('project_members');
		$sql = "DELETE FROM $projects_members_table WHERE";
		$sql .= " $projects_members_table.project_id = $id";
		
		if($this->db->query($sql)){
			return true;
		} else {
			return false;
		}
	}
	
	
	
	
	

}
