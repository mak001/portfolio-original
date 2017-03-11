<% if Menu(1) %>
    <nav class="nav justify-content-center flex-column flex-md-row sticky-top" role="navigation">
    	<% loop Menu(1) %>
    		<a class="nav-link h5 m-0 $LinkingMode" href="$Link">$MenuTitle</a>
    	<% end_loop %>
    </nav>
<% end_if %>
