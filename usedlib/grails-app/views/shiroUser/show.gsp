

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shiroUser.label', default: 'ShiroUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-shiroUser" class="well content scaffold-show" role="main">
			<!--<h1><g:message code="default.show.label" args="[entityName]" /></h1>-->
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list shiroUser" style ="list-style-type : none;">
			
				<g:if test="${shiroUserInstance?.username}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="username-label" class="property-label"><g:message code="shiroUser.username.label" default="Username" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${shiroUserInstance}" field="username"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>

			
				<g:if test="${shiroUserInstance?.email}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="email-label" class="property-label"><g:message code="shiroUser.email.label" default="Email" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${shiroUserInstance}" field="email"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.profile}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="profile-label" class="property-label"><g:message code="shiroUser.profile.label" default="Profile" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="profile-label"><g:link controller="profile" action="show" id="${shiroUserInstance?.profile?.id}">${shiroUserInstance?.profile?.encodeAsHTML()}</g:link></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.huoyuedu}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="huoyuedu-label" class="property-label"><g:message code="shiroUser.huoyuedu.label" default="Huoyuedu" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="huoyuedu-label"><g:fieldValue bean="${shiroUserInstance}" field="huoyuedu"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.loginCount}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="loginCount-label" class="property-label"><g:message code="shiroUser.loginCount.label" default="Login Count" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="loginCount-label"><g:fieldValue bean="${shiroUserInstance}" field="loginCount"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.deleted}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="deleted-label" class="property-label"><g:message code="shiroUser.deleted.label" default="Deleted" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="deleted-label"><g:fieldValue bean="${shiroUserInstance}" field="deleted"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.borrowedBookOwner}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="borrowedBookOwner-label" class="property-label"><g:message code="shiroUser.borrowedBookOwner.label" default="Borrowed Book Owner" /></span></dt>
						<dd>
						
							<g:each in="${shiroUserInstance.borrowedBookOwner}" var="b">
							<span class="property-value" aria-labelledby="borrowedBookOwner-label"><g:link controller="borrowedBook" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
							<br/>
							</g:each>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.friends}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="friends-label" class="property-label"><g:message code="shiroUser.friends.label" default="Friends" /></span></dt>
						<dd>
						
							<g:each in="${shiroUserInstance.friends}" var="f">
							<span class="property-value" aria-labelledby="friends-label"><g:link controller="friends" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
							</g:each>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.own}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="own-label" class="property-label"><g:message code="shiroUser.own.label" default="Own" /></span></dt>
						<dd>
						
							<g:each in="${shiroUserInstance.own}" var="o">
							<span class="property-value" aria-labelledby="own-label"><g:link controller="ownedBook" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
							</g:each>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.permissions}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="permissions-label" class="property-label"><g:message code="shiroUser.permissions.label" default="Permissions" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="permissions-label"><g:fieldValue bean="${shiroUserInstance}" field="permissions"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.readStatuses}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="readStatuses-label" class="property-label"><g:message code="shiroUser.readStatuses.label" default="Read Statuses" /></span></dt>
						<dd>
						
							<g:each in="${shiroUserInstance.readStatuses}" var="r">
							<span class="property-value" aria-labelledby="readStatuses-label"><g:link controller="readStatus" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
							</g:each>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.roles}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="roles-label" class="property-label"><g:message code="shiroUser.roles.label" default="Roles" /></span></dt>
						<dd>
						
							<g:each in="${shiroUserInstance.roles}" var="r">
							<span class="property-value" aria-labelledby="roles-label"><g:link controller="shiroRole" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
							</g:each>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.sendMessages}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="sendMessages-label" class="property-label"><g:message code="shiroUser.sendMessages.label" default="Send Messages" /></span></dt>
						<dd>
						
							<g:each in="${shiroUserInstance.sendMessages}" var="s">
							<span class="property-value" aria-labelledby="sendMessages-label"><g:link controller="messages" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
							</g:each>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:shiroUserInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="col-sm-offset-2 btn btn-primary edit" action="edit" resource="${shiroUserInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-default delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
