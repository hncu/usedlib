

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ownedBook.label', default: 'OwnedBook')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ownedBook" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ownedBook" class="well content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ownedBook" style ="list-style-type : none;">
			
				<g:if test="${ownedBookInstance?.book}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="book-label" class="property-label"><g:message code="ownedBook.book.label" default="Book" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="book-label"><g:link controller="book" action="show" id="${ownedBookInstance?.book?.id}">${ownedBookInstance?.book?.encodeAsHTML()}</g:link></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${ownedBookInstance?.user}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="user-label" class="property-label"><g:message code="ownedBook.user.label" default="User" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="user-label"><g:link controller="shiroUser" action="show" id="${ownedBookInstance?.user?.id}">${ownedBookInstance?.user?.encodeAsHTML()}</g:link></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${ownedBookInstance?.dateCreated}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="dateCreated-label" class="property-label"><g:message code="ownedBook.dateCreated.label" default="Date Created" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${ownedBookInstance?.dateCreated}" /></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:ownedBookInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="col-sm-offset-2 btn btn-primary edit" action="edit" resource="${ownedBookInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-default delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
