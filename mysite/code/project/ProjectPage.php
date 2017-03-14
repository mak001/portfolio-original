<?php 

class ProjectPage extends Page {
    
    const SHOW_ROUTE = "show";
    
    private static $can_be_root = false;
    private static $allowed_children = 'none';
    
    private static $has_one = array(
        'ProjectHolder' => 'ProjectHolder',
        'MainPhoto' => 'Image'
    );
    
    private static $db = array(
        'Teaser' => 'Text',
        'MainImageHasLogo' => 'Boolean',
        'SourceLink' => 'Varchar',
        'ViewLink' => 'Varchar'
    );
    
    private static $many_many = array(
        'Languages' => 'ProjectLanguage',
        'Frameworks' => 'ProjectFramework'
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

        $fields->addFieldsToTab('Root.Used', array(
            $langs = ListboxField::create('Languages', 'Selected languages', $this->Parent()
                ->ProjectLanguages()
                ->map('ID', 'Title')
                ->toArray(),
                $value = ""),
            
            $frames = ListboxField::create('Frameworks', 'Selected frameworks', $this->Parent()
                ->ProjectFrameworks()
                ->map('ID', 'Title')
                ->toArray(),
                $value = "")
        ));
        
        $langs->setMultiple(true);
        $frames->setMultiple(true);
        
        $fields->addFieldsToTab('Root.Links', array(
            TextField::create('SourceLink'),
            TextField::create('ViewLink')
        ));
        
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
    
    public function ShowLink()
    {
        return $this->Link($this::SHOW_ROUTE);
    }
    
}

class ProjectPage_Controller extends Page_Controller {
    
    private static $allowed_actions = array(
        'show'
    );
    
    public function show(SS_HTTPRequest $request) {
        
        // TODO
        return $this->renderWith(array('ShowProject', 'Page'));
    }
    
}

?>