

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ownedBook.label', default: 'OwnedBook')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<script type="text/javascript" src="/usedlib/js/douban_api.js"></script><!-- -->		
	</head>
	<body>
		<div id="list-ownedBook" class="content scaffold-list" role="main">
			<!--<h1><g:message code="default.list.label" args="[entityName]" /></h1>-->
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<div class="well">
				<h2>${ShiroUser.get(params.userid)}的图书</h2>
				<ul class="row" style="list-style-type :none;">
					<g:each in="${ownedBookInstanceList}" var="ownedBookInstance">
						<p hidden="hidden">${bookInstance=ownedBookInstance.book}</p>
						<li class="thumbnail col-md-2" style="height:220px;margin: 10px 7px 5px 7px;">
							<div id=${bookInstance.isbn13}.img>${bookInstance.isbn13}</div>
							<div class="col-md-offset-1" id=${bookInstance.isbn13}.title><g:link class="" controller="book" action="show" id="${bookInstance.id}">${fieldValue(bean: bookInstance, field: "title")}</g:link></div>
						</li>
<script type="text/javascript">
DOUBAN.apikey = 
	DOUBAN.getISBNBook({
	    isbn:${bookInstance.isbn13},
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
				</ul>
			</div>			
<!--  		<div class="table">
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
			</div>-->
				<div class="pagination">
					<g:paginate total="${ownedBookInstanceCount ?: 0}" />
				</div>
		</div>
	</body>
</html>
