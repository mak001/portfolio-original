<% if Menu(1) %>
    <nav class="nav flex-column">
    	<% loop Menu(1) %>
    		<a class="nav-link $LinkingMode ml-2" href="$Link">$MenuTitle</a>
    	<% end_loop %>
    </nav>
<% end_if %>
