
<%@ page import="com.itba.aulamatica.Room" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'room.label', default: 'Aula')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-room" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-room" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'room.name.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="capacity" title="${message(code: 'room.capacity.label', default: 'Capacidad')}" />
					
						<g:sortableColumn property="exam_capacity" title="${message(code: 'room.exam_capacity.label', default: 'Capacidad Examen')}" />
						
						<g:sortableColumn property="comments" title="${message(code: 'room.comments.label', default: 'Comentarios')}" />
					
						<g:sortableColumn property="localization" title="${message(code: 'room.localization.label', default: 'Ubicacion')}" />
					
						<g:sortableColumn property="use" title="${message(code: 'room.use.label', default: 'Uso')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${roomInstanceList}" status="i" var="roomInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${roomInstance.id}">${fieldValue(bean: roomInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: roomInstance, field: "capacity")}</td>
					
						<td>${fieldValue(bean: roomInstance, field: "exam_capacity")}</td>
					
						<td>${fieldValue(bean: roomInstance, field: "comments")}</td>
						
						<td>${fieldValue(bean: roomInstance, field: "localization")}</td>	
					
						<td>${fieldValue(bean: roomInstance, field: "use")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${roomInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
