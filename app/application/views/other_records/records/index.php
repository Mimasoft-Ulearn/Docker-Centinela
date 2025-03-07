<div id="page-content" class="p20 clearfix">

<!--Breadcrumb section-->
    <nav class="breadcrumb">
      <a class="breadcrumb-item" href="<?php echo get_uri("inicio_projects"); ?>"><?php echo lang("projects"); ?> /</a>
      <a class="breadcrumb-item" href="<?php echo get_uri("dashboard/view/".$project_info->id); ?>"><?php echo $project_info->title; ?> /</a>
      <a class="breadcrumb-item" href="<?php echo get_uri("other_records");?>"><?php echo lang("other_records"); ?> /</a>
      <a class="breadcrumb-item" href=""><?php echo $record_info->nombre; ?></a>
    </nav>

<?php if($puede_ver != 3) { ?>

	<div class="row">
    	<div class="col-md-12">
        
        	<div class="page-title clearfix">
            	<h1><i class="fa fa-table" title="Abierto"></i> <?php echo $record_info->nombre; ?></h1>
            </div>
            
            <?php
            $icono = $record_info->icono?get_file_uri("assets/images/icons/".$record_info->icono):get_file_uri("assets/images/icons/empty.png");
			$descripcion = $record_info->descripcion;
			?>
            
            <div class="row" style="background-color:#E5E9EC;">
                <div class="col-md-4">
                	<div class="row">
                    	<div class="col-md-12 col-sm-12">
                        <div class="panel">
                        <div class="panel-heading panel-sky p30"></div>
                        <div class="clearfix text-center">
                        <span class="mt-50 avatar avatar-md chart-circle border-circle">
                        <img src="<?php echo $icono; ?>" alt="..." style="background-color:#FFF;" class="mCS_img_loaded">
                        </span>
                        </div>
                        <div class="p10 b-t b-b"><?php echo lang("number_of_records") . ': ' ?> <span id="num_registros"> <?php echo $num_registros; ?> </span> </div>
                        <div class="p10 b-b"><?php echo lang("modified_date") . ': ' ?> <span id="fecha_modificacion"> <?php echo ($fecha_modificacion)?time_date_zone_format($fecha_modificacion,$project_info->id):"-"; ?> </span> </div>
                        </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-8">
                	<div class="row">
                    	<div class="col-md-12 col-sm-12">
                        <div class="panel">
                        <div class="tab-title clearfix">
                            <h4><?php echo lang("description"); ?></h4>
                        </div>
                        <div class="p15" align="justify">
                        	<?php echo $descripcion; ?>
                        </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
              
              
    
            <div class="panel panel-default">
                <div class="page-title clearfix panel-sky">
                	<?php
					if(strlen($record_info->nombre) > 25){
						$record_name = substr($record_info->nombre, 0, 25).'...<i class="fa fa-info-circle" data-container="body" data-toggle="tooltip" title="'.$record_info->nombre.'"></i>';
					}else{
						$record_name = $record_info->nombre;
					}
					?>
                    <h1><?php echo $record_name; ?></h1>
                    <div class="title-button-group">
						<?php 
                            if($puede_eliminar != 3){ // 3 = Perfil Eliminar Ninguno 
                                echo '<span style="cursor: not-allowed;">'.js_anchor("<i class='fa fa-trash'></i> ".lang("delete_selected"), array('title' => lang('delete_other_records'), "id" => "delete_selected_rows", "class" => "delete btn btn-danger", "data-action" => "delete-confirmation", "data-custom" => true, "disabled" => "disabled", "style" => "pointer-events: none;")).'</span>';
                            } 
                        ?>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-success" id="excel"><i class='fa fa-table'></i> <?php echo lang('export_to_excel')?></button>
                        </div> 
                    	<?php
						if(strlen($record_info->nombre) > 25){
							$button_text = lang('add').' '.substr($record_info->nombre, 0, 25).'...';
						}else{
							$button_text = lang('add').' '.$record_info->nombre;
						}
						
						if (!$record_info->fijo) {
							echo modal_anchor(get_uri("other_records/modal_form/".$record_info->id), "<i class='fa fa-plus-circle'></i> " . $button_text, array("id" => "agregar_elemento", "class" => "btn btn-default", "title" => lang('add').' '.$record_info->nombre));
						} else { // Si el formulario es fijo
							echo modal_anchor(get_uri("other_records/modal_form_fixed_form/".$record_info->id), "<i class='fa fa-plus-circle'></i> " . $button_text, array("id" => "agregar_elemento", "class" => "btn btn-default", "title" => lang('add').' '.$record_info->nombre));
						}
						?>
                    </div>
                </div>
                <div class="table-responsive">
                    <table id="other_records-table" class="display" cellspacing="0" width="100%">            
                    </table>
                </div>
            </div>
            
            
        </div>
        
        
    </div>
    
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
        $(document).ready(function () {
			
			$('[data-toggle="tooltip"]').tooltip();
			
			<?php if(!$record_info->fijo) { ?>
				
				$("#other_records-table").appTable({
					source: '<?php echo_uri("other_records/list_data/".$record_info->id); ?>',
					columns: [
					
						<?php if($puede_eliminar != 3){ // 3 = Perfil Eliminar Ninguno ?>
					
							{
								checkboxes: {
									selectRow: true,
									selectCallback: function(){
										get_selected_rows();
									}
								},
								select: {
									style: 'multi'
								},
								render: function(data, type, row, meta){ 
		
									data = "";
									if(row[2] == 1){ // 1 = Perfil Eliminar Todos
										data = '<input type="checkbox" class="dt-checkboxes">'
									}
									if(row[2] == 2){ // 2 = Perfil Eliminar Propios
										if(row[1] == <?php echo $this->session->user_id; ?>){
											data = '<input type="checkbox" class="dt-checkboxes">'
										} else {
											data = '<input type="checkbox" class="dt-checkboxes" disabled>'
										}
									}
									if(row[2] == 3){ // 3 = Perfil Eliminar Ninguno
										data = '<input type="checkbox" class="dt-checkboxes" disabled>'
									}
									
									return data;
								   
								},
								createdCell:  function (td, cellData, rowData, row, col){
		
									if(rowData[2] == 2){ // 2 = Perfil Eliminar Propios
										if(rowData[1] != <?php echo $this->session->user_id; ?>){
											this.api().cell(td).checkboxes.disable();
										}
									}
									if(rowData[2] == 3){ // 3 = Perfil Eliminar Ninguno
										this.api().cell(td).checkboxes.disable();
									}
									
									this.api().cell(td).checkboxes.deselect();
		
								}
								
							},
						
						<?php } ?>
					
						{title: "<?php echo lang("id"); ?>", "class": "text-center w50 hide"},
						{title: "<?php echo lang("created_by"); ?>", "class": "text-center w50 hide"},
						{title: "<?php echo lang("date"); ?>", "class": "text-left dt-head-center w100 no_breakline sorting_asc", type: "extract-date"}
						<?php echo $columnas; ?>,
						{title: '<i class="fa fa-bars"></i>', "class": "text-center option w150 no_breakline"}
					],
					rowCallback: function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
						$(nRow).find('[data-toggle="tooltip"]').tooltip();
					},
					order: [1, "desc"]
					//order: [[<?php echo $cantidad_columnas + 1; ?>, "desc"]]
				  // printColumns: [0, 1, 2, 3, 4],
				 // xlsColumns: [0, 1, 2, 3, 4]
				});
			
			<?php } else { // Si el formulario es fijo ?>
			
				$("#other_records-table").appTable({
					source: '<?php echo_uri("other_records/list_data_fixed_form/".$record_info->id); ?>',
					columns: [
					
						<?php if($puede_eliminar != 3){ // 3 = Perfil Eliminar Ninguno ?>
					
							{
								checkboxes: {
									selectRow: true,
									selectCallback: function(){
										get_selected_rows();
									}
								},
								select: {
									style: 'multi'
								},
								render: function(data, type, row, meta){ 
		
									data = "";
									if(row[2] == 1){ // 1 = Perfil Eliminar Todos
										data = '<input type="checkbox" class="dt-checkboxes">'
									}
									if(row[2] == 2){ // 2 = Perfil Eliminar Propios
										if(row[1] == <?php echo $this->session->user_id; ?>){
											data = '<input type="checkbox" class="dt-checkboxes">'
										} else {
											data = '<input type="checkbox" class="dt-checkboxes" disabled>'
										}
									}
									if(row[2] == 3){ // 3 = Perfil Eliminar Ninguno
										data = '<input type="checkbox" class="dt-checkboxes" disabled>'
									}
									
									return data;
								   
								},
								createdCell:  function (td, cellData, rowData, row, col){
		
									if(rowData[2] == 2){ // 2 = Perfil Eliminar Propios
										if(rowData[1] != <?php echo $this->session->user_id; ?>){
											this.api().cell(td).checkboxes.disable();
										}
									}
									if(rowData[2] == 3){ // 3 = Perfil Eliminar Ninguno
										this.api().cell(td).checkboxes.disable();
									}
									
									this.api().cell(td).checkboxes.deselect();
		
								}
								
							},
						
						<?php } ?>

						<?php if($record_info->codigo_formulario_fijo == "or_responsables" || $record_info->codigo_formulario_fijo == "or_unidades_funcionales") { ?>
							{title: "<?php echo lang("id"); ?>", "class": "text-center w50 hide"},
							{title: "<?php echo lang("created_by"); ?>", "class": "text-center w50 hide"}
							<?php echo $columnas; ?>,
							{title: '<i class="fa fa-bars"></i>', "class": "text-center option w150 no_breakline"}
						<?php } else { ?>
							{title: "<?php echo lang("id"); ?>", "class": "text-center w50 hide"},
							{title: "<?php echo lang("created_by"); ?>", "class": "text-center w50 hide"},
							{title: "<?php echo lang("date"); ?>", "class": "text-center w50"}
							<?php echo $columnas; ?>,
							{title: '<i class="fa fa-bars"></i>', "class": "text-center option w150 no_breakline"}		
						<?php } ?>
					],
					rowCallback: function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
						$(nRow).find('[data-toggle="tooltip"]').tooltip();
					},
					order: [[<?php echo $cantidad_columnas + 1 ?>, "desc"]]
				  // printColumns: [0, 1, 2, 3, 4],
				 // xlsColumns: [0, 1, 2, 3, 4]
				});
			
			<?php } ?>
			
			$(document).on('click', '.table_delete a.delete', function() {
				$(this).each(function () {
					$.each(this.attributes, function () {
						if (this.specified && this.name.match("^data-")) {
							$("#confirmFileDeleteButton").attr(this.name, this.value);
						}
	
					});
				});
				$("#confirmationFileModal").modal('show');
			});
			
			
			$(document).on('click', '#confirmDeleteButton', function() {
				
				appLoader.show();
				
				var url = $(this).attr('data-action-url');
				var id = $(this).attr('data-id');
				
				$.ajax({
					url: url,
					type: 'POST',
					dataType: 'json',
					data: {id: id},
					success: function (result) {
						if (result.success) {
							appAlert.warning(result.message, {duration: 20000});
							$('#fecha_modificacion').text(result.fecha_modificacion);
							$('#num_registros').text(result.num_registros);
							
							var tr = $('a.delete[data-id="'+id+'"]').closest('tr'),
							table = $("#other_records-table").dataTable();
	
							table.fnDeleteRow($("#other_records-table").DataTable().row(tr).index());
							//table.fnReloadAjax();
						} else {
							appAlert.error(result.message, {duration: 20000});
						}
						appLoader.hide();
					}
				});
	
			});
			
			
			//$('#confirmationModal').on('click', '#confirmDeleteButton', function() {
			$('#confirmFileDeleteButton').click(function() {
			//$(document).off('click', '#confirmDeleteButton').on('click', '#confirmDeleteButton', function() {
				
				appLoader.show();
				
				var url = $(this).attr('data-action-url'),
						id = $(this).attr('data-id'),
						undo = $(this).attr('data-undo'),
						campo = $(this).attr('data-campo'),
						obligatorio = $(this).attr('data-obligatorio');
				$.ajax({
					url: url,
					type: 'POST',
					dataType: 'json',
					data: {id: id, campo:campo, obligatorio:obligatorio},
					success: function (result) {
						if (result.success) {
							appAlert.warning(result.message, {duration: 20000});
							$('#table_delete_' + result.id_campo).parent().parent().html(result.new_field);
							//$("#other_records-table").dataTable().fnReloadAjax();
							//initScrollbar(".modal-body", {setHeight: 280});
							$('#other_records-form').append('<input type="hidden" name="id_campo_archivo_eliminar[]" value="' + result.id_campo + '" />');

						} else {
							appAlert.error(result.message);
						}
						appLoader.hide();
					}
				});
						
			});
			
			
			$('#excel').click(function(){
				<?php if (!$record_info->fijo) { ?>
					var $form = $('<form id="gg"></form>').attr('action','<?php echo_uri("Export_excel/excel/".$record_info->id_tipo_formulario.'/'.$record_info->id)?>').attr('method','POST').attr('target', '_self').appendTo('body');
				<?php } else { // Si el formulario es fijo ?>
					var $form = $('<form id="gg"></form>').attr('action','<?php echo_uri("Export_excel/excel_fixed_forms/".$record_info->id_tipo_formulario.'/'.$record_info->id)?>').attr('method','POST').attr('target', '_self').appendTo('body');
				<?php } ?>
				$form.submit();
			});
		
		<?php if($puede_agregar != 1) { ?>
			$('#agregar_elemento').removeAttr("data-action-url").attr('disabled','true');
		<?php } ?>
		
		<?php if($puede_ver == 3) { ?>
			$('#excel').attr('disabled','true');
		<?php } ?>	
		
		
			// SELECCIÓN MÚLTIPLE DE FILAS DE APPTABLE
			var data_ids = [];
			function get_selected_rows(){
				
				var rows_selected = $("#other_records-table").DataTable().column(0).checkboxes.selected();
				var ids = rows_selected.join(",");
				data_ids = ids.split(",");
								
				if(data_ids[0] !== ""){
					$('#delete_selected_rows').attr("disabled", false).css("pointer-events", "auto");
				} else {
					$('#delete_selected_rows').attr("disabled", "disabled").css("pointer-events", "none");
				}
	
			};
	
			$(document).on('click', '#delete_selected_rows', function() {
				$("#confirmMultipleDeleteButton").attr("data-ids", JSON.stringify(data_ids));
				<?php if (!$record_info->fijo) { ?>
					$("#confirmMultipleDeleteButton").attr("data-action-url", "<?php echo get_uri("other_records/delete_multiple/".$record_info->id); ?>");
				<?php } else { // Si el formulario es fijo ?>
					$("#confirmMultipleDeleteButton").attr("data-action-url", "<?php echo get_uri("other_records/delete_multiple_fixed_form/".$record_info->id); ?>");
				<?php } ?>
				$('#confirmationMultipleModal').modal('show');
				
			});
			
			$(document).on('click', '#confirmMultipleDeleteButton', function() {
				
				var url = $(this).attr('data-action-url');
				var data_ids = $(this).attr('data-ids');
	
				appLoader.show();
				
				$.ajax({
					url: url,
					type: 'POST',
					dataType: 'json',
					data: {data_ids: data_ids},
					success: function (result) {
						if (result.success) {
							appAlert.warning(result.message, {duration: 20000});
							$('#fecha_modificacion').text(result.fecha_modificacion);
							$('#num_registros').text(result.num_registros);
							
							$.each( JSON.parse(data_ids), function( index, id ){
								var tr = $('a.delete[data-id="'+id+'"]').closest('tr'),
								table = $("#other_records-table").dataTable();
								table.fnDeleteRow($("#other_records-table").DataTable().row(tr).index());
							});
							
							$('#delete_selected_rows').attr("disabled", "disabled").css("pointer-events", "none");
							
						} else {
							appAlert.error(result.message, {duration: 20000});
						}
						appLoader.hide();
					}
				});
				
			});

        });   
    </script>
</div>