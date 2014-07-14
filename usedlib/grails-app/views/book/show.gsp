

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-book" class="well content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list book" style ="list-style-type : none;">
			
				<g:if test="${bookInstance?.title}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="title-label" class="property-label"><g:message code="book.title.label" default="Title" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${bookInstance}" field="title"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.isbn13}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="isbn13-label" class="property-label"><g:message code="book.isbn13.label" default="Isbn13" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="isbn13-label"><g:fieldValue bean="${bookInstance}" field="isbn13"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.author}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="author-label" class="property-label"><g:message code="book.author.label" default="Author" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="author-label"><g:fieldValue bean="${bookInstance}" field="author"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.publisher}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="publisher-label" class="property-label"><g:message code="book.publisher.label" default="Publisher" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="publisher-label"><g:fieldValue bean="${bookInstance}" field="publisher"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.pubdate}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="pubdate-label" class="property-label"><g:message code="book.pubdate.label" default="Pubdate" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="pubdate-label"><g:fieldValue bean="${bookInstance}" field="pubdate"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.summary}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="summary-label" class="property-label"><g:message code="book.summary.label" default="Summary" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="summary-label"><g:fieldValue bean="${bookInstance}" field="summary"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.imageUrl}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="imageUrl-label" class="property-label"><g:message code="book.imageUrl.label" default="Image Url" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="imageUrl-label"><g:fieldValue bean="${bookInstance}" field="imageUrl"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.tags}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="tags-label" class="property-label"><g:message code="book.tags.label" default="Tags" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="tags-label"><g:fieldValue bean="${bookInstance}" field="tags"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
			</ol>
 			<g:form url="[resource:bookInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="col-sm-offset-2 btn btn-primary edit" action="edit" resource="${bookInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-default delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form> 

			<g:form class="form-horizontal" url="[controller:'ownedBook',action:'save']" >
				<g:hiddenField name= "book.id" value =" ${bookInstance.id}"  />
                <g:hiddenField name= "user.id" value =" ${session.ShiroUser.id} " />                		
				<fieldset class="buttons">
					<g:submitButton name="create" class="col-sm-offset-2 btn btn-primary save" value="将此书添加到我的书库" />
				</fieldset>
			</g:form>
			
<!-- borrowedbook -->
      <div id="list-ownedBook" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table">
				<table class="table table-striped">
				<thead>
						<tr>						
							<th><g:message code="ownedBook.user.label" default="User" /></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${bookOwnerList}" status="i" var="bookOwnerInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td>${fieldValue(bean: bookOwnerInstance, field: "username")}</td>
							<td>
			<g:form class="form-horizontal" url="[controller:'borrowedBook',action:'save']" >
				<g:hiddenField name= "book.id" value =" ${bookInstance.id}"  />
                <g:hiddenField name= "borrower.id" value =" ${session.ShiroUser.id} " />   							
						<g:hiddenField name= "owner.id" value ="${bookOwnerInstance.id}"/>  
				<fieldset class="buttons">
					<g:submitButton name="create" class="col-sm-offset-2 btn btn-primary save" value="借阅此书" />
				</fieldset>
			</g:form>
							</td>						
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
				<div class="pagination">
					<g:paginate total="${bookOwnerListInstanceCount ?: 0}" />
				</div>
		</div>
   
			
		</div>
	</body>
</html>
