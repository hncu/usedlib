



<div class="form-group fieldcontain ${hasErrors(bean: bookInstance, field: 'title', 'error')} required">
	<label class="col-sm-2 control-label" for="title">
		<g:message class="col-sm-3" code="book.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${bookInstance?.title}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: bookInstance, field: 'isbn13', 'error')} required">
	<label class="col-sm-2 control-label" for="isbn13">
		<g:message class="col-sm-3" code="book.isbn13.label" default="Isbn13" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="isbn13" required="" value="${bookInstance?.isbn13}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: bookInstance, field: 'author', 'error')} ">
	<label class="col-sm-2 control-label" for="author">
		<g:message class="col-sm-3" code="book.author.label" default="Author" />
		
	</label>
	<g:textField name="author" value="${bookInstance?.author}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: bookInstance, field: 'publisher', 'error')} ">
	<label class="col-sm-2 control-label" for="publisher">
		<g:message class="col-sm-3" code="book.publisher.label" default="Publisher" />
		
	</label>
	<g:textField name="publisher" value="${bookInstance?.publisher}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: bookInstance, field: 'pubdate', 'error')} ">
	<label class="col-sm-2 control-label" for="pubdate">
		<g:message class="col-sm-3" code="book.pubdate.label" default="Pubdate" />
		
	</label>
	<g:textField name="pubdate" value="${bookInstance?.pubdate}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: bookInstance, field: 'summary', 'error')} ">
	<label class="col-sm-2 control-label" for="summary">
		<g:message class="col-sm-3" code="book.summary.label" default="Summary" />
		
	</label>
	<g:textField name="summary" value="${bookInstance?.summary}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: bookInstance, field: 'imageUrl', 'error')} ">
	<label class="col-sm-2 control-label" for="imageUrl">
		<g:message class="col-sm-3" code="book.imageUrl.label" default="Image Url" />
		
	</label>
	<g:textField name="imageUrl" value="${bookInstance?.imageUrl}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: bookInstance, field: 'tags', 'error')} ">
	<label class="col-sm-2 control-label" for="tags">
		<g:message class="col-sm-3" code="book.tags.label" default="Tags" />
		
	</label>
	<g:textField name="tags" value="${bookInstance?.tags}"/>

</div>

