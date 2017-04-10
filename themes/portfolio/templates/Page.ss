<!DOCTYPE html>
<html lang="en">
	<head>
		<% base_tag %>
		$MetaTags(false)
		<title>Matthew Koerber :: $Title</title>
		<!-- Required meta tags -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<% include GoogleAnalyticsHead %>
	</head>
	<body>
		<% include GoogleAnalyticsBody %>
		<% include Header %>
		<% include MainNav %>
		
		<main class="$URLSegment">
			<% include BreadcrumbNavigationTemplate %>
			
			$Layout
		</main>
		
		<% include Footer %>
	</body>
</html>