<%@ page import="com.itba.aulamatica.OrdinaryEvent" %>



<div class="fieldcontain ${hasErrors(bean: ordinaryEventInstance, field: 'commission', 'error')} ">
	<label for="commission">
		<g:message code="ordinaryEvent.commission.label" default="Commission" />
		
	</label>
	<g:textField name="commission" value="${ordinaryEventInstance?.commission}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ordinaryEventInstance, field: 'courseCode', 'error')} ">
	<label for="courseCode">
		<g:message code="ordinaryEvent.courseCode.label" default="Course Code" />
		
	</label>
	<g:textField name="courseCode" value="${ordinaryEventInstance?.courseCode}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ordinaryEventInstance, field: 'courseName', 'error')} ">
	<label for="courseName">
		<g:message code="ordinaryEvent.courseName.label" default="Course Name" />
		
	</label>
	<g:textField name="courseName" value="${ordinaryEventInstance?.courseName}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ordinaryEventInstance, field: 'day', 'error')} ">
	<label for="day">
		<g:message code="ordinaryEvent.day.label" default="Day" />
		
	</label>
	<g:field type="number" name="day" value="${ordinaryEventInstance.day}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ordinaryEventInstance, field: 'enrolled', 'error')} ">
	<label for="enrolled">
		<g:message code="ordinaryEvent.enrolled.label" default="Enrolled" />
		
	</label>
	<g:field type="number" name="enrolled" value="${ordinaryEventInstance.enrolled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ordinaryEventInstance, field: 'from', 'error')} ">
	<label for="from">
		<g:message code="ordinaryEvent.from.label" default="From" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: ordinaryEventInstance, field: 'quota', 'error')} ">
	<label for="quota">
		<g:message code="ordinaryEvent.quota.label" default="Quota" />
		
	</label>
	<g:field type="number" name="quota" value="${ordinaryEventInstance.quota}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ordinaryEventInstance, field: 'room', 'error')} ">
	<label for="room">
		<g:message code="ordinaryEvent.room.label" default="Room" />
		
	</label>
	<g:textField name="room" value="${ordinaryEventInstance?.room}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ordinaryEventInstance, field: 'to', 'error')} ">
	<label for="to">
		<g:message code="ordinaryEvent.to.label" default="To" />
		
	</label>
	
</div>

