<?php
class Page extends SiteTree {

	private static $db = array(
	);

	private static $has_one = array(
	);
	
}
class Page_Controller extends ContentController {

	/**
	 * An array of actions that can be accessed via a request. Each array element should be an action name, and the
	 * permissions or conditions required to allow the user to access it.
	 *
	 * <code>
	 * array (
	 *     'action', // anyone can access this action
	 *     'action' => true, // same as above
	 *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
	 *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
	 * );
	 * </code>
	 *
	 * @var array
	 */
	private static $allowed_actions = array (
	);

	public function init() {
		parent::init();
		
		Requirements::set_combined_files_folder("{$this->ThemeDir()}/combined");
		
		Requirements::combine_files(
		    'theme.css',
		    array(
		        "{$this->ThemeDir()}/css/font-awesome.min.css",
		        "{$this->ThemeDir()}/css/prism.css",
		        "{$this->ThemeDir()}/css/style.css"
		    )
		);
		
		Requirements::combine_files(
		    'script.js',
		    array(
		        "{$this->ThemeDir()}/javascript/jquery-3.1.1.slim.min.js",
		        "{$this->ThemeDir()}/javascript/tether.min.js",
		        "{$this->ThemeDir()}/javascript/bootstrap.min.js",
		        "{$this->ThemeDir()}/javascript/jquery.matchHeight.js",
		        "{$this->ThemeDir()}/javascript/prism.js",
		        "{$this->ThemeDir()}/javascript/samplecode.js"
		    )
		);
		
		Requirements::block(THIRDPARTY_DIR.'/jquery/jquery.min.js');
		
		ShortcodeParser::get('default')->register('languagelink', function($args, $text, $parser, $tag) {
		    $holder = ProjectHolder::get()->First();
		    if ($holder != null && $holder->exists())
                return '<a href="' . ProjectHolder::get()->First()->LanguageLink() . '">' . $text . '</a>';
		    return $text;
		});
		
	    ShortcodeParser::get('default')->register('frameworklink', function($args, $text, $parser, $tag) {
	        $holder = ProjectHolder::get()->First();
	        if ($holder != null && $holder->exists())
	           return '<a href="' . ProjectHolder::get()->First()->FrameworkLink() . '">' . $text . '</a>';
	        return $text;
	    });
	}

}
