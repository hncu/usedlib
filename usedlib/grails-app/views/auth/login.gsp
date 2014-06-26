<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main_index" />
  <title>Login</title>
</head>
<body>
  
<div class="well jumbotron col-md-4">
	<form class="form-signin" action="/usedlib/auth/signIn" id="myform" method="POST">
	    <input type="hidden" name="targetUri" value="${targetUri}" />						
		<h4>用户登录</h4>
		<g:if test="${flash.message}">
			<div class="message" style="color: red">
				${flash.message}
			</div>
		</g:if>
		<div class="all-errors"></div>
		<div class="input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
			<input class="form-control" id="username" type="text" value="${username}"
				placeholder="邮件/手机" name="username" maxlength="75" />
			<div class="email_suggestion"></div>
		</div>
		<br/>
		<div class="input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-italic"></i></span> 
			<input class="form-control" type="password" placeholder="密码" name="password" id="password"/>
		</div>
		<div class="action">
			<label class="checkbox">记住我
				<g:checkBox name="rememberMe" value="${rememberMe}" />
			</label> 
			<input type="hidden" name="dosubmit" value="1" /> 
			<input type="submit" value="登录" class="btn btn-primary" /> 
			<span style="margin-left: 15px"><a class="btn btn-default" href="#"><small>找回密码</small></a></span>
		</div>
	</form>

</div>
</body>
</html>
