
<%@ page import="com.itba.aulamatica.Room" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'room.label', default: 'Room')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-room" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-room" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list room">
			
				<g:if test="${roomInstance?.capacity}">
				<li class="fieldcontain">
					<span id="capacity-label" class="property-label"><g:message code="room.capacity.label" default="Capacity" /></span>
					
						<span class="property-value" aria-labelledby="capacity-label"><g:fieldValue bean="${roomInstance}" field="capacity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${roomInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="room.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${roomInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${roomInstance?.exam_capacity}">
				<li class="fieldcontain">
					<span id="exam_capacity-label" class="property-label"><g:message code="room.exam_capacity.label" default="Examcapacity" /></span>
					
						<span class="property-value" aria-labelledby="exam_capacity-label"><g:fieldValue bean="${roomInstance}" field="exam_capacity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${roomInstance?.localization}">
				<li class="fieldcontain">
					<span id="localization-label" class="property-label"><g:message code="room.localization.label" default="Localization" /></span>
					
						<span class="property-value" aria-labelledby="localization-label"><g:fieldValue bean="${roomInstance}" field="localization"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${roomInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="room.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${roomInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${roomInstance?.use}">
				<li class="fieldcontain">
					<span id="use-label" class="property-label"><g:message code="room.use.label" default="Use" /></span>
					
						<span class="property-value" aria-labelledby="use-label"><g:fieldValue bean="${roomInstance}" field="use"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${roomInstance?.id}" />
					<g:link class="edit" action="edit" id="${roomInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
