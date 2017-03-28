<div class="container py-4">
	
	<% if $MainImageHasLogo %>
    	<div class="jumbotron bg-info text-center $ExtraClasses" id="project-header" style="background-image: url($MainPhotoResizeLink(1110, 350))">
        </div>
    <% else %>
		<div class="jumbotron bg-info text-center overlay $ExtraClasses" id="project-header" style="background-image: url($MainPhotoResizeLink(1110, 350))">
        	<div class="container">
        		<h1 class="display-4">$Title</h1>
        	</div>
        </div>
    <% end_if %>
	
	<div class="row">
		<div class="container text-center text-md-left col-md-6 mb-3">
    		<% if $Languages %>
    			<h4>Languages</h4>
    			<% loop $Languages %>
        			<a href="$Link" class="language-container">
        				<div class="language" style="background-color:#$BGColor">$Title</div>
    				</a>
    			<% end_loop %>
    		<% end_if %>
    	</div>
    	
    	<div class="container text-center text-md-right col-md-6 mb-3">
    		<% if $Frameworks %>
    			<h4>Frameworks</h4>
    			<% loop $Frameworks %>
        			<a href="$Link" class="framework-container">
        				<div class="framework" style="background-color:#$BGColor">$Title</div>
    				</a>
    			<% end_loop %>
    		<% end_if %>
    	</div>
	</div>
	<div class="mb-3">
		<% if $ViewLink %>
			<a href="$ShowLink">View</a>
		<% end_if %>
		<% if $SourceLink %>
			<a href="SourceLink">View source</a>
		<% end_if %>
	</div>
	
	<div class="project-info">
		$Content
	</div>
</div>