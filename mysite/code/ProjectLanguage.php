<?php 

class ProjectLanguage extends DataObject {
    
    private static $db = array(
        'Title' => 'Varchar',
        'BGColor' => 'Color'
    );
    
    private static $has_one = array(
        'ProjectHolder' => 'ProjectHolder'
    );
    
    private static $belongs_many_many = array(
        'Projects' => 'ProjectPage'
    );
    
    public function getCMSFields()
    {
        return FieldList::create(array(
            TextField::create('Title'),
            new ColorField('BGColor', 'Background Color')
        ));
    }
    
    public function Link() {
        return $this->ProjectHolder()->Link('language/' . $this->ID);
    }
    
}

?>