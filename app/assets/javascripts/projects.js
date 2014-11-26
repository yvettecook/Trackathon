$(document).ready(function() {


	var URL = $(this).context.URL
	$.each($('.milestone'), function(index, value){
		var attribute = value.id
	
	$("#" + value.id).on('click', function() {
	  var checked; 
	  if ($(this).is(':checked')) {
	    checked = true;
	  } else {
	    checked = false;
	  } 

	  var data = {id: $(this).data('project_id')};
		data[attribute] = checked;

	  $.ajax({
	      type: "GET",
	      url: URL + "/edit",
	      data: data
	   });     
		});
	});
});

