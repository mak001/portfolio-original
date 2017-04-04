<div class="mb-3 progress local-nav">
	
	<% if $Anchors %>
		<% loop $Anchors %>
			<div class="progress-bar bg-success h6 mb-3 mb-md-0">
				<a href="#$Text" class="p-2 $Class">$Text</a>
			</div>
		<% end_loop %>
	<% end_if %>
 	
</div>