<?php 

class ProjectHolder extends Page {
    
    private static $allowed_children = array(
        'ProjectPage'
    );
    
    private static $has_many = array(
        'Languages' => 'ProjectLanguage'
    );
    
    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->addFieldToTab('Root.Languages', GridField::create('Languages', 'Project languages', $this->Languages(), GridFieldConfig_RecordEditor::create()));
    
        return $fields;
    }
    
}

class ProjectHolder_Controller extends Page_Controller {
    
    protected $projectList;
    
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
        
        $this->projectList = ProjectPage::get()->filter(array(
            'ParentID' => $this->ID
        ));
    
    }
    
    public function category(SS_HTTPRequest $request)
    {
        $language = ProjectLanguage::get()->byID($request->param('ID'));
    
        if (! $language) {
            return $this->httpError(404, 'That language was not found');
        }
    
        $this->projectList = $this->projectList->filter(array(
            'Languages.ID' => $language->ID
        ));
    
        return array(
            'SelectedLanguage' => $language
        );
    }
    
    public function PaginatedProjects($num = 10)
    {
        return PaginatedList::create($this->projectList, $this->getRequest())->setPageLength($num);
    }
}

?>