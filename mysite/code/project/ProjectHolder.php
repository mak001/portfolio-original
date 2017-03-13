<?php

class ProjectHolder extends Page
{

    const LANGUAGE_ROUTE = 'languages';

    const FRAMEWORK_ROUTE = 'frameworks';

    private static $allowed_children = array(
        'ProjectPage'
    );

    private static $has_many = array(
        'ProjectLanguages' => 'ProjectLanguage',
        'ProjectFrameworks' => 'ProjectFramework'
    );

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->addFieldToTab('Root.ProjectLanguages', GridField::create('ProjectLanguages', 'Project ProjectLanguages', $this->ProjectLanguages(), GridFieldConfig_RecordEditor::create()));
        $fields->addFieldToTab('Root.ProjectFrameworks', GridField::create('ProjectFrameworks', 'Project ProjectFrameworks', $this->ProjectFrameworks(), GridFieldConfig_RecordEditor::create()));
        
        return $fields;
    }

    public function LanguageLink($lang = null)
    {
        if ($lang === null) {
            return $this->Link($this::LANGUAGE_ROUTE);
        }
        return $this->Link($this::LANGUAGE_ROUTE . '/' . $lang);
    }

    public function FrameworkLink($frame = null)
    {
        if ($frame === null) {
            return $this->Link($this::FRAMEWORK_ROUTE);
        }
        return $this->Link($this::FRAMEWORK_ROUTE . '/' . $frame);
    }
}

class ProjectHolder_Controller extends Page_Controller
{

    protected $projectList;

    protected $languageList;

    protected $frameworkList;

    private static $allowed_actions = array(
        'languages',
        'frameworks'
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

    public function languages(SS_HTTPRequest $request)
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
            
            $this->addToBreadCrumb($this->LanguageLink(), "Languages");
            $this->addToBreadCrumb($language->Link(), $language->Title);
            
            return array(
                'SelectedLanguage' => $language
            );
        } else {
            
            $this->languageList = $this->ProjectLanguages()
                ->leftJoin('projectpage_languages', 'projectlanguage.ID = projectpage_languages.ProjectLanguageID')
                ->exclude('projectpage_languages.ProjectPageID', '0')
                ->distinct(true);
            
            $this->addToBreadCrumb($this->LanguageLink(), "Languages");
            
            return array(
                'SelectedLanguage' => ''
            );
        }
    }

    public function frameworks(SS_HTTPRequest $request)
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
            
            $this->addToBreadCrumb($this->FrameworkLink(), "Frameworks");
            $this->addToBreadCrumb($framework->Link(), $framework->Title);
            
            return array(
                'SelectedFramework' => $framework
            );
        } else {
            
            $this->frameworkList = $this->ProjectFrameworks()
                ->leftJoin('projectpage_frameworks', 'projectframework.ID = projectpage_frameworks.ProjectFrameworkID')
                ->exclude('projectpage_frameworks.ProjectPageID', '0')
                ->distinct(true);
            
            $this->addToBreadCrumb($this->FrameworkLink(), "Frameworks");
            
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