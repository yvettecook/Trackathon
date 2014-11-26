// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/


// $(document).ready(function() {
//   $('.product').click(function() {


//   });
// });


// $(".product").bind('click', function(){
//   if (this.clicked){
//     $.ajax({
//       url: '/projects/'+this.value+,
//       type: 'POST',
//       data: {"true": this.clicked}
//     });
//   }
//   else {
//      alert("no");
//   }
// });

// $(document).ready(function() {
// 	$('#product').click( function(){ 
// 		if (this.clicked){ 
// 			$.ajax({ 
// 				url: '/projects/1/edit', 
// 				type: 'POST', 
// 				data: {"true": this.clicked} 
// 			}); 
// 		} 
// 	});
// });

$(document).ready(function() {
	var URL = $(this).context.URL
	$('#product').on('click', function() {
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