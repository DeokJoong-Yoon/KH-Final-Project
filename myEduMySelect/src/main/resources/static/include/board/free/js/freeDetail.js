let buttonCheck = 0;

$(function(){
	
	$("#freeUpdateBtn").on("click", () => {
		$("#f_data").attr({
			"method":"get",
			"action":"/free/freeUpdateForm"
		});
		$("#f_data").submit();
	});
	
	
	$("#freeDeleteBtn").on("click", () => {
		$("#f_data").attr({
			"method":"post",
			"action":"/free/freeDelete"
		});
		$("#f_data").submit();
	});
	
	$("#freeWriterBtn").on("click", () => {
		location.href="/free/freeWriterForm";
	});
	
	$("#freeListBtn").click(function(){
		location.href="/free/freeList";
	});
	
	function actionProcess(method, goUrl){
		$("#f_data").attr({
			"method":method,
			"action":goUrl
		});
		$("#f_data").submit();
	}
});