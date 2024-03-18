/*let buttonCheck = 0;

$(function(){
	
	$("#advertiseUpdateBtn").on("click", () => {
		$("#a_data").attr({
			"method":"get",
			"action":"/advertise/advertiseUpdateForm"
		});
		$("#a_data").submit();
	});
	
	
	$("#advertiseDeleteBtn").on("click", () => {
		$("#a_data").attr({
			"method":"post",
			"action":"/advertise/advertiseDelete"
		});
		$("#a_data").submit();
	});
	
	$("#advertiseInsertBtn").on("click", () => {
		location.href="/advertise/advertiseInsertForm";
	});
	
	$("#advertiseListBtn").click(function(){
		location.href="/advertise/advertiseList";
	});
	
	function actionProcess(method, goUrl){
		$("#a_data").attr({
			"method":method,
			"action":goUrl
		});
		$("#a_data").submit();
	}
});*/