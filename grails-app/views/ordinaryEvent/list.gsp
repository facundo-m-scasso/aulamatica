
<%@ page import="com.itba.aulamatica.OrdinaryEvent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ordinaryEvent.label', default: 'OrdinaryEvent')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ordinaryEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ordinaryEvent" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="commission" title="${message(code: 'ordinaryEvent.commission.label', default: 'Commission')}" />
					
						<g:sortableColumn property="courseCode" title="${message(code: 'ordinaryEvent.courseCode.label', default: 'Course Code')}" />
					
						<g:sortableColumn property="courseName" title="${message(code: 'ordinaryEvent.courseName.label', default: 'Course Name')}" />
					
						<g:sortableColumn property="day" title="${message(code: 'ordinaryEvent.day.label', default: 'Day')}" />
					
						<g:sortableColumn property="enrolled" title="${message(code: 'ordinaryEvent.enrolled.label', default: 'Enrolled')}" />
					
						<g:sortableColumn property="from" title="${message(code: 'ordinaryEvent.from.label', default: 'From')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ordinaryEventInstanceList}" status="i" var="ordinaryEventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ordinaryEventInstance.id}">${fieldValue(bean: ordinaryEventInstance, field: "commission")}</g:link></td>
					
						<td>${fieldValue(bean: ordinaryEventInstance, field: "courseCode")}</td>
					
						<td>${fieldValue(bean: ordinaryEventInstance, field: "courseName")}</td>
					
						<td>${fieldValue(bean: ordinaryEventInstance, field: "day")}</td>
					
						<td>${fieldValue(bean: ordinaryEventInstance, field: "enrolled")}</td>
					
						<td>${fieldValue(bean: ordinaryEventInstance, field: "from")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ordinaryEventInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
