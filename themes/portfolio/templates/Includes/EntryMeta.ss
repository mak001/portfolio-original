<div class="blog-post-meta text-center py-2">

	<div>
    	Posted on 
    	<a href="$getMonthlyArchiveLink('month')">
    		$PublishDate.Date
    	</a>
	</div>
	
	<% if $Credits %>
		<div>
		<%t Blog.By "by" %>
    		<% loop $Credits %>
    			<% if not $First && not $Last %>, <% end_if %>
    			<% if not $First && $Last %> <%t Blog.AND "and" %> <% end_if %>
    			<% if $URLSegment %>
    				<a href="$URL">$Name.XML</a>
    			<% else %>
    				$Name.XML
    			<% end_if %>
    		<% end_loop %>
		</div>
	<% end_if %>
	
	<% if $Categories.exists %>
		<div>
    		<%t Blog.Categories "Categories" %>
    		<% loop $Categories %>
    			<a href="$Link" title="$Title">$Title</a><% if not Last %>, <% end_if %>
    		<% end_loop %>
    	</div>
	<% end_if %>

	<% if $Tags.exists %>
		<div>
    		<%t Blog.Tags "Tags" %>
    		<% loop $Tags %>
    			<a href="$Link" title="$Title">$Title</a><% if not Last %>, <% end_if %>
    		<% end_loop %>
		</div>
	<% end_if %>

	<% if $Comments.exists %>
		<div>
    		<a href="{$Link}#comments-holder">
    			<%t Blog.Comments "Comments" %>
    			$Comments.count
    		</a>;
		</div>
	<% end_if %>

</div>
