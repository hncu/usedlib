

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'borrowedBook.label', default: 'BorrowedBook')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<g:if test="${params.lendOrBorrow=='borrow'}">	
		<h2>借入图书</h2>
		<div id="list-borrowedBook" class="content scaffold-list" role="main">
			<!--<h1><g:message code="default.list.label" args="[entityName]" /></h1>-->
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table">
				<table class="table table-striped">
				<thead>
						<tr>
						
							<th><g:message code="borrowedBook.owner.label" default="Owner" /></th>
						
							<th><g:message code="borrowedBook.borrower.label" default="Borrower" /></th>
						
							<th><g:message code="borrowedBook.book.label" default="Book" /></th>
						
							<g:sortableColumn hidden="hide" property="borrowStatus" title="${message(code: 'borrowedBook.borrowStatus.label', default: 'Borrow Status')}" />
						
							<g:sortableColumn property="dateBack" title="${message(code: 'borrowedBook.dateBack.label', default: 'Date Back')}" />
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'borrowedBook.dateCreated.label', default: 'Date Created')}" />
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${borrowedBookInstanceList}" status="i" var="borrowedBookInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${borrowedBookInstance.id}">${fieldValue(bean: borrowedBookInstance, field: "owner")}</g:link></td>
						
							<td>${fieldValue(bean: borrowedBookInstance, field: "borrower")}</td>
						
							<td>${fieldValue(bean: borrowedBookInstance, field: "book")}</td>
						
							<td hidden="hide">${fieldValue(bean: borrowedBookInstance, field: "borrowStatus")}</td>
						
							<td><g:formatDate date="${borrowedBookInstance.dateBack}" /></td>
						
							<td><g:formatDate date="${borrowedBookInstance.dateCreated}" /></td>
							<td>
			<g:form url="[resource:borrowedBookInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-primary delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
				<div class="pagination">
					<g:paginate total="${borrowedBookInstanceCount ?: 0}" params="['lendOrBorrow':'borrow']"/>
				</div>
		</div>
	</g:if>
	<g:if test="${params.lendOrBorrow=='lend'}">
		<h2>借出图书</h2>
		<div id="list-borrowedBook" class="content scaffold-list" role="main">
			<!--<h1><g:message code="default.list.label" args="[entityName]" /></h1>-->
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table">
				<table class="table table-striped">
				<thead>
						<tr>
						
							<!-- <th><g:message code="borrowedBook.owner.label" default="Owner" /></th> -->
						
							<th><g:message code="borrowedBook.borrower.label" default="Borrower" /></th>
						
							<th><g:message code="borrowedBook.book.label" default="Book" /></th>
						
							<g:sortableColumn hidden="hide" property="borrowStatus" title="${message(code: 'borrowedBook.borrowStatus.label', default: 'Borrow Status')}" />
						
							<g:sortableColumn property="dateBack" title="${message(code: 'borrowedBook.dateBack.label', default: 'Date Back')}" />
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'borrowedBook.dateCreated.label', default: 'Date Created')}" />
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${lendedBookInstanceList}" status="i" var="borrowedBookInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
						<!--  	<td><g:link action="show" id="${borrowedBookInstance.id}">${fieldValue(bean: borrowedBookInstance, field: "owner")}</g:link></td>-->
						
							<td>${fieldValue(bean: borrowedBookInstance, field: "borrower")}</td>
						
							<td>${fieldValue(bean: borrowedBookInstance, field: "book")}</td>
						
							<td hidden="hide" >${fieldValue(bean: borrowedBookInstance, field: "borrowStatus")}</td>
						
							<td><g:formatDate date="${borrowedBookInstance.dateBack}" /></td>
						
							<td><g:formatDate date="${borrowedBookInstance.dateCreated}" /></td>
							<td>
			<g:form url="[resource:borrowedBookInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-primary delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>							
							</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
				<div class="pagination">
					<g:paginate total="${lendedBookInstanceCount ?: 0}" params="['lendOrBorrow':'lend']"/>
				</div>
		</div>
	</g:if>		
	</body>
</html>
