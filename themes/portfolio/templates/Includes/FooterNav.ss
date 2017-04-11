<% cached 'FooterNav', $List('SiteTree').max('LastEdited'), $List('SiteTree').count() %>
	<% if Menu(1) %>
    	<% loop Menu(1) %>
    		<a class="nav-link btn btn-outline-secondary $LinkingMode" href="$Link">$MenuTitle</a>
    	<% end_loop %>
	<% end_if %>
<% end_cached %>
