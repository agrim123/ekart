$(document).ready(function(){
	$('.modal-trigger').leanModal();
	$("#close").click(function(){
		$('#modal1').closeModal();
	});
	$(".dropdown-button").dropdown();
	$('.collapsible').collapsible();
});

