
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
				<g:if test="${params.controller=="shiroUser"&&params.action=="userindex"}"><li class="active"></g:if>
				<g:else><li></g:else>
					<a href="/usedlib/shiroUser/userindex">个人主页</a></li>
				<g:if test="${params.controller=="book"&&params.action=="index"}"><li class="active"></g:if>
				<g:else><li></g:else>
					<a href="/usedlib/book/index">附近图书</a></li>
				<g:if test="${params.controller=="shiroUser"&&params.action=="index"}"><li class="active"></g:if>
				<g:else><li></g:else>
					<a href="/usedlib/shiroUser/index">以书会友</a></li>
				<li><a href="#about">关于</a></li>
				<li><a href="#contact">联系我们</a></li>
			</ul>
			
			
			<ul class="nav navbar-nav navbar-right">
				<shiro:isLoggedIn>
					<li><a class=""  href="/usedlib/messages/index"><i class="glyphicon glyphicon-envelope"></i> 站内信<span class="badge">${Messages.countByReceiverAndStatue(session.ShiroUser,true)}</span></a></li>
					<li class="dropdown">
						<a href="" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i>  ${session.ShiroUser} <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
			                <li><a href="/usedlib/messages/index"><i class="glyphicon glyphicon-envelope"></i> 我的消息</a></li>
			                <li><a href="/usedlib/friends/index"><i class="glyphicon glyphicon-th-large"></i> 我的好友</a></li>
			                <li class="divider"></li>
			                <li><a href="/usedlib/ownedBook/index"><i class="glyphicon glyphicon-align-center"></i> 我的图书</a></li>
			                <li><g:link controller="borrowedBook" action="index" params="['lendOrBorrow':'borrow']"><i class="glyphicon glyphicon-indent-right"></i> 借入图书</g:link></li>
			                <li><g:link controller="borrowedBook" action="index" params="['lendOrBorrow':'lend']"><i class="glyphicon glyphicon-indent-left"></i> 借出图书</g:link></li>
			                <li class="divider"></li>
			                <li><a href="/usedlib/profile/edit/${session.ShiroUser.id}"><i class="glyphicon glyphicon-cog"></i> 修改个人资料</a></li>
			                <li><a href="/usedlib/auth/signOut"><i class="glyphicon glyphicon-off"></i> 退出</a></li>
			             </ul>
		             </li>
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
						</div>
					</li>
				</shiro:isNotLoggedIn>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</div>
