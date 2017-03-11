<% if Pages %>
	<% loop Pages %>
		<% if Last %>
			<span class="breadcrumb-item active">$Title.XML</span>
		<% else %>
			<a class="breadcrumb-item" href="$Link">$MenuTitle.XML</a>
		<% end_if %>
	<% end_loop %>
<% end_if %>