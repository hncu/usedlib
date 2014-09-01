

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<script type="text/javascript" src="/usedlib/js/douban_api.js"></script><!-- -->		
	</head>
	<body>
		<div id="show-book" class="well content scaffold-show" role="main">
			<!--<h1><g:message code="default.show.label" args="[entityName]" /></h1>-->
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<H3 class="" id=${bookInstance.isbn13}.title>${bookInstance}</H3>
			<div class="col-md-2" id=${bookInstance.isbn13}.img>${bookInstance.isbn13}</div>
			<div class="col-md-5" id=${bookInstance.isbn13}.detail>
				<span id="${bookInstance.isbn13}.author"></span><br>
				<span id="${bookInstance.isbn13}.publisher"></span><br>
				<span id="${bookInstance.isbn13}.pubdate"></span><br>
				<span id="${bookInstance.isbn13}.pages"></span><br>
				<span id="${bookInstance.isbn13}.price"></span><br>
				<span>ISBN: ${bookInstance.isbn13}</span>
			</div>
			<div class="col-md-5" id=${bookInstance.isbn13}.detail2></div>
			<div style="clear: both"></div> 
			
			
<script type="text/javascript">
DOUBAN.apikey = 
	DOUBAN.getISBNBook({
	    isbn:${bookInstance.isbn13},
	    callback:function(re){
	        //alert(re.title);
	       document.getElementById(re.isbn13+'.title').innerHTML=re.title;
	       document.getElementById(re.isbn13+'.img').innerHTML="<img style=\"margin:0px 0px 0px 0px;width:120px;height:160px; \" src="+re.images.medium+">";
	       
	       document.getElementById(re.isbn13+'.author').innerHTML="作者: "+re.author;
	       document.getElementById(re.isbn13+'.publisher').innerHTML="出版社: "+re.publisher;
	       document.getElementById(re.isbn13+'.pubdate').innerHTML="出版年: "+re.pubdate;
	       document.getElementById(re.isbn13+'.pages').innerHTML="页数: "+re.pages;
	       document.getElementById(re.isbn13+'.price').innerHTML="价格: "+re.price;
	       //document.getElementById(re.isbn13+'.summary').innerHTML=re.summary;
	    }
	})
</script>				
			<ol class="property-list book" style ="list-style-type : none;">
			
<!-- 				<g:if test="${bookInstance?.title}">
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
 -->			
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
		<shiro:hasRole name="ROLE_ADMIN">
 			<g:form url="[resource:bookInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="col-sm-offset-2 btn btn-primary edit" action="edit" resource="${bookInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-default delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form> 
		</shiro:hasRole>
		
			<g:form class="form-horizontal" url="[controller:'ownedBook',action:'save']" >
				<g:hiddenField name= "book.id" value =" ${bookInstance.id}"  />
                <g:hiddenField name= "user.id" value =" ${session.ShiroUser?.id} " />                		
				<fieldset class="buttons">
					<g:submitButton name="create" class="col-sm-offset-2 btn btn-primary save" value="将此书添加到我的书库" />
				</fieldset>
			</g:form>
			
<!-- borrowedbook -->
      <div id="list-ownedBook" class="content scaffold-list" role="main">
			<h3>拥有此书的书友</h3>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
<!-- 			<div class="table">
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
                <g:hiddenField name= "borrower.id" value =" ${session.ShiroUser?.id} " />   							
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
	 -->		
			<div class="well">
				<ul style="list-style-type :none;padding:0px;">
				<li style="border-bottom:1px  #CCCCCC solid;padding:0px;">
					<label class="control-label"><strong><small>排序：</small></strong></label>
					<g:sortableColumn property="username" title="${message(code: 'shiroUser.username.label', default: 'Username')}" />
					<g:sortableColumn property="lastLoginDay" title="${message(code: 'shiroUser.username.lastLoginDay', default: 'lastLoginDay')}" />
				</li>
				<g:each in="${bookOwnerList}" status="i" var="bookOwnerInstance">
					<li style="border-bottom:1px  #CCCCCC solid;padding:0px;">
						<div class="col-md-2">
							<img class="img-rounded" style="width:100px;height:100px"src="${resource(dir: 'images/avatar', file: "${bookOwnerInstance.profile.bAvatar}")}" alt="sidebar"/>  
						</div>
						<div class="col-md-8">
							<p><g:link controller="shiroUser" action="show" id="${bookOwnerInstance.id}">${fieldValue(bean: bookOwnerInstance, field: "username")}</g:link></p>
							<p>	<span class="label label-default">LV${fieldValue(bean: bookOwnerInstance, field: "level")}</span>
								<span>最后登录:<g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${bookOwnerInstance.lastLoginDay}"/></span></p>
							<p>	<span class="label label-default">拥有图书:${fieldValue(bean: bookOwnerInstance, field: "numOwnedBook")};</span>
								<span class="label label-default">借阅图书:${fieldValue(bean: bookOwnerInstance, field: "numBorrowedBook")};</span>
								<span class="label label-default">外借图书:${fieldValue(bean: bookOwnerInstance, field: "numLendedBook")};</span>
								<span class="label label-default">读书:${fieldValue(bean: bookOwnerInstance, field: "numReadedBook")};</span></p>
							<span></span>
						</div>
						<div class="col-md-2">
			<g:form class="form-horizontal" url="[controller:'borrowedBook',action:'save']" >
				<g:hiddenField name= "book.id" value =" ${bookInstance.id}"  />
                <g:hiddenField name= "borrower.id" value =" ${session.ShiroUser?.id} " />   							
				<g:hiddenField name= "owner.id" value ="${bookOwnerInstance.id}"/>
				<h3></h3>  
				<fieldset class="buttons">
					<g:submitButton name="create" class="col-sm-offset-2 btn btn-primary save" value="借阅此书" />
				</fieldset>
			</g:form>

						</div>
						<div style="clear: both"></div>
					<P></P>
					</li>
				</g:each>
				</ul>
			</div>			
				<div class="pagination">
					<g:paginate total="${bookOwnerListInstanceCount ?: 0}" id="${bookInstance.id}"/>
				</div>
		</div>
   
			
		</div>
	</body>
</html>
