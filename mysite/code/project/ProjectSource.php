<?php 

class ProjectSource extends DataObject {
    
    private static $db = array(
        'Link' => 'Text',
        'Title' => 'Varchar'
    );
    
    private static $has_one = array(
        'ProjectPage' => 'ProjectPage'
    );
    
    public function Title() {
        if ($this->Title && $this->Title != '') {
            return $this->Title;
        }
        return "Source";
    }
    
}

?>