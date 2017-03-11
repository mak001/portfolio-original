<?php 

class ProjectPage extends Page {
    
    private static $can_be_root = false;
    private static $allowed_children = 'none';
    
    private static $has_one = array(
        'ProjectHolder' => 'ProjectHolder'
    );
    
}

class ProjectPage_Controller extends Page_Controller {
    
}

?>