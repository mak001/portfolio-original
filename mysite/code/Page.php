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
		// You can include any CSS or JS required by your project here.
		// See: http://doc.silverstripe.org/framework/en/reference/requirements
		
		Requirements::css("{$this->ThemeDir()}/css/font-awesome.min.css");
		Requirements::css("{$this->ThemeDir()}/css/prism.css");
		Requirements::css("{$this->ThemeDir()}/css/style.css");
		
		
		Requirements::javascript("{$this->ThemeDir()}/javascript/jquery-3.1.1.slim.min.js");
		Requirements::javascript("{$this->ThemeDir()}/javascript/tether.min.js");
		Requirements::javascript("{$this->ThemeDir()}/javascript/bootstrap.min.js");
		Requirements::javascript("{$this->ThemeDir()}/javascript/jquery.matchHeight.js");
		Requirements::javascript("{$this->ThemeDir()}/javascript/prism.js");
		
		Requirements::customScript(<<<JS
            (function($) {
                var codeBlocks = $("[class*='language-']");
                if (codeBlocks.length > 0) {
                    for (var i = 0; i < codeBlocks.length; i++) {
                        var block = $(codeBlocks[i]);
                        var classes = block.attr("class").split(' ');
                       
                        classes = classes.filter(function(item) {
                            return item !== 'line-numbers';
                        });
                           
                        var code = '<code class="' + classes.join(' ') + '">' + block.text() + '</code>';

                        block.empty();
                        block.append(code);
                    }
                }
            })(jQuery)
JS
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
