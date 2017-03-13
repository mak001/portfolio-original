<?php

class ProjectHolder extends Page
{

    private static $allowed_children = array(
        'ProjectPage'
    );

    private static $has_many = array(
        'Languages' => 'ProjectLanguage',
        'Frameworks' => 'ProjectFramework'
    );

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->addFieldToTab('Root.Languages', GridField::create('Languages', 'Project languages', $this->Languages(), GridFieldConfig_RecordEditor::create()));
        $fields->addFieldToTab('Root.Frameworks', GridField::create('Frameworks', 'Project frameworks', $this->Frameworks(), GridFieldConfig_RecordEditor::create()));
        
        return $fields;
    }
}

class ProjectHolder_Controller extends Page_Controller
{

    protected $projectList;

    protected $languageList;
    protected $frameworkList;

    private static $allowed_actions = array(
        'language',
        'framework'
    );

    public function init()
    {
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

    public function language(SS_HTTPRequest $request)
    {
        if ($request->param('ID')) {
            
            $language = ProjectLanguage::get()->filter(array(
                'ProjectHolderID' => $this->ID,
                'URLSegment' => $request->param('ID')
            ))
                ->First();
            
            if (! $language) {
                return $this->httpError(404, 'That language was not found');
            }
            
            $this->projectList = $this->projectList->filter(array(
                'Languages.ID' => $language->ID
            ));
            
            $this->addToBreadCrumb($this->Link() . "language", "Languages");
            $this->addToBreadCrumb($this->Link() . "language/" . $language->URLSegment, $language->Title);
            
            return array(
                'SelectedLanguage' => $language
            );
        } else {
            
            /*
            $this->languageList = ProjectLanguage::get()->filter(array(
                'ProjectHolderID' => $this->ID,
               // "Projects.Count:GreaterThan" => 0
            ));
            */
            //$this->languageList =  $this->Languages();
            
            $langs = array();
            foreach($this->Languages() as $lang) {
                if (count($lang->Projects()) > 0) {
                    $langs[] = $lang;
                }
            }
            $this->languageList = ArrayList::create($langs);
            
            //echo "<pre>"; print_r($this->languageList->toArray()); echo "</pre>";
            
            
            $this->addToBreadCrumb($this->Link() . "language", "Languages");
            
            return array(
                'SelectedLanguage' => ''
            );
        }
    }
    
    public function framework(SS_HTTPRequest $request)
    {
        if ($request->param('ID')) {
    
            $framework = ProjectFramework::get()->filter(array(
                'ProjectHolderID' => $this->ID,
                'URLSegment' => $request->param('ID')
            ))
            ->First();
    
            if (! $framework) {
                return $this->httpError(404, 'That language was not found');
            }
    
            $this->projectList = $this->projectList->filter(array(
                'Frameworks.ID' => $framework->ID
            ));
    
            $this->addToBreadCrumb($this->Link() . "framework", "Frameworks");
            $this->addToBreadCrumb($this->Link() . "framework/" . $framework->URLSegment, $framework->Title);
    
            return array(
                'SelectedFramework' => $framework
            );
        } else {
    
            /*
             $this->languageList = ProjectLanguage::get()->filter(array(
             'ProjectHolderID' => $this->ID,
             // "Projects.Count:GreaterThan" => 0
             ));
             */
            //$this->languageList =  $this->Languages();
    
            $frames = array();
            foreach($this->Frameworks() as $frame) {
                if (count($frame->Projects()) > 0) {
                    $frames[] = $frame;
                }
            }
            $this->frameworkList = ArrayList::create($frames);
    
            //echo "<pre>"; print_r($this->languageList->toArray()); echo "</pre>";
    
    
            $this->addToBreadCrumb($this->Link() . "framework", "Frameworks");
    
            return array(
                'SelectedFramework' => ''
            );
        }
    }

    private function addToBreadCrumb($link, $title)
    {
        $obj = new DataObject();
        $obj->Link = $link;
        $obj->MenuTitle = $title;
        $obj->Title = $title;
        $this->AddBreadCrumbAfter($obj);
    }

    public function PaginatedProjects($num = 10)
    {
        return PaginatedList::create($this->projectList, $this->getRequest())->setPageLength($num);
    }

    public function PaginatedLanguages($num = 10)
    {
        if ($this->languageList) {
            return PaginatedList::create($this->languageList, $this->getRequest())->setPageLength($num);
        }
    }
    
    public function PaginatedFrameworks($num = 10)
    {
        if ($this->frameworkList) {
            return PaginatedList::create($this->frameworkList, $this->getRequest())->setPageLength($num);
        }
    }
}

?>