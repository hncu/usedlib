



<div class="form-group fieldcontain ${hasErrors(bean: borrowedBookInstance, field: 'owner', 'error')} required">
	<label class="col-sm-2 control-label" for="owner">
		<g:message class="col-sm-3" code="borrowedBook.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${ShiroUser.list()}" optionKey="id" required="" value="${borrowedBookInstance?.owner?.id}" class="many-to-one"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: borrowedBookInstance, field: 'borrower', 'error')} required">
	<label class="col-sm-2 control-label" for="borrower">
		<g:message class="col-sm-3" code="borrowedBook.borrower.label" default="Borrower" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="borrower" name="borrower.id" from="${ShiroUser.list()}" optionKey="id" required="" value="${borrowedBookInstance?.borrower?.id}" class="many-to-one"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: borrowedBookInstance, field: 'book', 'error')} required">
	<label class="col-sm-2 control-label" for="book">
		<g:message class="col-sm-3" code="borrowedBook.book.label" default="Book" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="book" name="book.id" from="${Book.list()}" optionKey="id" required="" value="${borrowedBookInstance?.book?.id}" class="many-to-one"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: borrowedBookInstance, field: 'borrowStatus', 'error')} required">
	<label class="col-sm-2 control-label" for="borrowStatus">
		<g:message class="col-sm-3" code="borrowedBook.borrowStatus.label" default="Borrow Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="borrowStatus" type="number" value="${borrowedBookInstance.borrowStatus}" required=""/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: borrowedBookInstance, field: 'dateBack', 'error')} required">
	<label class="col-sm-2 control-label" for="dateBack">
		<g:message class="col-sm-3" code="borrowedBook.dateBack.label" default="Date Back" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateBack" precision="day"  value="${borrowedBookInstance?.dateBack}"  />

</div>

