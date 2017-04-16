<div class="container py-4">
	<div class="row">
		
		<div class="container<% if $SideBarView %> col-md-9 <% end_if %>">
			<h3 class="text-center">$Title</h3>
			
			<% include EntryMeta %>
			
			<% if $FeaturedImage %>
    			<div class="text-center">
    				<img class="rounded" src="$FeaturedImage.setWidth(795).Link" alt="$FeaturedImage.ALT"/>
    			</div>
    		<% end_if %>
			
			<div class="content py-3">$Content</div>
			
			
			
			$Form
			$CommentsForm
		</div>
		
		<% if $SideBarView %>
			<% include BlogSideBar %>
		<% end_if %>
		
	</div>	
</div>