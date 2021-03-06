<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Register</title>
<meta name="layout" content="main_index" />
</head>

<body>
	<div class="container">
		<div class="col-md-6"></div>
		<div class="col-md-4 well">	
		    <h1>注册</h1>
		    <g:if test="${flash.message}">
		        <div class="alert alert-info">${flash.message}</div>
		    </g:if>
		    <g:hasErrors bean="${user}">
		        <div class="alert alert-error"><g:renderErrors bean="${user}" as="list" /></div>
		    </g:hasErrors>
		
		    <g:form action="register">
		        <fieldset class="form"><g:render template="register"/></fieldset>
		        
		        <fieldset class="buttons">
		            <g:submitButton name="submit" value="Submit"/>
		        </fieldset>
		    </g:form>
		  </div>
	</div>
</body>
</html>