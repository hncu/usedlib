

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ownedBook.label', default: 'OwnedBook')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ownedBook" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ownedBook" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table">
				<table class="table table-striped">
				<thead>
						<tr>
						
							<th><g:message code="ownedBook.book.label" default="Book" /></th>
						
							<th><g:message code="ownedBook.user.label" default="User" /></th>
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'ownedBook.dateCreated.label', default: 'Date Created')}" />
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${ownedBookInstanceList}" status="i" var="ownedBookInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${ownedBookInstance.id}">${fieldValue(bean: ownedBookInstance, field: "book")}</g:link></td>
						
							<td>${fieldValue(bean: ownedBookInstance, field: "user")}</td>
						
							<td><g:formatDate date="${ownedBookInstance.dateCreated}" /></td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
				<div class="pagination">
					<g:paginate total="${ownedBookInstanceCount ?: 0}" />
				</div>
		</div>
	</body>
</html>
