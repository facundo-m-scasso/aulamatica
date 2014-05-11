<%@ page import="com.itba.aulamatica.Course" %>



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="course.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${courseInstance?.active}" />
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="course.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${courseInstance?.code}" />
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'department', 'error')} ">
	<label for="department">
		<g:message code="course.department.label" default="Department" />
		
	</label>
	<g:textField name="department" value="${courseInstance?.department}" />
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'level', 'error')} ">
	<label for="level">
		<g:message code="course.level.label" default="Level" />
		
	</label>
	<g:textField name="level" value="${courseInstance?.level}" />
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="course.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${courseInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'period', 'error')} ">
	<label for="period">
		<g:message code="course.period.label" default="Period" />
		
	</label>
	<g:textField name="period" value="${courseInstance?.period}" />
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'quota', 'error')} ">
	<label for="quota">
		<g:message code="course.quota.label" default="Quota" />
		
	</label>
	<g:field type="number" name="quota" value="${courseInstance.quota}" />
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'year', 'error')} ">
	<label for="year">
		<g:message code="course.year.label" default="Year" />
		
	</label>
	<g:textField name="year" value="${courseInstance?.year}" />
</div>

