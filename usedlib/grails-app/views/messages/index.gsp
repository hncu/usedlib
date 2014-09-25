

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'messages.label', default: 'Messages')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
<!--  	<a href="#list-messages" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
-->	
		<div id="list-messages" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table">
				<table class="table table-striped">
				<thead>
						<tr>
						
							<th><g:message code="messages.sender.label" default="Sender" /></th>
						
							<th><g:message code="messages.receiver.label" default="Receiver" /></th>
						
							<g:sortableColumn property="message" title="${message(code: 'messages.message.label', default: 'Message')}" />
						
							<th><g:message code="messages.borrowedMessage.label" default="Borrowed Message" /></th>
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'messages.dateCreated.label', default: 'Date Created')}" />
						
							<th></th>
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${messagesInstanceList}" status="i" var="messagesInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link controller="ShiroUser" action="show" id="${messagesInstance.sender.id}">${fieldValue(bean: messagesInstance, field: "sender")}</g:link></td>
						
							<td>${fieldValue(bean: messagesInstance, field: "receiver")}</td>
						
							<td>${fieldValue(bean: messagesInstance, field: "message")}</td>
						
							<td>${fieldValue(bean: messagesInstance, field: "borrowedMessage")}</td>
						
							<td><g:formatDate date="${messagesInstance.dateCreated}" /></td>
						
							<td>			
			<g:form url="[resource:messagesInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-default delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
							</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
				<div class="pagination">
					<g:paginate total="${messagesInstanceCount ?: 0}" />
				</div>
		</div>
	</body>
</html>
