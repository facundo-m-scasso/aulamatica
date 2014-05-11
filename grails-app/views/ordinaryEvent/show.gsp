
<%@ page import="com.itba.aulamatica.OrdinaryEvent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ordinaryEvent.label', default: 'OrdinaryEvent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ordinaryEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ordinaryEvent" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ordinaryEvent">
			
				<g:if test="${ordinaryEventInstance?.commission}">
				<li class="fieldcontain">
					<span id="commission-label" class="property-label"><g:message code="ordinaryEvent.commission.label" default="Commission" /></span>
					
						<span class="property-value" aria-labelledby="commission-label"><g:fieldValue bean="${ordinaryEventInstance}" field="commission"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordinaryEventInstance?.courseCode}">
				<li class="fieldcontain">
					<span id="courseCode-label" class="property-label"><g:message code="ordinaryEvent.courseCode.label" default="Course Code" /></span>
					
						<span class="property-value" aria-labelledby="courseCode-label"><g:fieldValue bean="${ordinaryEventInstance}" field="courseCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordinaryEventInstance?.courseName}">
				<li class="fieldcontain">
					<span id="courseName-label" class="property-label"><g:message code="ordinaryEvent.courseName.label" default="Course Name" /></span>
					
						<span class="property-value" aria-labelledby="courseName-label"><g:fieldValue bean="${ordinaryEventInstance}" field="courseName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordinaryEventInstance?.day}">
				<li class="fieldcontain">
					<span id="day-label" class="property-label"><g:message code="ordinaryEvent.day.label" default="Day" /></span>
					
						<span class="property-value" aria-labelledby="day-label"><g:fieldValue bean="${ordinaryEventInstance}" field="day"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordinaryEventInstance?.enrolled}">
				<li class="fieldcontain">
					<span id="enrolled-label" class="property-label"><g:message code="ordinaryEvent.enrolled.label" default="Enrolled" /></span>
					
						<span class="property-value" aria-labelledby="enrolled-label"><g:fieldValue bean="${ordinaryEventInstance}" field="enrolled"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordinaryEventInstance?.from}">
				<li class="fieldcontain">
					<span id="from-label" class="property-label"><g:message code="ordinaryEvent.from.label" default="From" /></span>
					
						<span class="property-value" aria-labelledby="from-label"><g:fieldValue bean="${ordinaryEventInstance}" field="from"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordinaryEventInstance?.quota}">
				<li class="fieldcontain">
					<span id="quota-label" class="property-label"><g:message code="ordinaryEvent.quota.label" default="Quota" /></span>
					
						<span class="property-value" aria-labelledby="quota-label"><g:fieldValue bean="${ordinaryEventInstance}" field="quota"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordinaryEventInstance?.room}">
				<li class="fieldcontain">
					<span id="room-label" class="property-label"><g:message code="ordinaryEvent.room.label" default="Room" /></span>
					
						<span class="property-value" aria-labelledby="room-label"><g:fieldValue bean="${ordinaryEventInstance}" field="room"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ordinaryEventInstance?.to}">
				<li class="fieldcontain">
					<span id="to-label" class="property-label"><g:message code="ordinaryEvent.to.label" default="To" /></span>
					
						<span class="property-value" aria-labelledby="to-label"><g:fieldValue bean="${ordinaryEventInstance}" field="to"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ordinaryEventInstance?.id}" />
					<g:link class="edit" action="edit" id="${ordinaryEventInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
