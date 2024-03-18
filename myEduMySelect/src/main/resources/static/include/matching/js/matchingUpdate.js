$(function(){
	
	$("#editFinish").on("click", function(){
		$("#updateForm").attr({
			"method":"post",
			"action":"/matching/boardUpdate"
		})
		$("#updateForm").submit();

		
	})
})