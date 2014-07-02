



<div class="form-group fieldcontain ${hasErrors(bean: shiroUserInstance, field: 'username', 'error')} required">
	<label class="col-sm-2 control-label" for="username">
		<g:message class="col-sm-3" code="shiroUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${shiroUserInstance?.username}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: shiroUserInstance, field: 'passwordHash', 'error')} required">
	<label class="col-sm-2 control-label" for="passwordHash">
		<g:message class="col-sm-3" code="shiroUser.passwordHash.label" default="Password Hash" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="passwordHash" maxlength="70" required="" value="${shiroUserInstance?.passwordHash}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: shiroUserInstance, field: 'email', 'error')} ">
	<label class="col-sm-2 control-label" for="email">
		<g:message class="col-sm-3" code="shiroUser.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${shiroUserInstance?.email}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: shiroUserInstance, field: 'profile', 'error')} ">
	<label class="col-sm-2 control-label" for="profile">
		<g:message class="col-sm-3" code="shiroUser.profile.label" default="Profile" />
		
	</label>
	<g:select id="profile" name="profile.id" from="${Profile.list()}" optionKey="id" value="${shiroUserInstance?.profile?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: shiroUserInstance, field: 'huoyuedu', 'error')} ">
	<label class="col-sm-2 control-label" for="huoyuedu">
		<g:message class="col-sm-3" code="shiroUser.huoyuedu.label" default="Huoyuedu" />
		
	</label>
	<g:textField name="huoyuedu" value="${shiroUserInstance?.huoyuedu}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: shiroUserInstance, field: 'loginCount', 'error')} ">
	<label class="col-sm-2 control-label" for="loginCount">
		<g:message class="col-sm-3" code="shiroUser.loginCount.label" default="Login Count" />
		
	</label>
	<g:textField name="loginCount" value="${shiroUserInstance?.loginCount}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: shiroUserInstance, field: 'deleted', 'error')} ">
	<label class="col-sm-2 control-label" for="deleted">
		<g:message class="col-sm-3" code="shiroUser.deleted.label" default="Deleted" />
		
	</label>
	<g:textField name="deleted" value="${shiroUserInstance?.deleted}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: shiroUserInstance, field: 'borrowedBookOwner', 'error')} ">
	<label class="col-sm-2 control-label" for="borrowedBookOwner">
		<g:message class="col-sm-3" code="shiroUser.borrowedBookOwner.label" default="Borrowed Book Owner" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${shiroUserInstance?.borrowedBookOwner?}" var="b">
    <li><g:link controller="borrowedBook" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="borrowedBook" action="create" params="['shiroUser.id': shiroUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'borrowedBook.label', default: 'BorrowedBook')])}</g:link>
</li>
</ul>


</div>

<div class="form-group fieldcontain ${hasErrors(bean: shiroUserInstance, field: 'friends', 'error')} ">
	<label class="col-sm-2 control-label" for="friends">
		<g:message class="col-sm-3" code="shiroUser.friends.label" default="Friends" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${shiroUserInstance?.friends?}" var="f">
    <li><g:link controller="friends" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="friends" action="create" params="['shiroUser.id': shiroUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'friends.label', default: 'Friends')])}</g:link>
</li>
</ul>


</div>

<div class="form-group fieldcontain ${hasErrors(bean: shiroUserInstance, field: 'own', 'error')} ">
	<label class="col-sm-2 control-label" for="own">
		<g:message class="col-sm-3" code="shiroUser.own.label" default="Own" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${shiroUserInstance?.own?}" var="o">
    <li><g:link controller="ownedBook" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ownedBook" action="create" params="['shiroUser.id': shiroUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ownedBook.label', default: 'OwnedBook')])}</g:link>
</li>
</ul>


</div>

<div class="form-group fieldcontain ${hasErrors(bean: shiroUserInstance, field: 'permissions', 'error')} ">
	<label class="col-sm-2 control-label" for="permissions">
		<g:message class="col-sm-3" code="shiroUser.permissions.label" default="Permissions" />
		
	</label>
	

</div>

<div class="form-group fieldcontain ${hasErrors(bean: shiroUserInstance, field: 'readStatuses', 'error')} ">
	<label class="col-sm-2 control-label" for="readStatuses">
		<g:message class="col-sm-3" code="shiroUser.readStatuses.label" default="Read Statuses" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${shiroUserInstance?.readStatuses?}" var="r">
    <li><g:link controller="readStatus" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="readStatus" action="create" params="['shiroUser.id': shiroUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'readStatus.label', default: 'ReadStatus')])}</g:link>
</li>
</ul>


</div>

<div class="form-group fieldcontain ${hasErrors(bean: shiroUserInstance, field: 'roles', 'error')} ">
	<label class="col-sm-2 control-label" for="roles">
		<g:message class="col-sm-3" code="shiroUser.roles.label" default="Roles" />
		
	</label>
	<g:select name="roles" from="${ShiroRole.list()}" multiple="multiple" optionKey="id" size="5" value="${shiroUserInstance?.roles*.id}" class="many-to-many"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: shiroUserInstance, field: 'sendMessages', 'error')} ">
	<label class="col-sm-2 control-label" for="sendMessages">
		<g:message class="col-sm-3" code="shiroUser.sendMessages.label" default="Send Messages" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${shiroUserInstance?.sendMessages?}" var="s">
    <li><g:link controller="messages" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="messages" action="create" params="['shiroUser.id': shiroUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'messages.label', default: 'Messages')])}</g:link>
</li>
</ul>


</div>

