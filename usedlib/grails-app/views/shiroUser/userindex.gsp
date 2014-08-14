

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shiroUser.label', default: 'ShiroUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
<!-- welcome -->		
		<div class="well">
		<h3>欢迎来到二手书市场</h3>
			<p>在这里，你可以与书友交换你的图书。</p>
		</div>			
<!-- for new message -->		
		<div class="well">
			<h1>最新消息</h1>
		</div>		
<!-- for friends -->		
		<div class="well">
			<div class="table">
			<h1><g:message code="default.list.label" args="[entityName]" />好友列表</h1>
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
			</div>		
			<g:link class="list" controller="friends" action="index">更多。。。。。</g:link>						
		</div>		
<!-- for borrowed book -->		
		<div class="well">
			<div class="table">
			<h1>借入图书</h1>
				<table class="table table-striped">
				<thead>
						<tr>
						
							<th><g:message code="borrowedBook.owner.label" default="Owner" /></th>
						
							<th><g:message code="borrowedBook.borrower.label" default="Borrower" /></th>
						
							<th><g:message code="borrowedBook.book.label" default="Book" /></th>
						
							<g:sortableColumn property="borrowStatus" title="${message(code: 'borrowedBook.borrowStatus.label', default: 'Borrow Status')}" />
						
							<g:sortableColumn property="dateBack" title="${message(code: 'borrowedBook.dateBack.label', default: 'Date Back')}" />
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'borrowedBook.dateCreated.label', default: 'Date Created')}" />
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${borrowedBookInstanceList}" status="i" var="borrowedBookInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${borrowedBookInstance.id}">${fieldValue(bean: borrowedBookInstance, field: "owner")}</g:link></td>
						
							<td>${fieldValue(bean: borrowedBookInstance, field: "borrower")}</td>
						
							<td>${fieldValue(bean: borrowedBookInstance, field: "book")}</td>
						
							<td>${fieldValue(bean: borrowedBookInstance, field: "borrowStatus")}</td>
						
							<td><g:formatDate date="${borrowedBookInstance.dateBack}" /></td>
						
							<td><g:formatDate date="${borrowedBookInstance.dateCreated}" /></td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
			<g:link class="list" controller="borrowedBook" action="index">更多。。。。。</g:link>						
		</div>		
<!-- for lended book -->		
		<div class="well">
			<div class="table">
			<h1>借出图书</h1>
				<table class="table table-striped">
				<thead>
						<tr>
						
							<th><g:message code="borrowedBook.owner.label" default="Owner" /></th>
						
							<th><g:message code="borrowedBook.borrower.label" default="Borrower" /></th>
						
							<th><g:message code="borrowedBook.book.label" default="Book" /></th>
						
							<g:sortableColumn property="borrowStatus" title="${message(code: 'borrowedBook.borrowStatus.label', default: 'Borrow Status')}" />
						
							<g:sortableColumn property="dateBack" title="${message(code: 'borrowedBook.dateBack.label', default: 'Date Back')}" />
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'borrowedBook.dateCreated.label', default: 'Date Created')}" />
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${lendedBookInstanceList}" status="i" var="lendedBookInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${lendedBookInstance.id}">${fieldValue(bean: lendedBookInstance, field: "owner")}</g:link></td>
						
							<td>${fieldValue(bean: lendedBookInstance, field: "borrower")}</td>
						
							<td>${fieldValue(bean: bolendedrrowedBookInstance, field: "book")}</td>
						
							<td>${fieldValue(bean: lendedBookInstance, field: "borrowStatus")}</td>
						
							<td><g:formatDate date="${lendedBookInstance.dateBack}" /></td>
						
							<td><g:formatDate date="${lendedBookInstance.dateCreated}" /></td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
			<g:link class="list" controller="borrowedBook" action="index">更多。。。。。</g:link>						
		</div>
<!-- for owend book -->		
		<div class="well">
			<div class="table">
			<h1>我的图书</h1>
				<table class="table table-striped">
				<thead>
						<tr>
						
							<th><g:message code="ownedBook.book.label" default="Book" /></th>
						
							<th><g:message code="ownedBook.user.label" default="User" /></th>
						
							<g:sortableColumn property="dateCreated" title="${message(code: 'ownedBook.dateCreated.label', default: 'Date Created')}" />
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${ownedBookInstanceList}" status="i" var="ownedBookInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${ownedBookInstance.id}">${fieldValue(bean: ownedBookInstance, field: "book")}</g:link></td>
						
							<td>${fieldValue(bean: ownedBookInstance, field: "user")}</td>
						
							<td><g:formatDate date="${ownedBookInstance.dateCreated}" /></td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
			<g:link class="list" controller="ownedBook" action="index">更多。。。。。</g:link>		
		</div>		
	</body>
</html>
