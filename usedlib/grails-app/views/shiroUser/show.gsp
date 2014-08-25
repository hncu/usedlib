

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'shiroUser.label', default: 'ShiroUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<script type="text/javascript" src="/usedlib/js/douban_api.js"></script><!-- -->
		
	</head>
	<body>
		<div id="show-shiroUser" class="well content scaffold-show" role="main">
			<!--<h1><g:message code="default.show.label" args="[entityName]" /></h1>-->
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<div class="col-md-2">
				<img class="img-rounded" style="width:100px;height:100px"src="${resource(dir: 'images/avatar', file: "${shiroUserInstance.profile.bAvatar}")}" alt="sidebar"/>  
			</div>
			<div class="col-md-8">
				<p><g:link action="show" id="${shiroUserInstance.id}">${fieldValue(bean: shiroUserInstance, field: "username")}</g:link></p>
				<p>	<span class="label label-default">LV${fieldValue(bean: shiroUserInstance, field: "level")}</span>
					<span>最后登录:<g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${shiroUserInstance.lastLoginDay}"/></span></p>
				<p>	<span class="label label-default">拥有图书:${fieldValue(bean: shiroUserInstance, field: "numOwnedBook")};</span>
					<span class="label label-default">借阅图书:${fieldValue(bean: shiroUserInstance, field: "numBorrowedBook")};</span>
					<span class="label label-default">外借图书:${fieldValue(bean: shiroUserInstance, field: "numLendedBook")};</span>
					<span class="label label-default">读书:${fieldValue(bean: shiroUserInstance, field: "numReadedBook")};</span></p>
				<span></span>
			</div>
			<div class="col-md-2">
				<h3></h3>
				<g:form class="form-horizontal" url="[controller:'friends', action:'save']" >
					<g:hiddenField name= "friend.id" value =" ${shiroUserInstance.id} " />				
					<g:hiddenField name= "user.id" value =" ${session.ShiroUser?.id} " />
					<fieldset class="buttons">
						<g:submitButton name="create" class="btn btn-primary save" value="加为好友" />
					</fieldset>
				</g:form>
			</div>
			<div style="clear: both"></div>
				
			<ol class="property-list shiroUser" style ="list-style-type : none;">
			
				<g:if test="${shiroUserInstance?.own}">
				<li class="fieldcontain">
						<label>拥有的图书http://localhost:8080/usedlib/ownedBook...</label><span id="own-label" class="property-label"><g:message code="shiroUser.own.label" default="Own" /></span>
						<g:each in="${shiroUserInstance.own}" var="o">
							<li class="thumbnail col-md-2" style="height:220px;margin: 10px 7px 5px 7px;">
								<div id=${o.book?.isbn13}.img>${o.book?.isbn13}</div>
								<div class="col-md-offset-1" id=${o.book?.isbn13}.title><g:link class="" controller="book" action="show" id="${o.book?.id}">${fieldValue(bean: o.book, field: "title")}</g:link></div>
							</li>
<script type="text/javascript">
DOUBAN.apikey = 
	DOUBAN.getISBNBook({
	    isbn:${o.book?.isbn13},
	    callback:function(re){
	        //alert(re.title);
	        var TitleEle=document.getElementById(re.isbn13+'.title').childNodes;
	        var	Title=TitleEle[0].innerHTML;
	        var len=Title.length;
	        if(len>15){
	        	var bookTitle = Title.slice(0, 15);
	        	TitleEle[0].innerHTML=bookTitle+"..."
	        	//document.getElementById(re.isbn13+'.title').innerHTML="<font size='1' >"+bookTitle+"</font>"
		        }
	        //else{
	       //document.getElementById(re.isbn13+'.title').innerHTML=bookTitle;
		        //}
	       document.getElementById(re.isbn13+'.img').innerHTML="<img style=\"margin:0px 0px 0px 9px;width:120px;height:160px; \" src="+re.images.medium+">";
	       //document.getElementById(re.isbn13+'.title.dialog').innerHTML=Title;
	       //document.getElementById(re.isbn13+'.img.dialog').innerHTML="<img style=\"height:160px; width:120px;\" src="+re.images.medium+">";
	       //document.getElementById(re.isbn13+'.author.dialog').innerHTML='作者：'+re.author;
	       //document.getElementById(re.isbn13+'.publisher.dialog').innerHTML='出版社：'+re.publisher;
	       //document.getElementById(re.isbn13+'.pubdate.dialog').innerHTML='出版时间：'+re.pubdate;
	       //document.getElementById(re.isbn13+'.summary').innerHTML=re.summary;
	    }
	})
</script>				
							</g:each>
						
				</li>
				</g:if>
			<div style="clear: both"></div>
			<br/>
			
				<g:if test="${shiroUserInstance?.borrowedBookOwner}">
				<li class="fieldcontain">
						<label>借入的图书</label><span id="borrowedBookOwner-label" class="property-label"><g:message code="shiroUser.borrowedBookOwner.label" default="Borrowed Book Owner" /></span><br/>
						<g:each in="${shiroUserInstance.borrowedBookOwner}" var="b">
							<span class="property-value" aria-labelledby="borrowedBookOwner-label"><g:link controller="borrowedBook" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
							<br/>
						</g:each>
				</li>
				</g:if>
		
				<g:if test="${shiroUserInstance?.email}">
				<li class="fieldcontain">
						<span id="email-label" class="property-label"><g:message code="shiroUser.email.label" default="Email" /></span>
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${shiroUserInstance}" field="email"/></span>
						
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.profile}">
				<li class="fieldcontain">
						<h3>用户详情</h3><span id="profile-label" class="property-label"><g:message code="shiroUser.profile.label" default="Profile" /></span>
						<span class="property-value" aria-labelledby="profile-label"><g:link controller="profile" action="show" id="${shiroUserInstance?.profile?.id}">${shiroUserInstance?.profile?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.huoyuedu}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="huoyuedu-label" class="property-label"><g:message code="shiroUser.huoyuedu.label" default="Huoyuedu" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="huoyuedu-label"><g:fieldValue bean="${shiroUserInstance}" field="huoyuedu"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.loginCount}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="loginCount-label" class="property-label"><g:message code="shiroUser.loginCount.label" default="Login Count" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="loginCount-label"><g:fieldValue bean="${shiroUserInstance}" field="loginCount"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.deleted}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="deleted-label" class="property-label"><g:message code="shiroUser.deleted.label" default="Deleted" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="deleted-label"><g:fieldValue bean="${shiroUserInstance}" field="deleted"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.friends}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="friends-label" class="property-label"><g:message code="shiroUser.friends.label" default="Friends" /></span></dt>
						<dd>
						
							<g:each in="${shiroUserInstance.friends}" var="f">
							<span class="property-value" aria-labelledby="friends-label"><g:link controller="friends" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
							</g:each>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.permissions}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="permissions-label" class="property-label"><g:message code="shiroUser.permissions.label" default="Permissions" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="permissions-label"><g:fieldValue bean="${shiroUserInstance}" field="permissions"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.readStatuses}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="readStatuses-label" class="property-label"><g:message code="shiroUser.readStatuses.label" default="Read Statuses" /></span></dt>
						<dd>
						
							<g:each in="${shiroUserInstance.readStatuses}" var="r">
							<span class="property-value" aria-labelledby="readStatuses-label"><g:link controller="readStatus" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
							</g:each>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${shiroUserInstance?.sendMessages}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="sendMessages-label" class="property-label"><g:message code="shiroUser.sendMessages.label" default="Send Messages" /></span></dt>
						<dd>
						
							<g:each in="${shiroUserInstance.sendMessages}" var="s">
							<span class="property-value" aria-labelledby="sendMessages-label"><g:link controller="messages" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
							</g:each>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:shiroUserInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="col-sm-offset-2 btn btn-primary edit" action="edit" resource="${shiroUserInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-default delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
