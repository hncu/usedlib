

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		 <script type="text/javascript" src="/usedlib/js/douban_api.js"></script><!-- -->
		
	</head>
	<body>
		<div id="list-book" class="content scaffold-list" role="main">
			<!-- <h1><g:message code="default.list.label" args="[entityName]" /></h1> -->
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="well">
				<h3>图书搜索</h3></br>
				<g:remoteLink controller="book" action="findBook" update="divContactList">test</g:remoteLink>
				<div id="distance">
					<label>距离：</label>
					<g:remoteLink controller="book" action="findBook" params="[distance:0]" update="divContactList" style="margin-right: 12px;">全部</g:remoteLink>
					<g:remoteLink controller="book" action="findBook" params="[distance:1]" update="divContactList" style="margin-right: 12px;">1公里</g:remoteLink>
					<g:remoteLink controller="book" action="findBook" params="[distance:2]" update="divContactList" style="margin-right: 12px;">2公里</g:remoteLink>
					<g:remoteLink controller="book" action="findBook" params="[distance:5]" update="divContactList" style="margin-right: 12px;">5公里</g:remoteLink>
					<g:remoteLink controller="book" action="findBook" params="[distance:10]" update="divContactList" style="margin-right: 12px;">10公里</g:remoteLink>
				</div>
			</div>
			<div id="divContactList">	
				<g:render template="findBook"/>
			</div>			
		</div>
	</body>
</html>
