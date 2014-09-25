



<div class="form-group fieldcontain ${hasErrors(bean: messagesInstance, field: 'sender', 'error')} required">
	<label class="col-sm-2 control-label" for="sender">
		<g:message class="col-sm-3" code="messages.sender.label" default="Sender" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sender" name="sender.id" from="${ShiroUser.list()}" optionKey="id" required="" value="${messagesInstance?.sender?.id}" class="many-to-one"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: messagesInstance, field: 'receiver', 'error')} required">
	<label class="col-sm-2 control-label" for="receiver">
		<g:message class="col-sm-3" code="messages.receiver.label" default="Receiver" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="receiver" name="receiver.id" from="${ShiroUser.list()}" optionKey="id" required="" value="${messagesInstance?.receiver?.id}" class="many-to-one"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: messagesInstance, field: 'message', 'error')} ">
	<label class="col-sm-2 control-label" for="message">
		<g:message class="col-sm-3" code="messages.message.label" default="Message" />
		
	</label>
	<g:textField name="message" value="${messagesInstance?.message}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: messagesInstance, field: 'borrowedMessage', 'error')} ">
	<label class="col-sm-2 control-label" for="borrowedMessage">
		<g:message class="col-sm-3" code="messages.borrowedMessage.label" default="Borrowed Message" />
		
	</label>
	<g:select id="borrowedMessage" name="borrowedMessage.id" from="${BorrowedBook.list()}" optionKey="id" value="${messagesInstance?.borrowedMessage?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: messagesInstance, field: 'statue', 'error')} ">
	<label class="col-sm-2 control-label" for="statue">
		<g:message class="col-sm-3" code="messages.statue.label" default="Statue" />
		
	</label>
	<g:checkBox name="statue" value="${messagesInstance?.statue}" />

</div>

