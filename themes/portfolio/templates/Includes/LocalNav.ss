<% cached $LocalNavCacheKey, $LastEdited unless $ShouldUpdate %>
    <div class="mb-3 progress local-nav">
    	
    	<% if $Anchors %>
    		<% loop $Anchors %>
    			<div class="progress-bar $Class h6 mb-3 mb-md-0">
    				<a href="#$Text" class="p-2">$Text</a>
    			</div>
    		<% end_loop %>
    	<% end_if %>
     	
    </div>
<% end_cached %>