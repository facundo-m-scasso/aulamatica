<%@ page import="com.itba.aulamatica.Room" %>



<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'capacity', 'error')} ">
	<label for="capacity">
		<g:message code="room.capacity.label" default="Capacity" />
		
	</label>
	<g:field type="number" name="capacity" value="${roomInstance.capacity}" />
</div>

<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="room.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${roomInstance?.comments}" />
</div>

<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'exam_capacity', 'error')} ">
	<label for="exam_capacity">
		<g:message code="room.exam_capacity.label" default="Examcapacity" />
		
	</label>
	<g:field type="number" name="exam_capacity" value="${roomInstance.exam_capacity}" />
</div>

<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'localization', 'error')} ">
	<label for="localization">
		<g:message code="room.localization.label" default="Localization" />
		
	</label>
	<g:textField name="localization" value="${roomInstance?.localization}" />
</div>

<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="room.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${roomInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: roomInstance, field: 'use', 'error')} ">
	<label for="use">
		<g:message code="room.use.label" default="Use" />
		
	</label>
	<g:textField name="use" value="${roomInstance?.use}" />
</div>

