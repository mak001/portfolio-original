<div class="container">
	
	<div class="jumbotron jumbotron-fluid bg-info text-center" id="project-header" style="background-image: url($MainPhotoResizeLink(1110, 350))">
		<% if not $MainImageHasLogo %>
    		<div class="overlay"></div>
        	<div class="container">
        		<h1 class="display-4">$Title</h1>
        	</div>
    	<% end_if %>
    </div>
	
	<div class="container">
		$Content
	</div>
</div>