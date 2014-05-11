
<%@ page import="com.itba.aulamatica.Course" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-course" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-course" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="active" title="${message(code: 'course.active.label', default: 'Active')}" />
					
						<g:sortableColumn property="code" title="${message(code: 'course.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="department" title="${message(code: 'course.department.label', default: 'Department')}" />
					
						<g:sortableColumn property="level" title="${message(code: 'course.level.label', default: 'Level')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'course.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="period" title="${message(code: 'course.period.label', default: 'Period')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${courseInstanceList}" status="i" var="courseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${courseInstance.id}">${fieldValue(bean: courseInstance, field: "active")}</g:link></td>
					
						<td>${fieldValue(bean: courseInstance, field: "code")}</td>
					
						<td>${fieldValue(bean: courseInstance, field: "department")}</td>
					
						<td>${fieldValue(bean: courseInstance, field: "level")}</td>
					
						<td>${fieldValue(bean: courseInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: courseInstance, field: "period")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${courseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
