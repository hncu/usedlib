

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		 <script type="text/javascript" src="/usedlib/js/douban_api.js"></script><!-- -->
		
	</head>
	<body>
		<div id="list-book" class="content scaffold-list" role="main">
			<!-- <h1><g:message code="default.list.label" args="[entityName]" /></h1> -->
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="well">
				<ul class="row" style="list-style-type :none;">
					<g:each in="${bookInstanceList}" var="bookInstance">
						<li class="thumbnail col-md-2" style="height:220px;margin: 10px 7px 5px 7px;">
							<div id=${bookInstance.isbn13}.img>${bookInstance.isbn13}</div>
							<div class="col-md-offset-1" id=${bookInstance.isbn13}.title><g:link class="" action="show" id="${bookInstance.id}">${fieldValue(bean: bookInstance, field: "title")}</g:link></div>
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
<!-- 			<div class="table">
				<table class="table table-striped">
				<thead>
						<tr>
						
							<g:sortableColumn property="title" title="${message(code: 'book.title.label', default: 'Title')}" />
						
							<g:sortableColumn property="isbn13" title="${message(code: 'book.isbn13.label', default: 'Isbn13')}" />
						
							<g:sortableColumn property="author" title="${message(code: 'book.author.label', default: 'Author')}" />
						
							<g:sortableColumn property="publisher" title="${message(code: 'book.publisher.label', default: 'Publisher')}" />
						
							<g:sortableColumn property="pubdate" title="${message(code: 'book.pubdate.label', default: 'Pubdate')}" />
						
							<g:sortableColumn property="summary" title="${message(code: 'book.summary.label', default: 'Summary')}" />
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${bookInstanceList}" status="i" var="bookInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${bookInstance.id}">${fieldValue(bean: bookInstance, field: "title")}</g:link></td>
						
							<td>${fieldValue(bean: bookInstance, field: "isbn13")}</td>
						
							<td>${fieldValue(bean: bookInstance, field: "author")}</td>
						
							<td>${fieldValue(bean: bookInstance, field: "publisher")}</td>
						
							<td>${fieldValue(bean: bookInstance, field: "pubdate")}</td>
						
							<td>${fieldValue(bean: bookInstance, field: "summary")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>-->
				<div class="pagination">
					<g:paginate total="${bookInstanceCount ?: 0}" />
				</div>
		</div>
	</body>
</html>
