

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-profile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-profile" class="well content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list profile" style ="list-style-type : none;">
			
				<g:if test="${profileInstance?.bAvatar}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="bAvatar-label" class="property-label"><g:message code="profile.bAvatar.label" default="B Avatar" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="bAvatar-label"><g:fieldValue bean="${profileInstance}" field="bAvatar"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.mAvatar}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="mAvatar-label" class="property-label"><g:message code="profile.mAvatar.label" default="M Avatar" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="mAvatar-label"><g:fieldValue bean="${profileInstance}" field="mAvatar"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.sAvatar}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="sAvatar-label" class="property-label"><g:message code="profile.sAvatar.label" default="S Avatar" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="sAvatar-label"><g:fieldValue bean="${profileInstance}" field="sAvatar"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.realname}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="realname-label" class="property-label"><g:message code="profile.realname.label" default="Realname" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="realname-label"><g:fieldValue bean="${profileInstance}" field="realname"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.gpsLongitude}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="gpsLongitude-label" class="property-label"><g:message code="profile.gpsLongitude.label" default="Gps Longitude" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="gpsLongitude-label"><g:fieldValue bean="${profileInstance}" field="gpsLongitude"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.gpsLatitude}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="gpsLatitude-label" class="property-label"><g:message code="profile.gpsLatitude.label" default="Gps Latitude" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="gpsLatitude-label"><g:fieldValue bean="${profileInstance}" field="gpsLatitude"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.province}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="province-label" class="property-label"><g:message code="profile.province.label" default="Province" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="province-label"><g:fieldValue bean="${profileInstance}" field="province"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.city}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="city-label" class="property-label"><g:message code="profile.city.label" default="City" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${profileInstance}" field="city"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.dist}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="dist-label" class="property-label"><g:message code="profile.dist.label" default="Dist" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="dist-label"><g:fieldValue bean="${profileInstance}" field="dist"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.community}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="community-label" class="property-label"><g:message code="profile.community.label" default="Community" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="community-label"><g:fieldValue bean="${profileInstance}" field="community"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.suite}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="suite-label" class="property-label"><g:message code="profile.suite.label" default="Suite" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="suite-label"><g:fieldValue bean="${profileInstance}" field="suite"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.weibo}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="weibo-label" class="property-label"><g:message code="profile.weibo.label" default="Weibo" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="weibo-label"><g:fieldValue bean="${profileInstance}" field="weibo"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.qq}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="qq-label" class="property-label"><g:message code="profile.qq.label" default="Qq" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="qq-label"><g:fieldValue bean="${profileInstance}" field="qq"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.weixin}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="weixin-label" class="property-label"><g:message code="profile.weixin.label" default="Weixin" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="weixin-label"><g:fieldValue bean="${profileInstance}" field="weixin"/></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
				<g:if test="${profileInstance?.user}">
				<li class="fieldcontain">
					<dl class="dl-horizontal">
						<dt><span id="user-label" class="property-label"><g:message code="profile.user.label" default="User" /></span></dt>
						<dd>
						
							<span class="property-value" aria-labelledby="user-label"><g:link controller="shiroUser" action="show" id="${profileInstance?.user?.id}">${profileInstance?.user?.encodeAsHTML()}</g:link></span>
						
						</dd>
					</dl>
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:profileInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="col-sm-offset-2 btn btn-primary edit" action="edit" resource="${profileInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-default delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
