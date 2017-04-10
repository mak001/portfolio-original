<div class="container py-4">
	<% if not Pages || Pages.Count == 1 %>
    	<div>
    		$Content
    	</div>	
	<% end_if %>
	<div class="mb-3 progress project-holder-nav">
		<div class="progress-bar bg-success h6 mb-3 mb-md-0">
			<a href="$Link" class="p-2">Projects</a>
		</div>
  		<div class="progress-bar bg-warning h6 mb-3 mb-md-0">
  			<a href="$LanguageLink" class="p-2">Langauges</a>
  		</div>
  		<div class="progress-bar bg-info h6 mb-3 mb-md-0">
  			<a href="$FrameworkLink" class="p-2">Frameworks</a>
  		</div>
  	</div>
    	
	<div class="row">
	
		<% if $PaginatedLanguages %>
			<% loop $PaginatedLanguages %>
			<div class="col-md-6 col-xl-4">
            		<div class="card my-1 uses">
            			<a href="$Link">
							<h4 class="card-title" style="background-color: #$BGColor">$Title</h4>
						</a>
            			<div class="card-block">
            				<p class="card-text">$Description</p>
            				<a href="$Link" class="btn btn-primary">Projects</a>
            			</div>
            		</div>
            	</div>
			<% end_loop %>
			
			<% with $PaginatedLanguages %>
				<% include Pagination %>
			<% end_with %>
			
		<% else_if $PaginatedFrameworks %>
			<% loop $PaginatedFrameworks %>
			<div class="col-md-6 col-xl-4">
            		<div class="card my-1 uses">
            			<a href="$Link">
							<h4 class="card-title" style="background-color: #$BGColor">$Title</h4>
						</a>
            			<div class="card-block">
            				<p class="card-text">$Description</p>
            				<a href="$Link" class="btn btn-primary">Projects</a>
            			</div>
            		</div>
            	</div>
			<% end_loop %>
			
			<% with $PaginatedFrameworks %>
				<% include Pagination %>
			<% end_with %>
			
		<% else_if $PaginatedProjects %>
			
			<% if $SelectedLanguage %>
				<div class="container row">
    				<div class="col-md-8 col-lg-6 mx-auto text-center uses-header">
    					<hr class="col-12"/>
    					<h3>$SelectedLanguage.Title</h3>
    					<p>$SelectedLanguage.Description</p>
    					<hr class="col-12"/>
    				</div>
				</div>
			<% end_if %>
			
			<% if $SelectedFramework %>
				<div class="container row">
    				<div class="col-md-8 col-lg-6 mx-auto text-center uses-header">
    					<hr class="col-12"/>
    					<h3>$SelectedFramework.Title</h3>
    					<p>$SelectedFramework.Description</p>
    					<hr class="col-12"/>
    				</div>
				</div>
			<% end_if %>
			
			
			
			<% loop $PaginatedProjects %>
            	<div class="col-md-6 col-xl-4">
            		<div class="card my-1 project">

						<a href="$Link">
            			<img class="card-img-top img-fluid" 
            				src="$MainPhotoResizeLink(510, 200)"
            				alt="$MainPhoto.ALT">
            			</a>
            			
            			<div class="card-block">
            				<h4 class="card-title">$Title</h4>
            				<p class="card-text">
                				<% if $Teaser %>
                					$Teaser
                				<% else %>
                					$Content.FirstSentence
                				<% end_if %>
            				</p>
            				<div class="btn-container">
            					<a href="$Link" class="btn btn-primary">Details...</a>
            				</div>
            				
            				<div class="btn-container">
	            				<% if $ViewLinks %>
	            					<% loop $ViewLinks %>
	            						<a href="$ShowLink($Pos)" class="btn btn-info">$Title</a>
	            					<% end_loop %>
	            				<% end_if %>
            				</div>
            				
            				<div class="btn-container">
	            				<% if $Sources %>
	            					<% loop $Sources %>
	            						<a href="$Link" class="btn btn-success">$Title</a>
	            					<% end_loop %>
	            				<% end_if %>
	            			</div>
            			</div>
            		</div>
            	</div>
        	<% end_loop %>
        	
        	<% with $PaginatedProjects %>
				<% include Pagination %>
			<% end_with %>
			
        <% else %>
        	<div class="no-projects">
        		No projects found.
        	</div>
        <% end_if %>
	</div>
</div>