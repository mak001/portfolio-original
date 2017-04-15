<div class="col-lg-6 py-2">
	<div class="card">
		<a href="$Link" title="<%t Blog.ReadMoreAbout "Read more about '{title}'..." title=$Title %>">
        	<% if $FeaturedImage %>
        		<img class="card-img-top img-fluid" src="$FeaturedImage.SetCroppedSize(510, 200, left, top).Link" alt="$FeaturedImage.ALT"/>
        	<% else %>
        		<img class="card-img-top img-fluid" src="$ThemeDir/images/code.png" alt="$Title"/>
        	<% end_if %>
        </a>
    	
    	<div class="card-block">
    	
        	<h3 class="card-title text-center">
    			<% if $MenuTitle %>$MenuTitle
    			<% else %>$Title<% end_if %>
        	</h3>
        	
        	<div class="card-text">
        		<% if $Summary %>
            		$Summary
            	<% else %>
            		<p>$Excerpt</p>
            	<% end_if %>
        	</div>
        	
    	</div>
    	
    	<div class="card-footer">
    		<a class="btn btn-primary" href="$Link">Read more...</a>
    	</div>
    </div>
</div>