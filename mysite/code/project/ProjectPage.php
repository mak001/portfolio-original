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
        'MainImageCropMiddle' => 'Boolean',
        'SourceLink' => 'Varchar',
        'ViewLink' => 'Varchar'
    );
    
    private static $has_many = array(
        'Photos' => 'Photo'
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
            $photoFields['main'] = UploadField::create('MainPhoto'),
            CheckBoxField::create('MainImageHasLogo'),
            CheckBoxField::create('MainImageCropMiddle', 'Crop main image from the middle'),
            GridField::create('Photos', 'Photos', $this->Photos(), GridFieldConfig_RecordEditor::create())
        ));
        
        foreach($photoFields as $key => $field) {
            $field->getValidator()->setAllowedExtensions(array(
                'png',
                'gif',
                'jpg',
                'jpeg'
            ));
            if ($key == main) {
                $field->setFolderName('project-photos/main');
            } else {
                $field->setFolderName('project-photos');
            }
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
        
        if ($image == null && !$image->exists()) {
            return "http://placehold.it/{$w}x{$h}";
        }
        
        if (abs($image->getWidth() - $w) > abs($image->getHeight() - $h)) {
            $image->setWidth($w);
        } else {
            $image->setHeight($h);
        }
        
        $v = $this->MainImageCropMiddle ? 'center' : 'top';

        $return = $image->SetCroppedSize($w, $h, 'left', $v);
        if ($return != null) {
            return $return->Link();
        } else {
            return "http://placehold.it/{$w}x{$h}";
        }
    }
    
    public function ShowLink()
    {
        return $this->Link($this::SHOW_ROUTE);
    }
    
    public function ExtraClasses() {
        $classes = "";
        
        if ($this->MainImageCropMiddle) {
            $classes .= "img-center";
        }
        
        return $classes;
    }
    
}

class ProjectPage_Controller extends Page_Controller {
    
    private static $allowed_actions = array(
        'show'
    );
    
    public function init() {
        parent::init();
        
        ShortcodeParser::get('default')->register('img', function($args, $text, $parser, $tag) {
            $img;
            $classes = "figure";
            
            if (count($this->Photos()) == 0) {
                return '';
                
            } else if ($args['img'] < 0 || count($this->Photos()) <= $args['img']) {
                $img = $this->Photos()[0];
                
            } else {
                $img = $this->Photos()[$args['img']];
            }
            
            if ($args['order'] == 'first') {
                $classes .= ' flex-first';
            }
            
            return '<figure class="' . $classes . '">' . 
                    '<img class="figure-img img-fluid mb-0 pb-2" src="' . $img->Image()->Link() . '" alt="' . $img->Image()->ALT . '">' .
                    '<figcaption class="figure-caption">' . $img->Caption . '</figcaption>' .
                '</figure>'; 
        });
    }
    
    public function show(SS_HTTPRequest $request) {
        
        // TODO
        return $this->renderWith(array('ShowProject', 'Page'));
    }
    
}

?>