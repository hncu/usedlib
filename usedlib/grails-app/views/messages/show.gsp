

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'messages.label', default: 'Messages')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-messages" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-messages" class="well content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list messages" style ="list-style-type : none;">
			
				<g:if test="${messagesInstance?.sender}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="sender-label" class="property-label"><g:message code="messages.sender.label" default="Sender" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="sender-label"><g:link controller="shiroUser" action="show" id="${messagesInstance?.sender?.id}">${messagesInstance?.sender?.encodeAsHTML()}</g:link></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${messagesInstance?.receiver}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="receiver-label" class="property-label"><g:message code="messages.receiver.label" default="Receiver" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="receiver-label"><g:link controller="shiroUser" action="show" id="${messagesInstance?.receiver?.id}">${messagesInstance?.receiver?.encodeAsHTML()}</g:link></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${messagesInstance?.message}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="message-label" class="property-label"><g:message code="messages.message.label" default="Message" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="message-label"><g:fieldValue bean="${messagesInstance}" field="message"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${messagesInstance?.borrowedMessage}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="borrowedMessage-label" class="property-label"><g:message code="messages.borrowedMessage.label" default="Borrowed Message" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="borrowedMessage-label"><g:link controller="borrowedBook" action="show" id="${messagesInstance?.borrowedMessage?.id}">${messagesInstance?.borrowedMessage?.encodeAsHTML()}</g:link></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${messagesInstance?.dateCreated}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="dateCreated-label" class="property-label"><g:message code="messages.dateCreated.label" default="Date Created" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${messagesInstance?.dateCreated}" /></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${messagesInstance?.statue}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="statue-label" class="property-label"><g:message code="messages.statue.label" default="Statue" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="statue-label"><g:formatBoolean boolean="${messagesInstance?.statue}" /></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:messagesInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="col-sm-offset-2 btn btn-primary edit" action="edit" resource="${messagesInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-default delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
