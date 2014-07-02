



<div class="form-group fieldcontain ${hasErrors(bean: friendsInstance, field: 'friend', 'error')} required">
	<label class="col-sm-2 control-label" for="friend">
		<g:message class="col-sm-3" code="friends.friend.label" default="Friend" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="friend" name="friend.id" from="${ShiroUser.list()}" optionKey="id" required="" value="${friendsInstance?.friend?.id}" class="many-to-one"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: friendsInstance, field: 'user', 'error')} required">
	<label class="col-sm-2 control-label" for="user">
		<g:message class="col-sm-3" code="friends.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${ShiroUser.list()}" optionKey="id" required="" value="${friendsInstance?.user?.id}" class="many-to-one"/>

</div>

