<div class="form-group">
    <div class="col-sm-12 col-md-12 p0">
        <div id="file-upload-dropzone" class="dropzone mb15">
        </div>
        <div id="file-upload-dropzone-scrollbar">
            <div id="uploaded-file-previews">
                <div id="file-upload-row" class="box">
                    <div class="preview box-content pr15" style="width:100px;">
                        <img data-dz-thumbnail class="upload-thumbnail-sm" />
                        <div class="progress progress-striped upload-progress-sm active mt5" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                            <div class="progress-bar progress-bar-success" style="width:0%;" data-dz-uploadprogress></div>
                        </div>
                    </div>
                    <div class="box-content">
                        <p class="name" data-dz-name></p>
                        <p class="clearfix">
                            <span class="size pull-left" data-dz-size></span>
                            <span data-dz-remove class="btn btn-default btn-sm border-circle pull-right mt-5 mr10 remover_archivo">
                                <i class="fa fa-times"></i>
                            </span>
                        </p>
                        <strong class="error text-danger" data-dz-errormessage></strong>
                        <input class="file-count-field" type="hidden" name="file" value="" />
                    </div>
                </div>
            </div>
        </div>
        
        <input class="file_validation" type="hidden" name="archivo_importado_validacion" value="" data-rule-required="1" data-msg-required="<?php echo lang("field_required") ?>"/>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function () {
	fileSerial = 0;
   Dropzone.autoDiscover = false;
	// Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
	var previewNode = document.querySelector("#file-upload-row");
	previewNode.id = "";
	var previewTemplate = previewNode.parentNode.innerHTML;
	previewNode.parentNode.removeChild(previewNode);
	<?php //if(!$preimagen){?>
	//previewNode.parentNode.removeChild(previewNode);
	//console.log(previewTemplate);
	//$(previewTemplate).find("p.name").html("<?php echo $preimagen; ?>");
	<?php //} ?>

	var dropzoneId = "#file-upload-dropzone";

	var projectFilesDropzone = new Dropzone(dropzoneId, {
		init: function(){
			this.on("addedfile", function(file){
				//console.log(this.files.length);
				if(this.files[1]){
					this.removeFile(this.files[1]);
				}
			});
		},
		url: "<?php echo $upload_url; ?>",
		thumbnailWidth: 80,
		thumbnailHeight: 80,
		parallelUploads: 20,
		//maxFilesize: 3000,
		maxFilesize: <?php echo get_setting("max_file_size"); ?>,
		dictFileTooBig: '<?php echo lang("file_too_big"); ?>',
		maxFiles: 1,
		previewTemplate: previewTemplate,
		dictDefaultMessage: '<?php echo lang("single_file_upload_instruction"); ?>',
		autoQueue: true,
		previewsContainer: "#uploaded-file-previews",
		clickable: true,
		accept: function (file, done) {

			if (file.name.length > 200) {
				done("Filename is too long.");
				$(file.previewTemplate).find(".description-field").remove();
			}

			//validate the file?
			$.ajax({
				url: "<?php echo $validation_url; ?>",
				data: {file_name: file.name, file_size: file.size},
				cache: false,
				type: 'POST',
				dataType: "json",
				success: function (response) {
					if (response.success) {
						fileSerial++;
						$(file.previewTemplate).find(".description-field").attr("name", "description_" + fileSerial);
						$(file.previewTemplate).append("<input type='hidden' name='archivo_importado' value='" + file.name + "' />\n\
							<input type='hidden' name='file_size_" + fileSerial + "' value='" + file.size + "' />");
						$(file.previewTemplate).find(".file-count-field").val(fileSerial);
						
						$("input[name='archivo_importado_validation']").val(file.name);
						done();
						
						$('.remover_archivo').click(function(){
							$(".file_validation").val("");
						});
						
						
					} else {
						
						$(file.previewTemplate).find("input").remove();
						done(response.message);
					}
				}
			});
		},
		processing: function () {
			$(dropzoneId).closest('form').find('[type="submit"]').prop("disabled", true);
		},
		queuecomplete: function () {
			$(dropzoneId).closest('form').find('[type="submit"]').prop("disabled", false);
		},
		fallback: function () {
			//add custom fallback;
			$("body").addClass("dropzone-disabled");
			$(dropzoneId).closest('form').find('[type="submit"]').removeAttr('disabled');

			$("#file-upload-dropzone").hide();
			$(dropzoneId).closest('form').find(".modal-footer").prepend("<button id='add-more-file-button' type='button' class='btn  btn-default pull-left'><i class='fa fa-plus-circle'></i> " + "<?php echo lang("add_more"); ?>" + "</button>");

			$(dropzoneId).closest('form').find(".modal-footer").on("click", "#add-more-file-button", function () {
				var newFileRow = "<div class='file-row pb10 pt10 b-b mb10'>"
						+ "<div class='pb10 clearfix '><button type='button' class='btn btn-xs btn-danger pull-left mr10 remove-file'><i class='fa fa-times'></i></button> <input class='pull-left' type='file' name='manualFiles[]' /></div>"
						+ "</div>";
				$("#uploaded-file-previews").prepend(newFileRow);
			});
			$("#add-more-file-button").trigger("click");
			$("#uploaded-file-previews").on("click", ".remove-file", function () {
				$(this).closest(".file-row").remove();
			});
		},
		success: function (file) {
			setTimeout(function () {
				$(file.previewElement).find(".progress-striped").removeClass("progress-striped").addClass("progress-bar-success");
			}, 1000);
		}
	});
	/*
	document.querySelector(".start-upload").onclick = function () {
		projectFilesDropzone.enqueueFiles(projectFilesDropzone.getFilesWithStatus(Dropzone.ADDED));
	};
	document.querySelector(".cancel-upload").onclick = function () {
		projectFilesDropzone.removeAllFiles(true);
	};
	*/
	//initScrollbar("#file-upload-dropzone-scrollbar", {setHeight: 280});
	
	/*$("#file-upload-dropzone-scrollbar").on("click", "span[data-dz-remove]", function () {
		alert("sadasda");
		$("input[name='file_validation']").val("");
	});*/
	
});

/*window.onload = function(){
	document.querySelector(".start-upload").onclick = function () {
		projectFilesDropzone.enqueueFiles(projectFilesDropzone.getFilesWithStatus(Dropzone.ADDED));
	};
	document.querySelector(".cancel-upload").onclick = function () {
		projectFilesDropzone.removeAllFiles(true);
	};
	//$("span[data-dz-remove]").click(function(){
	
};*/

</script>  