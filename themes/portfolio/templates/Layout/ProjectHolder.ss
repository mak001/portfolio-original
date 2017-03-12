<div class="container py-4">
	<div>
		$Content
	</div>
	<div class="row">
	
		<% if $PaginatedLanguages %>
			<% loop $PaginatedLanguages %>
			<div class="col-md-6 col-xl-3">
            		<div class="card my-1">

            			<div class="card-block">
            				<h4 class="card-title">$Title</h4>
            				<a href="$Link" class="btn btn-primary">Projects</a>
            			</div>
            		</div>
            	</div>
			<% end_loop %>
		<% else_if $PaginatedProjects %>
			<% loop $PaginatedProjects %>
            	<div class="col-md-6 col-xl-3">
            		<div class="card my-1">

            			<img class="card-img-top img-fluid" src="$MainPhotoResizeLink(510, 200)">
            			
            			<div class="card-block">
            				<h4 class="card-title">$Title</h4>
            				<p class="card-text">
                				<% if $Teaser %>
                					$Teaser
                				<% else %>
                					$Content.FirstSentence
                				<% end_if %>
            				</p>
            				<a href="$Link" class="btn btn-primary">Details...</a>
            			</div>
            		</div>
            	</div>
        	<% end_loop %>
        <% else %>
        	<div class="no-projects">
        		No projects found.
        	</div>
        <% end_if %>
	</div>
</div>