<div id="page-content" class="p20 clearfix">

<!--Breadcrumb section-->
<nav class="breadcrumb">
  <a class="breadcrumb-item" href="<?php echo get_uri("inicio_projects"); ?>"><?php echo lang("projects"); ?> /</a>
  <a class="breadcrumb-item" href="<?php echo get_uri("dashboard/view/".$project_info->id); ?>"><?php echo $project_info->title; ?> /</a>
  <a class="breadcrumb-item" href="#"><?php echo lang("permittings"); ?> /</a>
  <a class="breadcrumb-item" href=""><?php echo lang("permittings_evaluation"); ?></a>
</nav>

<?php if($puede_ver == 1) { ?>

    <div class="panel panel-default m0">  
    	<div class="page-title clearfix">
            <h1><?php echo lang("permittings_evaluation"); ?></h1>
        </div>
		<div class="panel-body">
        	<!--
        	<div class="col-sm-2 col-md-2 col-lg-2">
            	<i class="fa fa-wrench"></i> Configuración de la aplicación
            </div>   
            -->        
            <div class="col-sm-12 col-md-12 col-lg-12 p0">           	
                
                <div class="col-md-4 p0">
                    <label for="evaluated" class="col-md-2"><?php echo lang('evaluated'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_dropdown("evaluated", $evaluados, "", "id='evaluated' class='select2 validate-hidden col-md-12' data-sigla='' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
                        ?>
                    </div>
                </div>

				<div id="permisos_group">
                    <div class="col-md-4 p0">
                        <label for="permitting" class="col-md-2 p0"><?php echo lang('permission'); ?></label>
                        <div class="col-md-10">
                            <?php
                            echo form_dropdown("permitting", $permisos, "", "id='permitting' class='select2 validate-hidden col-md-12' data-sigla='' data-rule-required='true', data-msg-required='" . lang('field_required') . "'");
                            ?>
                        </div>
                    </div>  
                </div> 
                            
            </div> 
     
        </div>
    </div> 
</div>
<div id="evaluation_table"></div>

<?php } else { ?>

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

<?php } ?>


<script type="text/javascript">

	$(document).ready(function(){
	
		var id_permiso_proyecto = '<?php echo $id_permiso_proyecto; ?>';
		
		$('#evaluated').select2();
		$('#permitting').select2();
		
		$('#evaluated').change(function(){	
					
			var id_evaluado = $(this).val();
			var id_valor_permiso = $('#permitting').val();
			
			$.ajax({
				url:  '<?php echo_uri("permitting_procedure_evaluation/get_evaluation_table_of_permitting") ?>',
				type:  'post',
				data: {id_evaluado:id_evaluado, id_valor_permiso:id_valor_permiso, id_permiso_proyecto:id_permiso_proyecto},
				//dataType:'json',
				success: function(respuesta){
					$('#evaluation_table').html(respuesta);	
					
				}
			});
			
		});
		
		$('#permitting').change(function(){	
						
			var id_evaluado = $('#evaluated').val();
			var id_valor_permiso = $(this).val();
			
			$.ajax({
				url:  '<?php echo_uri("permitting_procedure_evaluation/get_evaluation_table_of_permitting"); ?>',
				type:  'post',
				data: {id_evaluado:id_evaluado, id_valor_permiso:id_valor_permiso, id_permiso_proyecto:id_permiso_proyecto},
				//dataType:'json',
				success: function(respuesta){
					$('#evaluation_table').html(respuesta);	
				}
			});
			
		});	
		
		$('[data-toggle="tooltip"]').tooltip();
		
	});
	
</script>