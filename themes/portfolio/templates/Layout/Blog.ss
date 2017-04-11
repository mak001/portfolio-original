<div class="container py-4">
	<div class="row">
		<div class="col-12">
			<h3 class="text-center">
    			<% if $ArchiveYear %>
    				<%t Blog.Archive 'Archive' %>:
    				<% if $ArchiveDay %>
    					$ArchiveDate.Nice
    				<% else_if $ArchiveMonth %>
    					$ArchiveDate.format('F, Y')
    				<% else %>
    					$ArchiveDate.format('Y')
    				<% end_if %>
    			<% else_if $CurrentTag %>
    				<%t Blog.Tag 'Tag' %>: $CurrentTag.Title
    			<% else_if $CurrentCategory %>
    				<%t Blog.Category 'Category' %>: $CurrentCategory.Title
    			<% else %>
    				$Title
    			<% end_if %>
			</h3>
		</div>
		
		<div class="col-12 content">
			$Content
		</div>
	
		<div class="container<% if $SideBarView %> col-md-9 <% end_if %>">
			<div class="card-deck">
    			<% if $PaginatedList.Exists %>
        			<% loop $PaginatedList %>
        				<% include PostSummary %>
        			<% end_loop %>
        		<% else %>
        			<p><%t Blog.NoPosts 'There are no posts' %></p>
        		<% end_if %>
    		</div>
		</div>
		
		<% if $SideBarView %>
			<% include BlogSideBar %>
		<% end_if %>
		
	</div>
</div>