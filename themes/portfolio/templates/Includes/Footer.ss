<footer class="py-3">
	<div class="container">
		
		<div class="col-12 text-center">
			<a href="#top">Back to top</a>
		</div>
		
		<div class="row">
			<div class="col-sm-6 my-3">
				<div class="links nav">
					<% include FooterNav %>
				</div>
			</div>
			
			<% cached 'FooterLinks', $SiteConfig.LastEdited %>
			
    			<div class="col-sm-6 my-3 flex-first flex-sm-last text-center text-sm-right">
    				<% with $SiteConfig %>
    					<div class="links">
        					<% if $GitHubLink %>
        						<a href="$GitHubLink" class="link btn btn-outline-secondary" title="GitHub">
        							<span class="fa fa-github icon" aria-hidden="true"></span>
        							<span class="sr-only">GitHub</span>
        							<span class="text">GitHub</span>
        						</a>
        					<% end_if %>
        					
        					<% if $YouTubeLink %>
        						<a href="$YouTubeLink" class="link btn btn-outline-secondary" title="YouTube">
        							<span class="fa fa-youtube-play icon" aria-hidden="true"></span>
        							<span class="sr-only">YouTube</span>
        							<span class="text">YouTube</span>
        						</a>
        					<% end_if %>
        					
        					<% if $TwitterLink %>
        						<a href="$TwitterLink" class="link btn btn-outline-secondary" title="Twitter">
        							<span class="fa fa-twitter icon" aria-hidden="true"></span>
        							<span class="sr-only">Twitter</span>
        							<span class="text">Twitter</span>
        						</a>
        					<% end_if %>
        					
        					<% if $FacebookLink %>
        						<a href="$FacebookLink" class="link btn btn-outline-secondary" title="Facebook">
        							<span class="fa fa-facebook-square icon" aria-hidden="true"></span>
        							<span class="sr-only">Facebook</span>
        							<span class="text">Facebook</span>
        						</a>
        					<% end_if %>
        					
        					<% if $GoogleLink %>
        						<a href="$GoogleLink" class="link btn btn-outline-secondary" title="Google">
        							<span class="fa fa-google icon" aria-hidden="true"></span>
        							<span class="sr-only">Google</span>
        							<span class="text">Google</span>
        						</a>
        					<% end_if %>
        					
    					</div>
    					
    				<% end_with %>
    			</div>
    			
			<% end_cached %>
		</div>
		
		<div class="col-12 text-center rounded info-text">
    		<small>
    			Theme by Matthew Koerber / Powered by <a href="http://silverstripe.org">SilverStripe</a>
    		</small>
		</div>
		
	</div>
</footer>