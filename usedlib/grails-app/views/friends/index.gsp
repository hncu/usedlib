

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'friends.label', default: 'Friends')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-friends" class="content scaffold-list" role="main">
			<!--<h1><g:message code="default.list.label" args="[entityName]" /></h1>-->
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
				<h2>我的好友</h2>
				<g:each in="${friendsInstanceList}" status="i" var="friendsInstance">
					<li style="border-bottom:1px  #CCCCCC solid;padding:0px;">
						<g:if test="${friendsInstance.user.id==session.ShiroUser.id}">
						<p hidden="hidden">${shiroUserInstance=friendsInstance.friend}</p>
							<div class="col-md-2">
								<img class="img-rounded" style="width:100px;height:100px"src="${resource(dir: 'images/avatar', file: "${shiroUserInstance.profile.bAvatar}")}" alt="sidebar"/>  
							</div>
							<div class="col-md-8">
								<p><g:link controller="ShiroUser" action="show" id="${shiroUserInstance.id}">${fieldValue(bean: shiroUserInstance, field: "username")}</g:link></p>
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
								<g:if test="${friendsInstance.status==1}">
									<g:form class="form-horizontal" url="[resource:friendsInstance, action:'update']" method="PUT" >
										<g:hiddenField name="version" value="${friendsInstance?.version}" />
										<g:hiddenField name="status" value="2" />
										<fieldset class="buttons">
											<g:actionSubmit class="col-sm-offset-2 btn btn-primary save" action="update" value="同意${message(code: 'default.button.update.label', default: 'Update')}" />
										</fieldset>
									</g:form>
									<g:form class="form-horizontal" url="[resource:friendsInstance, action:'delete']" method="DELETE">
										<g:hiddenField name="version" value="${friendsInstance?.version}" />
										<fieldset class="buttons">
											<g:actionSubmit class="col-sm-offset-2 btn btn-primary delete" action="delete" value="拒绝${message(code: 'default.button.delete.label', default: 'Delete')}"/>
										</fieldset>
									</g:form>								
								</g:if>
								<g:if test="${friendsInstance.status==2}">
									<g:form class="form-horizontal" url="[resource:friendsInstance,controller:'friends', action:'delete']" method="DELETE">
										<g:hiddenField name= "friend" value =" ${friendsInstance.id} " />				
										<fieldset class="buttons">
											<g:submitButton name="delete" class="btn btn-primary save" value="删除好友" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
										</fieldset>
									</g:form>								
								</g:if>
							</div>
							<div style="clear: both"></div>
						<P></P>
						</g:if>

						<g:if test="${friendsInstance.friend.id==session.ShiroUser.id }">
						<p hidden="hidden">${shiroUserInstance=friendsInstance.user}</p>
							<div class="col-md-2">
								<img class="img-rounded" style="width:100px;height:100px"src="${resource(dir: 'images/avatar', file: "${shiroUserInstance.profile.bAvatar}")}" alt="sidebar"/>  
							</div>
							<div class="col-md-8">
								<p><g:link controller="ShiroUser" action="show" id="${shiroUserInstance.id}">${fieldValue(bean: shiroUserInstance, field: "username")}</g:link></p>
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
								<g:if test="${friendsInstance.status==1}">
									<g:form class="form-horizontal" url="[resource:friendsInstance, action:'update']" method="PUT" >
										<g:hiddenField name="version" value="${friendsInstance?.version}" />
										<g:hiddenField name="status" value="2" />
										<fieldset class="buttons">
											<g:actionSubmit class="col-sm-offset-2 btn btn-primary save" action="update" value="同意${message(code: 'default.button.update.label', default: 'Update')}" />
										</fieldset>
									</g:form>
									<g:form class="form-horizontal" url="[resource:friendsInstance, action:'delete']" method="DELETE">
										<g:hiddenField name="version" value="${friendsInstance?.version}" />
										<fieldset class="buttons">
											<g:actionSubmit class="col-sm-offset-2 btn btn-primary delete" action="delete" value="拒绝${message(code: 'default.button.delete.label', default: 'Delete')}"/>
										</fieldset>
									</g:form>								
								</g:if>
								<g:if test="${friendsInstance.status==2}">
									<g:form class="form-horizontal" url="[resource:friendsInstance,controller:'friends', action:'delete']" method="DELETE">
										<g:hiddenField name= "friend" value =" ${friendsInstance.id} " />				
										<fieldset class="buttons">
											<g:submitButton name="delete" class="btn btn-primary save" value="删除好友" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
										</fieldset>
									</g:form>								
								</g:if>
	
							</div>
							<div style="clear: both"></div>
						<P></P>
						</g:if>

					</li>
				</g:each>
				</ul>
			</div>			
<!-- 			<div class="table">
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
			</div> -->
				<div class="pagination">
					<g:paginate total="${friendsInstanceCount ?: 0}" />
				</div>
		</div>
	</body>
</html>
