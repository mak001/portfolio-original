<?php 

class ProjectPage extends Page {
    
    private static $can_be_root = false;
    private static $allowed_children = 'none';
    
    private static $has_one = array(
        'ProjectHolder' => 'ProjectHolder',
        'MainPhoto' => 'Image'
    );
    
    private static $db = array(
        'Teaser' => 'Text',
        'MainImageHasLogo' => 'Boolean'
    );
    
    private static $many_many = array(
        'Languages' => 'ProjectLanguage'
    );
    
    public function getCMSFields() {
        $fields = parent::getCMSFields();
        
        $fields->addFieldToTab('Root.Main', TextareaField::create('Teaser'), 'Content');
        
        $photoFields = array();
        $fields->addFieldsToTab('Root.Photos', array(
            $photoFields[] = UploadField::create('MainPhoto'),
            CheckBoxField::create('MainImageHasLogo')
        ));
        
        foreach($photoFields as $field) {
            $field->getValidator()->setAllowedExtensions(array(
                'png',
                'gif',
                'jpg',
                'jpeg'
            ));
            $field->setFolderName('project-photos');
        }

        $fields->addFieldToTab('Root.Languages', $listboxfield = ListboxField::create('Languages', 'Selected languages', $this->Parent()
            ->Languages()
            ->map('ID', 'Title')
            ->toArray(),
            $value = ""));
        
        $listboxfield->setMultiple(true);
        
        return $fields;
    }
    
    public function MainPhotoResizeLink($w, $h) {
        $image = $this->MainPhoto();
        
        if ($image == null) {
            return "http://placehold.it/{$w}x{$h}";
        }
        
        if (abs($image->getWidth() - $w) > abs($image->getHeight() - $h)) {
            $image->setWidth($w);
        } else {
            $image->setHeight($h);
        }
        
        return $image->SetCroppedSize($w, $h, 'left', 'top')->Link();
    }
    
}

class ProjectPage_Controller extends Page_Controller {
    
}

?>