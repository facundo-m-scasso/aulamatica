
<%@ page import="com.itba.aulamatica.Course" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-course" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-course" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list course">
			
				<g:if test="${courseInstance?.active}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="course.active.label" default="Active" /></span>
					
						<span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${courseInstance?.active}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="course.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${courseInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.department}">
				<li class="fieldcontain">
					<span id="department-label" class="property-label"><g:message code="course.department.label" default="Department" /></span>
					
						<span class="property-value" aria-labelledby="department-label"><g:fieldValue bean="${courseInstance}" field="department"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.level}">
				<li class="fieldcontain">
					<span id="level-label" class="property-label"><g:message code="course.level.label" default="Level" /></span>
					
						<span class="property-value" aria-labelledby="level-label"><g:fieldValue bean="${courseInstance}" field="level"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="course.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${courseInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.period}">
				<li class="fieldcontain">
					<span id="period-label" class="property-label"><g:message code="course.period.label" default="Period" /></span>
					
						<span class="property-value" aria-labelledby="period-label"><g:fieldValue bean="${courseInstance}" field="period"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.quota}">
				<li class="fieldcontain">
					<span id="quota-label" class="property-label"><g:message code="course.quota.label" default="Quota" /></span>
					
						<span class="property-value" aria-labelledby="quota-label"><g:fieldValue bean="${courseInstance}" field="quota"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="course.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${courseInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${courseInstance?.id}" />
					<g:link class="edit" action="edit" id="${courseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
