

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shiroUser.label', default: 'ShiroUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-shiroUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="well">
				<ul style="list-style-type :none;padding:0px;">
				<li style="border-bottom:1px  #CCCCCC solid;padding:0px;">
					<label class="control-label"><strong><small>排序：</small></strong></label>
					<g:sortableColumn property="username" title="${message(code: 'shiroUser.username.label', default: 'Username')}" />
					<g:sortableColumn property="lastLoginDay" title="${message(code: 'shiroUser.username.lastLoginDay', default: 'lastLoginDay')}" />
				</li>
				<g:each in="${shiroUserInstanceList}" status="i" var="shiroUserInstance">
					<li style="border-bottom:1px  #CCCCCC solid;padding:0px;">
						<div class="col-md-2">
							<img class="img-rounded" style="width:100px;height:100px"src="${resource(dir: 'images', file: 'default_avatar.jpg')}" alt="sidebar"/>  
						</div>
						<div class="col-md-8">
							<p><g:link action="show" id="${shiroUserInstance.id}">${fieldValue(bean: shiroUserInstance, field: "username")}</g:link></p>
							<p>	<span class="label label-default">LV${fieldValue(bean: shiroUserInstance, field: "level")}</span>
								<span>最后登录:<g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${shiroUserInstance.lastLoginDay}"/></span></p>
							<p>	<span class="label label-default">拥有图书:${fieldValue(bean: shiroUserInstance, field: "numOwnedBook")};</span>
								<span class="label label-default">借阅图书:${fieldValue(bean: shiroUserInstance, field: "numBorrowedBook")};</span>
								<span class="label label-default">外借图书:${fieldValue(bean: shiroUserInstance, field: "numLendedBook")};</span>
								<span class="label label-default">读书:${fieldValue(bean: shiroUserInstance, field: "numReadedBook")};</span></p>
							<span></span>
						</div>
						<div class="col-md-2">
							<h3></h3>
							<g:form class="form-horizontal" url="[controller:'friends', action:'save']" >
								<g:hiddenField name= "friend.id" value =" ${shiroUserInstance.id} " />				
								<g:hiddenField name= "user.id" value =" ${session.ShiroUser?.id} " />
								<fieldset class="buttons">
									<g:submitButton name="create" class="btn btn-primary save" value="加为好友" />
								</fieldset>
							</g:form>
						</div>
						<div style="clear: both"></div>
					<P></P>
					</li>
				</g:each>
				</ul>
			</div>
<!--  			<div class="table">
				<table class="table table-striped">
				<thead>
						<tr>
							<g:sortableColumn property="lastLoginDay" title="${message(code: 'shiroUser.username.lastLoginDay', default: 'lastLoginDay')}" />
						
							<g:sortableColumn property="username" title="${message(code: 'shiroUser.username.label', default: 'Username')}" />
				
							<g:sortableColumn property="email" title="${message(code: 'shiroUser.email.label', default: 'Email')}" />
							
							<g:sortableColumn property="gpsLongitude" title="${message(code: 'shiroUser.gpsLongitude.label', default: 'gpsLongitude')}" />
							
							<g:sortableColumn property="gpsLatitude" title="${message(code: 'shiroUser.gpsLatitude.label', default: 'gpsLatitude')}" />

							<g:sortableColumn property="huoyuedu" title="${message(code: 'shiroUser.huoyuedu.label', default: 'Huoyuedu')}" />
						
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${shiroUserInstanceList}" status="i" var="shiroUserInstance">
						<tr class="">
							<td>${fieldValue(bean: shiroUserInstance, field: "lastLoginDay")}</td>
						
							<td><g:link action="show" id="${shiroUserInstance.id}">${fieldValue(bean: shiroUserInstance, field: "username")}</g:link></td>
						
							<td>${fieldValue(bean: shiroUserInstance, field: "email")}</td>
							
							<td>${fieldValue(bean: shiroUserInstance, field: "gpsLongitude")}</td>
						
							<td>${fieldValue(bean: shiroUserInstance, field: "gpsLatitude")}</td>
							
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
			</div> -->
				<div class="pagination">
					<g:paginate total="${shiroUserInstanceCount ?: 0}" />
				</div>
		</div>
	</body>
</html>
