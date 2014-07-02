

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'friends.label', default: 'Friends')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-friends" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-friends" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table">
				<table class="table table-striped">
				<thead>
						<tr>
						
							<th><g:message code="friends.friend.label" default="Friend" /></th>
						
							<th><g:message code="friends.user.label" default="User" /></th>
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${friendsInstanceList}" status="i" var="friendsInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${friendsInstance.id}">${fieldValue(bean: friendsInstance, field: "friend")}</g:link></td>
						
							<td>${fieldValue(bean: friendsInstance, field: "user")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
				<div class="pagination">
					<g:paginate total="${friendsInstanceCount ?: 0}" />
				</div>
		</div>
	</body>
</html>
