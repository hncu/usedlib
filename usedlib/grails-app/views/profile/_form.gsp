



<div class="form-group fieldcontain ${hasErrors(bean: profileInstance, field: 'bAvatar', 'error')} ">
	<label class="col-sm-2 control-label" for="bAvatar">
		<g:message class="col-sm-3" code="profile.bAvatar.label" default="B Avatar" />
		
	</label>
	<g:textField name="bAvatar" value="${profileInstance?.bAvatar}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: profileInstance, field: 'mAvatar', 'error')} ">
	<label class="col-sm-2 control-label" for="mAvatar">
		<g:message class="col-sm-3" code="profile.mAvatar.label" default="M Avatar" />
		
	</label>
	<g:textField name="mAvatar" value="${profileInstance?.mAvatar}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: profileInstance, field: 'sAvatar', 'error')} ">
	<label class="col-sm-2 control-label" for="sAvatar">
		<g:message class="col-sm-3" code="profile.sAvatar.label" default="S Avatar" />
		
	</label>
	<g:textField name="sAvatar" value="${profileInstance?.sAvatar}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: profileInstance, field: 'realname', 'error')} ">
	<label class="col-sm-2 control-label" for="realname">
		<g:message class="col-sm-3" code="profile.realname.label" default="Realname" />
		
	</label>
	<g:textField name="realname" value="${profileInstance?.realname}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: profileInstance, field: 'gpsLongitude', 'error')} ">
	<label class="col-sm-2 control-label" for="gpsLongitude">
		<g:message class="col-sm-3" code="profile.gpsLongitude.label" default="Gps Longitude" />
		
	</label>
	<g:textField name="gpsLongitude" value="${profileInstance?.gpsLongitude}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: profileInstance, field: 'gpsLatitude', 'error')} ">
	<label class="col-sm-2 control-label" for="gpsLatitude">
		<g:message class="col-sm-3" code="profile.gpsLatitude.label" default="Gps Latitude" />
		
	</label>
	<g:textField name="gpsLatitude" value="${profileInstance?.gpsLatitude}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: profileInstance, field: 'province', 'error')} ">
	<label class="col-sm-2 control-label" for="province">
		<g:message class="col-sm-3" code="profile.province.label" default="Province" />
		
	</label>
	<g:textField name="province" value="${profileInstance?.province}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: profileInstance, field: 'city', 'error')} ">
	<label class="col-sm-2 control-label" for="city">
		<g:message class="col-sm-3" code="profile.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${profileInstance?.city}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: profileInstance, field: 'dist', 'error')} ">
	<label class="col-sm-2 control-label" for="dist">
		<g:message class="col-sm-3" code="profile.dist.label" default="Dist" />
		
	</label>
	<g:textField name="dist" value="${profileInstance?.dist}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: profileInstance, field: 'community', 'error')} ">
	<label class="col-sm-2 control-label" for="community">
		<g:message class="col-sm-3" code="profile.community.label" default="Community" />
		
	</label>
	<g:textField name="community" value="${profileInstance?.community}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: profileInstance, field: 'suite', 'error')} ">
	<label class="col-sm-2 control-label" for="suite">
		<g:message class="col-sm-3" code="profile.suite.label" default="Suite" />
		
	</label>
	<g:textField name="suite" value="${profileInstance?.suite}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: profileInstance, field: 'weibo', 'error')} ">
	<label class="col-sm-2 control-label" for="weibo">
		<g:message class="col-sm-3" code="profile.weibo.label" default="Weibo" />
		
	</label>
	<g:textField name="weibo" value="${profileInstance?.weibo}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: profileInstance, field: 'qq', 'error')} ">
	<label class="col-sm-2 control-label" for="qq">
		<g:message class="col-sm-3" code="profile.qq.label" default="Qq" />
		
	</label>
	<g:textField name="qq" value="${profileInstance?.qq}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: profileInstance, field: 'weixin', 'error')} ">
	<label class="col-sm-2 control-label" for="weixin">
		<g:message class="col-sm-3" code="profile.weixin.label" default="Weixin" />
		
	</label>
	<g:textField name="weixin" value="${profileInstance?.weixin}"/>

</div>

<div class="form-group fieldcontain ${hasErrors(bean: profileInstance, field: 'user', 'error')} required">
	<label class="col-sm-2 control-label" for="user">
		<g:message class="col-sm-3" code="profile.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${ShiroUser.list()}" optionKey="id" required="" value="${profileInstance?.user?.id}" class="many-to-one"/>

</div>

