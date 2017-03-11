<?php 

class ProjectHolder extends Page {
    
    private static $allowed_children = array(
        'ProjectPage'
    );
    
}

class ProjectHolder_Controller extends Page_Controller {
    
    public function init() {
        parent::init();
        
        Requirements::customScript(<<<JS
            (function($) {
                $('.card-text').matchHeight({
                    byRow: false
                });
            
                $('.card-title').matchHeight({
                    byRow: false
                });
            })(jQuery)
JS
        );
    
    }
}

?>