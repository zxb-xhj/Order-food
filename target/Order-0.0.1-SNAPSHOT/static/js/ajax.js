$(document).ready(function(){
	$("#li1").click(function(){
		$("#div1").load("${c}/ds/dishes1");
	});
});
$(document).ready(function(){
	$("#li2").click(function(){
		$("#div1").load("${c }/ds/signature/5");
	});
});
$(document).ready(function(){
	$("#li3").click(function(){
		$("#div1").load("${c }/ds/vegetables/1");
	});
});
$(document).ready(function(){
	$("#li4").click(function(){
		$("#div1").load("${c }/ds/daily/2");
	});
});
$(document).ready(function(){
	$("#li5").click(function(){
		$("#div1").load("${c }/ds/Hunan/3");
	});
});
$(document).ready(function(){
	$("#li6").click(function(){
		$("#div1").load("${c }/ds/dessert/4");
	});
});
$(document).ready(function(){
	$("#agw").click(function(){
		$("#div1").load("${c}/gw/gowu");
	});
});
$(document).ready(function(){
	$("#bs").click(function(){
		$("#div1").load("${c }/gw/deleteid/${di.id}");
	});
});

$(document).ready(function(){
	$("input").keyup(function(){
		txt=$("input").val();
		$("span").load("${c}/ds/dishes1",{suggest:txt});
	});
});