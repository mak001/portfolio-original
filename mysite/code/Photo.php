<?php 

class Photo extends DataObject {
    
    private static $db = array(
        'Caption' => 'Text'
    );
    
    private static $has_one = array(
        'Image' => 'Image',
        'Page' => 'Page'
    );
    
    public function getCMSFields() {
        $fields = FieldList::create(array(
            $upload = UploadField::create('Image'),
            TextareaField::create('Caption')
        )); 
        
        $upload->getValidator()->setAllowedExtensions(array(
            'png',
            'gif',
            'jpg',
            'jpeg'
        ));
        
        $upload->setFolderName('project-photos');
        
        return $fields;
    }
    
}

?>