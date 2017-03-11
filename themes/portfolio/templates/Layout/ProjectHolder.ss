<div class="container py-4">
	<div>
		$Content
	</div>
	<div class="row">
		<% if $Children %>
			<% loop $Children %>
            	<div class="col-md-6 col-xl-3">
            		<div class="card my-1">
            			<img class="card-img-top img-fluid" src="http://placehold.it/300x200">
            			<div class="card-block">
            				<h4 class="card-title">$Title</h4>
            				<p class="card-text">$Content.FirstSentence</p>
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