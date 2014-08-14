

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'borrowedBook.label', default: 'BorrowedBook')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-borrowedBook" class="well content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list borrowedBook" style ="list-style-type : none;">
			
				<g:if test="${borrowedBookInstance?.owner}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="owner-label" class="property-label"><g:message code="borrowedBook.owner.label" default="Owner" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="owner-label"><g:link controller="shiroUser" action="show" id="${borrowedBookInstance?.owner?.id}">${borrowedBookInstance?.owner?.encodeAsHTML()}</g:link></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${borrowedBookInstance?.borrower}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="borrower-label" class="property-label"><g:message code="borrowedBook.borrower.label" default="Borrower" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="borrower-label"><g:link controller="shiroUser" action="show" id="${borrowedBookInstance?.borrower?.id}">${borrowedBookInstance?.borrower?.encodeAsHTML()}</g:link></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${borrowedBookInstance?.book}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="book-label" class="property-label"><g:message code="borrowedBook.book.label" default="Book" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="book-label"><g:link controller="book" action="show" id="${borrowedBookInstance?.book?.id}">${borrowedBookInstance?.book?.encodeAsHTML()}</g:link></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${borrowedBookInstance?.borrowStatus}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="borrowStatus-label" class="property-label"><g:message code="borrowedBook.borrowStatus.label" default="Borrow Status" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="borrowStatus-label"><g:fieldValue bean="${borrowedBookInstance}" field="borrowStatus"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${borrowedBookInstance?.dateBack}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="dateBack-label" class="property-label"><g:message code="borrowedBook.dateBack.label" default="Date Back" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="dateBack-label"><g:formatDate date="${borrowedBookInstance?.dateBack}" /></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${borrowedBookInstance?.dateCreated}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="dateCreated-label" class="property-label"><g:message code="borrowedBook.dateCreated.label" default="Date Created" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${borrowedBookInstance?.dateCreated}" /></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:borrowedBookInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="col-sm-offset-2 btn btn-primary edit" action="edit" resource="${borrowedBookInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-default delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
