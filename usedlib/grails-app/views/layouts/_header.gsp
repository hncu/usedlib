
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar">saf</span>
				<span class="icon-bar">asdf</span>
				<span class="icon-bar">asdf</span>
			</button><!-- delete this button?todo -->
			<a class="navbar-brand" href="/usedlib/">图书管家</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/usedlib/">主页</a></li>
				<li><a href="">本地图书</a></li>
				<li><a href="">朋友圈</a></li>
				<li><a href="#about">关于</a></li>
				<li><a href="#contact">联系我们</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<shiro:isLoggedIn>
					<ul  class="nav navbar-nav">
						<li><a class=""  href="/usedlib/messages/index"><i class="glyphicon glyphicon-envelope"></i> 站内信</a></li>
						<li><a href="/usedlib/auth/signOut"><i class="glyphicon glyphicon-off">退出</i></a></li>
					</ul>
				</shiro:isLoggedIn>				
				<shiro:isNotLoggedIn>
						<li><a href="/usedlib/signup">注册</a></li>
						<li class="dropdown ">
							<a class="dropdown-toggle" href="/usedlib/auth/login" data-toggle="dropdown">登录<b class="caret"></b></a>
							<div class="dropdown-menu" style="padding: 15px; padding-bottom: 0px;width:80%;">
								<form action="/usedlib/auth/signIn" class="" id="myform" method="POST">
										<input  style="margin-bottom: 15px;" class="form-control" id="username" type="text" value="" placeholder="邮件/手机" name="username" maxlength="75">
										<input  style="margin-bottom: 15px;" class="form-control" type="password" placeholder="密码" name="password" id="password">
										<label class="checkbox">记住我
											<input type="hidden" name="_rememberMe"><input type="checkbox" name="rememberMe" id="rememberMe">
										</label>
										<input type="hidden" name="dosubmit" value="1"> 
										<input type="submit" value="登录" class="btn btn-primary btn-block">
								</form>
								<span style="height: 10px; width: 20px; display: block"></span>
							</div></li>
				</shiro:isNotLoggedIn>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</div>
