<div class="container">
	
	<% if $MainImageHasLogo %>
    	<div class="jumbotron bg-info text-center" id="project-header" style="background-image: url($MainPhotoResizeLink(1110, 350))">
        </div>
    <% else %>
		<div class="jumbotron bg-info text-center overlay" id="project-header" style="background-image: url($MainPhotoResizeLink(1110, 350))">
        	<div class="container">
        		<h1 class="display-4">$Title</h1>
        	</div>
        </div>
    <% end_if %>
	
	<% if $Languages %>
		<div class="container text-center">
			<h4>Languages used:</h4>
			<% loop $Languages %>
    			<a href="$Link" class="language-container">
    				<div class="language" style="background-color:#$BGColor">$Title</div>
				</a>
			<% end_loop %>
		</div>
	<% end_if %>
	
	<% if $Frameworks %>
		<div class="container text-center">
			<h4>Frameworks used:</h4>
			<% loop $Frameworks %>
    			<a href="$Link" class="language-container">
    				<div class=language style="background-color:#$BGColor">$Title</div>
				</a>
			<% end_loop %>
		</div>
	<% end_if %>
	
	<div class="container">
		$Content
	</div>
</div>