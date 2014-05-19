$(function() {
	var logic = function(currentDateTime) {
		if (currentDateTime.getDay() == 6) {
			this.setOptions({
				minTime : '11:00'
			});
		} else
			this.setOptions({
				minTime : '8:00'
			});
	};
	$('#datetimepicker_rantime').datetimepicker({
		onChangeDateTime : logic,
		onShow : logic
	});
});