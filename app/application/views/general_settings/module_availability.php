<div class="col-sm-9 col-lg-10">
    <?php echo form_open(get_uri("general_settings/save_module_availability_settings"), array("id" => "module-availability-form", "class" => "general-form dashed-row", "role" => "form")); ?>
    <div class="panel">
        <div class="panel-default panel-heading">
            <h4><?php echo lang("module_availability"); ?></h4>
        </div>
        <div class="panel-body">
			
            <input type="hidden" id="id_cliente_module_availability" name="id_cliente" />
        	<input type="hidden" id="id_proyecto_module_availability" name="id_proyecto" />
            
            <table class="table">
            	<thead>
                	<tr>
                    	<th class="text-center"><?php echo lang("info"); ?></th>
                        <th class="text-center"><?php echo lang("status"); ?></th>
                        <!-- <th class="text-center"><?php echo lang("threshold"); ?></th> -->
                    </tr>
                </thead>
                <tbody>
                	<?php foreach($module_availability_settings as $mod){?>
                	<tr>
                    	<td><?php echo $mod->name ?></td>
                        <td class="text-center">
                        	<input type="hidden" name="clients_modules_availability[<?php echo $mod->id?>]" value="0"/>
                        	<?php
								$checked = ($mod->available) ? TRUE : FALSE;
								echo form_checkbox("clients_modules_availability[".$mod->id."]", "1", $checked);
							?>
                        </td>
                        <!--
						<td class="text-center">
							<input type="hidden" name="clients_modules_availability_thresholds[<?php echo $mod->id?>]" value="0"/>
							<?php
								//$checked = ($mod->thresholds) ? TRUE : FALSE;
								//echo form_checkbox("clients_modules_availability_thresholds[".$mod->id."]", "1", $checked);
							?>
						</td>
                        -->
                    </tr>
                    <?php } ?>
                </tbody>
            </table>

            <table class="table">
            	<thead>
                	<tr>
                    	<th class="text-center"><?php echo lang("info"); ?></th>
                        <th class="text-center"><?php echo lang("status"); ?></th>
                        <!-- <th class="text-center"><?php echo lang("threshold"); ?></th> -->
                    </tr>
                </thead>
                <tbody>
                	<?php foreach($module_availability_settings_air as $mod){?>
                	<tr>
                    	<td><?php echo $mod->name ?></td>
                        <td class="text-center">
                        	<input type="hidden" name="clients_modules_availability[<?php echo $mod->id?>]" value="0"/>
                        	<?php
								$checked = ($mod->available) ? TRUE : FALSE;
								echo form_checkbox("clients_modules_availability[".$mod->id."]", "1", $checked);
							?>
                        </td>
                    </tr>
                    <?php } ?>
                </tbody>
            </table>

            
        </div>
        <div class="panel-footer col-xs-12 col-md-12 col-lg-12">
            <button type="submit" class="btn btn-primary pull-right"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
        </div>
    </div>
    <?php echo form_close(); ?>
</div>

<script type="text/javascript">
    $(document).ready(function () {
		
		var id_cliente = $('#client').val();
		var id_proyecto = $('#project').val();
		$('#id_cliente_module_availability').val(id_cliente);
		$('#id_proyecto_module_availability').val(id_proyecto);
		
		$("#module-availability-form").appForm({
            isModal: false,
            beforeAjaxSubmit: function (data) {
                $.each(data, function (index, obj) {
									
                    if (obj.name === "invoice_logo" || obj.name === "site_logo") {
                        var image = replaceAll(":", "~", data[index]["value"]);
                        data[index]["value"] = image;
                    }
                });
            },
            onSuccess: function (result) {
                appAlert.success(result.message, {duration: 10000});
                if ($("#site_logo").val() || $("#invoice_logo").val()) {
                    location.reload();
                }
            }
        });
		
    });
</script>