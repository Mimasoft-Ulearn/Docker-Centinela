<?php $this->load->view("includes/cropbox"); ?>
<div id="page-content" class="clearfix">
    <div class="bg-success clearfix">
        <div class="col-md-6">
            <div class="row p20">
                <?php $this->load->view("users/profile_image_section"); ?>
            </div>
        </div>

        <div class="col-md-6 text-center cover-widget">
            <div class="row p20">
                <?php
                //count_project_status_widget($user_info->id);
                //count_total_time_widget($user_info->id);
                ?> 
            </div>
        </div>
    </div>


    <ul data-toggle="ajax-tab" class="nav nav-tabs" role="tablist">

        <?php if ($show_general_info) { ?>
            <li><a  role="presentation" href="<?php echo_uri("team_members/general_info/" . $user_info->id); ?>" data-target="#tab-general-info"> <?php echo lang('general_info'); ?></a></li>
        <?php } ?>
        <?php if ($show_account_settings) { ?>
            <li><a role="presentation" href="<?php echo_uri("team_members/account_settings/" . $user_info->id); ?>" data-target="#tab-account-settings"> <?php echo lang('account_settings'); ?></a></li>
        <?php } ?>

    </ul>

    <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade active pl15 pr15 mb15" id="tab-timeline">
            <?php timeline_widget(array("limit" => 20, "offset" => 0, "is_first_load" => true, "user_id" => $user_info->id)); ?>
        </div>
        <div role="tabpanel" class="tab-pane fade" id="tab-general-info"></div>
        <div role="tabpanel" class="tab-pane fade" id="tab-account-settings"></div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $(".upload").change(function () {
            if (typeof FileReader == 'function') {
                showCropBox(this);
            } else {
                $("#profile-image-form").submit();
            }
        });
        $("#profile_image").change(function () {
            $("#profile-image-form").submit();
        });


        $("#profile-image-form").appForm({
            isModal: false,
            beforeAjaxSubmit: function (data) {
                $.each(data, function (index, obj) {
                    if (obj.name === "profile_image") {
                        var profile_image = replaceAll(":", "~", data[index]["value"]);
                        data[index]["value"] = profile_image;
                    }
                });
            },
            onSuccess: function (result) {
                if (typeof FileReader == 'function') {
                    appAlert.success(result.message, {duration: 10000});
                } else {
                    location.reload();
                }
            }
        });

		//alert("<?php echo $tab; ?>");
        var tab = "<?php echo $tab; ?>";
		
		$(".nav.nav-tabs").hide();
		
        if (tab === "general") {
            $("[data-target=#tab-general-info]").trigger("click");
			$("#tab-account-settings").hide();
        } else if (tab === "account") {
            $("[data-target=#tab-account-settings]").trigger("click");
			$("#tab-general-info").hide();
        } /* else if (tab === "social") {
            $("[data-target=#tab-social-links]").trigger("click");
        } else if (tab === "job_info") {
            $("[data-target=#tab-job-info]").trigger("click");
        } */
		
		 $('[data-toggle="tooltip"]').tooltip();

    });
</script>