

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'friends.label', default: 'Friends')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-friends" class="well content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list friends" style ="list-style-type : none;">
			
				<g:if test="${friendsInstance?.friend}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="friend-label" class="property-label"><g:message code="friends.friend.label" default="Friend" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="friend-label"><g:link controller="shiroUser" action="show" id="${friendsInstance?.friend?.id}">${friendsInstance?.friend?.encodeAsHTML()}</g:link></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${friendsInstance?.user}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="user-label" class="property-label"><g:message code="friends.user.label" default="User" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="user-label"><g:link controller="shiroUser" action="show" id="${friendsInstance?.user?.id}">${friendsInstance?.user?.encodeAsHTML()}</g:link></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:friendsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="col-sm-offset-2 btn btn-primary edit" action="edit" resource="${friendsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-default delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
