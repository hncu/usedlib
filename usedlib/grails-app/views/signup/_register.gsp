<%@ page import="ShiroUser" %>

<div class="input-group fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
    <g:textField class="form-control" name="username"  id="username" type="text" placeholder="邮件/手机" required="" value="${userInstance?.username}"/>
</div><br/>

<div class="input-group fieldcontain ${hasErrors(bean: userInstance, field: 'passwordHash', 'error')} required">
    <span class="input-group-addon" for="password"><i class="glyphicon glyphicon-italic"></i></span> 
    <g:passwordField  class="form-control" name="password" id="password" type="text" placeholder="密码" required="" value=""/>
</div><br/>

<div class="input-group fieldcontain ${hasErrors(bean: userInstance, field: 'passwordHash', 'error')} required">
   <span class="input-group-addon" for="password2"><i class="glyphicon glyphicon-italic"></i></span> 
    <g:passwordField class="form-control" name="password2" id="password2" type="text" placeholder="重复密码" required="" value=""/>
</div><br/>