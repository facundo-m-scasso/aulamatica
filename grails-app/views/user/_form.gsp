<%@ page import="com.itba.aulamatica.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'created', 'error')} ">
	<label for="created">
		<g:message code="user.created.label" default="Created" />
		
	</label>
	<g:datePicker name="created" precision="day" value="${userInstance?.created}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'mail', 'error')} ">
	<label for="mail">
		<g:message code="user.mail.label" default="Mail" />
		
	</label>
	<g:textField name="mail" value="${userInstance?.mail}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${userInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${userInstance?.password}" />
</div>

