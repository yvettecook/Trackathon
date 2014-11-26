
$(document).ready(function() {
	var URL = $(this).context.URL
	$('#product').on('change', function() {
	  var checked; 
	  if ($(this).is(':checked')) {
	    checked = true;
	  } else {
	    checked = false;
	  } 
	  $.ajax({
	      type: "GET",
	      url: URL + "/edit",
	      data: { id: $(this).data('project_id'), product: checked }
	   });     
	});
});


// $(document).ready(function() {
// 	var URL = $(this).context.URL
// 	$('.milestone').on('click', function() {
// 	  var checked; 
// 	  if ($(this).is(':checked')) {
// 	    checked = true;
// 	  } else {
// 	    checked = false;
// 	  } 
// 	  $.ajax({
// 	      type: "GET",
// 	      url: URL + "/edit",
// 	      data: { id: $(this).data('project_id'), design: checked }
// 	   });     
// 	});
// });