<% cached 'FooterNav', $List('SiteTree').max('LastEdited'), $List('SiteTree').count() %>
	<% if Menu(1) %>
    	<% loop Menu(1) %>
    		<a class="nav-link btn btn-outline-secondary text-center $LinkingMode" href="$Link">
    			<span class="text">$MenuTitle</span>
    		</a>
    	<% end_loop %>
	<% end_if %>
<% end_cached %>
