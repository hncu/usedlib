

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-profile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-profile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table">
				<table class="table table-striped">
				<thead>
						<tr>
						
							<g:sortableColumn property="bAvatar" title="${message(code: 'profile.bAvatar.label', default: 'B Avatar')}" />
						
							<g:sortableColumn property="mAvatar" title="${message(code: 'profile.mAvatar.label', default: 'M Avatar')}" />
						
							<g:sortableColumn property="sAvatar" title="${message(code: 'profile.sAvatar.label', default: 'S Avatar')}" />
						
							<g:sortableColumn property="realname" title="${message(code: 'profile.realname.label', default: 'Realname')}" />
						
							<g:sortableColumn property="gpsLongitude" title="${message(code: 'profile.gpsLongitude.label', default: 'Gps Longitude')}" />
						
							<g:sortableColumn property="gpsLatitude" title="${message(code: 'profile.gpsLatitude.label', default: 'Gps Latitude')}" />
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${profileInstanceList}" status="i" var="profileInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${profileInstance.id}">${fieldValue(bean: profileInstance, field: "bAvatar")}</g:link></td>
						
							<td>${fieldValue(bean: profileInstance, field: "mAvatar")}</td>
						
							<td>${fieldValue(bean: profileInstance, field: "sAvatar")}</td>
						
							<td>${fieldValue(bean: profileInstance, field: "realname")}</td>
						
							<td>${fieldValue(bean: profileInstance, field: "gpsLongitude")}</td>
						
							<td>${fieldValue(bean: profileInstance, field: "gpsLatitude")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
				<div class="pagination">
					<g:paginate total="${profileInstanceCount ?: 0}" />
				</div>
		</div>
	</body>
</html>
