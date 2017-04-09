<footer class="py-3">
	<div class="container">
		
		<div class="col-12 text-center">
			<a href="#top">Back to top</a>
		</div>
		
		<div class="row">
			<div class="col-sm-6 my-3">
				<a href="$BaseHref" class="brand" rel="home">$SiteConfig.Title</a>
				<div>
					<% include FooterNav %>
				</div>
			</div>
			
			<% cached 'FooterLinks', $SiteConfig.LastEdited %>
			
    			<div class="col-sm-6 my-3 flex-first flex-sm-last text-sm-right">
    				<% with $SiteConfig %>
    					<div class="links">
        					<% if $GitHubLink %>
        						<a href="$GitHubLink" class="link" title="GitHub">
        							<i class="fa fa-github icon" aria-hidden="true"></i>
        							<span class="sr-only">GitHub</span>
        							<span class="text">GitHub</span>
        						</a>
        					<% end_if %>
        					
        					<% if $YouTubeLink %>
        						<a href="$YouTubeLink" class="link" title="YouTube">
        							<i class="fa fa-youtube-play icon" aria-hidden="true"></i>
        							<span class="sr-only">YouTube</span>
        							<span class="text">YouTube</span>
        						</a>
        					<% end_if %>
        					
        					<% if $TwitterLink %>
        						<a href="$TwitterLink" class="link" title="Twitter">
        							<i class="fa fa-twitter icon" aria-hidden="true"></i>
        							<span class="sr-only">Twitter</span>
        							<span class="text">Twitter</span>
        						</a>
        					<% end_if %>
        					
        					<% if $FacebookLink %>
        						<a href="$FacebookLink" class="link" title="Facebook">
        							<i class="fa fa-facebook-square icon" aria-hidden="true"></i>
        							<span class="sr-only">Facebook</span>
        							<span class="text">Facebook</span>
        						</a>
        					<% end_if %>
        					
        					<% if $GoogleLink %>
        						<a href="$GoogleLink" class="link" title="Google">
        							<i class="fa fa-google icon" aria-hidden="true"></i>
        							<span class="sr-only">Google</span>
        							<span class="text">Google</span>
        						</a>
        					<% end_if %>
        					
    					</div>
    					
    				<% end_with %>
    			</div>
    			
			<% end_cached %>
		</div>
		
		<div class="col-12 text-center">
    		<small>
    			Theme by Matthew Koerber / Powered by <a href="http://silverstripe.org">SilverStripe</a>
    		</small>
		</div>
		
		
	</div>
</footer>