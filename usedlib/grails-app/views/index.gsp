<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main_index"/>
		<title>晒书派 | 与书友分享你的书籍</title>

	</head>
	<body>
		<!-- <a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a> -->
		<div class="well .jumbotron">
			<div align="center">		  
	        	<h1> 与书友分享你的书籍</h1><br>	         
	       		<p>还没有账号?现在加入 <a href="/usedlib/signup/index" class="btn btn-primary btn-large">立即注册</a></p>
	        </div>
			<hr>
			<div class="row">
				<div class="col-md-7">
		<!-- Carousel
	    ================================================== -->
	    <div id="myCarousel" class="carousel slide" data-ride="carousel">
	      <!-- Indicators -->
	      <ol class="carousel-indicators">
	        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	        <li data-target="#myCarousel" data-slide-to="1"></li>
	        <li data-target="#myCarousel" data-slide-to="2"></li>
	      </ol>
	      <div class="carousel-inner">
	        <div class="item active">
	          <img data-src="holder.js/900x500/auto/#777:#7a7a7a/text:First slide" src="/usedlib/images/lib1.jpg" alt="First slide">
	          <div class="container">
	            <div class="carousel-caption">
	              <h1>Example headline.</h1>
	              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
	              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
	            </div>
	          </div>
	        </div>
	        <div class="item">
	          <img data-src="holder.js/900x500/auto/#666:#6a6a6a/text:Second slide" src="/usedlib/images/lib2.jpg" alt="Second slide">
	          <div class="container">
	            <div class="carousel-caption">
	              <h1>Another example headline.</h1>
	              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
	              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
	            </div>
	          </div>
	        </div>
	        <div class="item">
	          <img data-src="holder.js/900x500/auto/#555:#5a5a5a/text:Third slide" src="/usedlib/images/lib1.jpg" alt="Third slide">
	          <div class="container">
	            <div class="carousel-caption">
	              <h1>One more for good measure.</h1>
	              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
	              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
	            </div>
	          </div>
	        </div>
	      </div>
	      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
	      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
	    </div><!-- /.carousel -->
				</div>
				<div class="col-md-4">
<!-- ==========for login ============ -->
				<div class="well jumbotron">
					<shiro:isNotLoggedIn>
						<form class="form-signin" action="/usedlib/auth/signIn" id="myform" method="POST">
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
					</shiro:isNotLoggedIn>
					<shiro:isLoggedIn>
						<h4>欢迎你，${session.ShiroUser}！</h4>
					</shiro:isLoggedIn>

				</div>

			</div>
			</div>
			
		</div>

		
<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
</div>
	</body>
</html>
