<div class="col-sm-9 col-lg-10">
    <?php echo form_open(get_uri("general_settings/save_global_email_settings"), array("id" => "global_email_settings-form", "class" => "general-form dashed-row", "role" => "form")); ?>
    <div class="panel">
        <div class="panel-default panel-heading">
            <h4><?php echo lang("email_settings"); ?></h4>
        </div>
		<div class="panel-body">
        	
            <div class="form-group">
                <label for="email_sent_from_address" class=" col-md-2"><?php echo lang('email_sent_from_address'); ?></label>
                <div class=" col-md-10">
                    <?php
                    echo form_input(array(
                        "id" => "email_sent_from_address",
                        "name" => "email_sent_from_address",
                        "value" => get_setting('email_sent_from_address'),
                        "class" => "form-control",
                        "placeholder" => "somemail@somedomain.com",
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
						"data-rule-email" => true,
						"data-msg-email" => lang("enter_valid_email")
                    ));
                    ?>
                </div>
            </div>

            <div class="form-group">
                <label for="email_sent_from_name" class=" col-md-2"><?php echo lang('email_sent_from_name'); ?></label>
                <div class="col-md-10">
                    <?php
                    echo form_input(array(
                        "id" => "email_sent_from_name",
                        "name" => "email_sent_from_name",
                        "value" => get_setting('email_sent_from_name'),
                        "class" => "form-control",
                        "placeholder" => "Company Name",
                        "data-rule-required" => true,
                        "data-msg-required" => lang("field_required"),
                    ));
                    ?>
                </div>
            </div>
            <div class="form-group">
                <label for="use_smtp" class=" col-md-2"><?php echo lang('email_use_smtp'); ?></label>
                <div class="col-md-10">
                    <?php
                    echo form_checkbox(
                            "email_protocol", "smtp", get_setting('email_protocol') === "smtp" ? true : false, "id='use_smtp'"
                    );
                    ?>
                </div>
            </div>

            <div id="smtp_settings" class="<?php echo get_setting('email_protocol') === "smtp" ? "" : "hide"; ?>">
                <div class="form-group">
                    <label for="email_smtp_host" class=" col-md-2"><?php echo lang('email_smtp_host'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_input(array(
                            "id" => "email_smtp_host",
                            "name" => "email_smtp_host",
                            "value" => get_setting('email_smtp_host'),
                            "class" => "form-control",
                            "placeholder" => lang('email_smtp_host'),
                            "data-rule-required" => true,
                            "data-msg-required" => lang("field_required"),
                        ));
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email_smtp_user" class=" col-md-2"><?php echo lang('email_smtp_user'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_input(array(
                            "id" => "email_smtp_user",
                            "name" => "email_smtp_user",
                            "value" => get_setting('email_smtp_user'),
                            "class" => "form-control",
                            "placeholder" => lang('email_smtp_user'),
                            "data-rule-required" => true,
                            "data-msg-required" => lang("field_required"),
                        ));
                        ?>

                    </div>
                </div>
                <div class="form-group">
                    <label for="email_smtp_pass" class=" col-md-2"><?php echo lang('email_smtp_password'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_input(array(
                            "id" => "email_smtp_pass",
                            "name" => "email_smtp_pass",
                            "value" => get_setting('email_smtp_pass'),
                            "class" => "form-control",
                            "placeholder" => lang('email_smtp_password'),
                            "data-rule-required" => true,
                            "data-msg-required" => lang("field_required"),
                        ));
                        ?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email_smtp_port" class=" col-md-2"><?php echo lang('email_smtp_port'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_input(array(
                            "id" => "email_smtp_port",
                            "name" => "email_smtp_port",
                            "value" => get_setting('email_smtp_port'),
                            "class" => "form-control",
                            "placeholder" => lang('email_smtp_port'),
                            "data-rule-required" => true,
                            "data-msg-required" => lang("field_required"),
                        ));
                        ?>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email_smtp_security_type" class=" col-md-2"><?php echo lang('security_type'); ?></label>
                    <div class="col-md-10">
                        <?php
                        echo form_dropdown(
                                "email_smtp_security_type", array(
                            "tls" => "TLS",
                            "ssl" => "SSL"
                                ), get_setting('email_smtp_security_type'), "class='select2 mini'"
                        );
                        ?>
                    </div>
                </div>

            </div>
            <div class="form-group">
                <label for="send_test_mail_to" class=" col-md-2"><?php echo lang('email_test_message'); ?></label>
                <div class="col-md-10">
                    <?php
                    echo form_input(array(
                        "id" => "send_test_mail_to",
                        "name" => "send_test_mail_to",
                        "value" => get_setting('send_test_mail_to'),
                        "class" => "form-control",
						"data-rule-email" => true,
						"data-msg-email" => lang("enter_valid_email"),
                        "placeholder" => lang("keep_it_blank_if_not_send_test_mail"),
                    ));
                    ?>
                </div>
            </div>

        </div>
        
        <div class="panel-footer col-xs-12 col-md-12 col-lg-12">
            <button type="submit" class="btn btn-primary pull-right"><span class="fa fa-check-circle"></span> <?php echo lang('save'); ?></button>
        </div>
    </div>    
    <?php echo form_close(); ?>
    
</div>

<script type="text/javascript">
    $(document).ready(function () {
		
        $("#global_email_settings-form .select2").select2();
		
		$("#global_email_settings-form").appForm({
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

				$('#id_general_setting').val(result.save_id);

                appAlert.success(result.message, {duration: 10000});
                if ($("#site_logo").val() || $("#invoice_logo").val()) {
                    location.reload();
                }
            }
        });
		
		$("#use_smtp").click(function() {
            if ($(this).is(":checked")) {
                $("#smtp_settings").removeClass("hide");
            } else {
                $("#smtp_settings").addClass("hide");
            }
        });

    });
</script>