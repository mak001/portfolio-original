<?php 

class SiteConfigExtension extends DataExtension {
    
    private static $db = array(
        'FacebookLink' => 'Varchar',
        'TwitterLink' => 'Varchar',
        'GoogleLink' => 'Varchar',
        'YouTubeLink' => 'Varchar',
        'GitHubLink' => 'Varchar'
    );
    
    public function updateCMSFields(FieldList $fields) {
        $fields->addFieldsToTab('Root.Social', array(
            TextField::create('FacebookLink', 'Facebook'),
            TextField::create('TwitterLink', 'Twitter'),
            TextField::create('GoogleLink', 'Google'),
            TextField::create('YouTubeLink', 'YouTube'),
            TextField::create('GitHubLink', 'GitHub'),
        ));
    }
    
}

?>