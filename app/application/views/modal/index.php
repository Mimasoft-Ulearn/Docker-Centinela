<!-- Modal -->
<div class="modal" id="ajaxModal" tabindex="-1" role="dialog" aria-labelledby="ajaxModal" aria-hidden="true" data-backdrop="static">
<!-- data-keyboard="false" -->
    <div class="modal-dialog mini-modal">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="ajaxModalTitle" data-title="<?php echo get_setting('app_title'); ?>"></h4>
            </div>
            <div id="ajaxModalContent">

            </div>
            <div id='ajaxModalOriginalContent' class='hide'>
                <div class="original-modal-body">
                    <div class="circle-loader"></div>
                </div>
                <div class="modal-footer" style="z-index:9999">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo lang('close') ?></button>
                </div>
            </div>
        </div>
    </div>
</div>
