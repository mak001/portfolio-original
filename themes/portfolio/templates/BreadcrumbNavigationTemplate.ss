<% if Pages && Pages.Count > 1 %>
	<div class="breadcrumb rounded-0">
		<div class="container">
        	<% loop Pages %>
        		<% if Last %>
        			<span class="breadcrumb-item active">$MenuTitle.XML</span>
        		<% else %>
        			<a class="breadcrumb-item" href="$Link">$MenuTitle.XML</a>
        		<% end_if %>
        	<% end_loop %>
        </div>
	</div>
<% end_if %>