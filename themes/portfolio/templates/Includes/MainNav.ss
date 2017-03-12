<% if Menu(1) %>
    <nav class="navbar navbar-toggleable-sm sticky-top py-0" role="navigation">
    	<div class="container p-0 m-0">
    		<button class="navbar-toggler" data-toggle="collapse" data-target="#mainNav" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
    		
    		<div class="collapse navbar-collapse" id="mainNav">
    			<div class="navbar-nav mx-auto text-center">
        			<% loop Menu(1) %>
        				<a class="nav-item nav-link px-3 $LinkingMode" href="$Link">$MenuTitle</a>
        			<% end_loop %>
    			</div>
    		</div>
    	</div>
    	<!--  justify-content-center flex-column flex-md-row  -->
    	
    </nav>
<% end_if %>
