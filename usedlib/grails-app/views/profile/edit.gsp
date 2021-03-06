
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=A4a5e6488f8d2ef0c3cbd0da34972bc7"></script>
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>

	
<!-- 		<a href="#edit-profile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> -->
		<div id="edit-profile" class="well content scaffold-edit" role="main">
			<!--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>-->
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${profileInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${profileInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

				<!-- sidebar -->
<div class="tabbable">  
    <ul class="col-md-2 well nav nav-pills nav-stacked">
    		<g:if test="${(params.profileContent=='avatar')||(params.profileContent==null)}"><li class="active"></g:if>
    		<g:else><li></g:else><a href="#base" data-toggle="tab">基本资料</a></li>
    		
	      	<g:if test="${params.profileContent=='avatar'}"><li class="active"></g:if>
    		<g:else><li></g:else> <a href="#avatar" data-toggle="tab">我的头像</a></li>
    		
	        <li class=""><a href="#map" data-toggle="tab">我的地图</a></li>
	        
	        <li><a href="#3" data-toggle="tab">详细资料</a></li>
    </ul>  
    <div class="tab-content">  
        <g:if test="${(params.profileContent=='avatar')||(params.profileContent==null)}"><div class="tab-pane active" id="base"></g:if>
        <g:else><div class="tab-pane" id="base"></g:else>
        <g:form class="form-horizontal" url="[resource:profileInstance, action:'update']" method="PUT" >
        	<input type="hidden" name="profileContent" value="base" />       
			<g:hiddenField name="version" value="${profileInstance?.version}" />
			<div class="form-group fieldcontain ${hasErrors(bean: profileInstance, field: 'realname', 'error')} ">
				<label class="col-sm-2 control-label" for="realname">
					<g:message class="col-sm-3" code="profile.realname.label" default="Realname" />
					
				</label>
				<g:textField name="realname" value="${profileInstance?.realname}"/>
			
			</div>
				<fieldset class="buttons">
					<g:actionSubmit class="col-sm-offset-2 btn btn-primary save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
		</g:form>
        </div>  
        <div id="avatar" class="tab-pane">  
        	<h2>我的头像</h2>
			<g:uploadForm url="[resource:profileInstance, action:'update']"  method="post" >
				<input type="hidden" name="profileContent" value="avatar" />
				<g:hiddenField name="version" value="${profileInstance?.version}" />
				<img src="${createLinkTo(dir:'images/avatar/',file:Profile.findById(session.ShiroUser?.id).bAvatar)}">
				<input type="file" id="payload" name="payload"/>
				<g:actionSubmit class="col-sm-offset-2 btn btn-primary save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</g:uploadForm>
        </div>
        
		<div id="map" class="tab-pane">
	        <g:form class="form-horizontal" url="[resource:profileInstance, action:'update']" method="PUT" >
				<input type="hidden" name="profileContent" value="gps" />
				<g:hiddenField type="hidden" name="gpsLongitude" value="${profileInstance?.gpsLongitude}"/>
				<g:hiddenField type="hidden" name="gpsLatitude" value="${profileInstance?.gpsLatitude}"/>
				<div id="allmap" style="width:500px;height:400px;overflow: hidden;margin:0"></div>
				<script type="text/javascript" src="/usedlib/js/baidumap.js"></script>
				<fieldset class="buttons">
					<g:actionSubmit class="col-sm-offset-2 btn btn-primary save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>			
		</div>

    </div>

</div>

<!-- sidebar 
				
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>-->

		</div>
	</body>
</html>
