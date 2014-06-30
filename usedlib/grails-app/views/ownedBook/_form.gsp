



<div class="form-group fieldcontain ${hasErrors(bean: ownedBookInstance, field: 'book', 'error')} required">
	<label class="col-sm-2 control-label" for="book">
		<g:message class="col-sm-3" code="ownedBook.book.label" default="Book" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="book" name="book.id" from="${Book.list()}" optionKey="id" required="" value="${ownedBookInstance?.book?.id}" class="many-to-one"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: ownedBookInstance, field: 'user', 'error')} required">
	<label class="col-sm-2 control-label" for="user">
		<g:message class="col-sm-3" code="ownedBook.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${ShiroUser.list()}" optionKey="id" required="" value="${ownedBookInstance?.user?.id}" class="many-to-one"/>

</div>

