

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shiroUser.label', default: 'ShiroUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-shiroUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-shiroUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table">
				<table class="table table-striped">
				<thead>
						<tr>
						
							<g:sortableColumn property="username" title="${message(code: 'shiroUser.username.label', default: 'Username')}" />
				
							<g:sortableColumn property="email" title="${message(code: 'shiroUser.email.label', default: 'Email')}" />
							
							<g:sortableColumn property="gpsLongitude" title="${message(code: 'shiroUser.gpsLongitude.label', default: 'gpsLongitude')}" />
							
							<g:sortableColumn property="gpsLatitude" title="${message(code: 'shiroUser.gpsLatitude.label', default: 'gpsLatitude')}" />

							<th><g:message code="shiroUser.profile.label" default="Profile" /></th>
						
							<g:sortableColumn property="huoyuedu" title="${message(code: 'shiroUser.huoyuedu.label', default: 'Huoyuedu')}" />
						
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${shiroUserInstanceList}" status="i" var="shiroUserInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${shiroUserInstance.id}">${fieldValue(bean: shiroUserInstance, field: "username")}</g:link></td>
						
							<td>${fieldValue(bean: shiroUserInstance, field: "email")}</td>
							
							<td>${fieldValue(bean: shiroUserInstance, field: "gpsLongitude")}</td>
						
							<td>${fieldValue(bean: shiroUserInstance, field: "gpsLatitude")}</td>
							
							<td>${fieldValue(bean: shiroUserInstance, field: "profile")}</td>
						
							<td>${fieldValue(bean: shiroUserInstance, field: "huoyuedu")}</td>
							<td>
			<g:form class="form-horizontal" url="[controller:'friends', action:'save']" >
				<g:hiddenField name= "friend.id" value =" ${shiroUserInstance.id} " />				
				<g:hiddenField name= "user.id" value =" ${session.ShiroUser?.id} " />
				<fieldset class="buttons">
					<g:submitButton name="create" class="btn btn-primary save" value="加为好友" />
				</fieldset>
			</g:form>
							</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
				<div class="pagination">
					<g:paginate total="${shiroUserInstanceCount ?: 0}" />
				</div>
		</div>
	</body>
</html>
