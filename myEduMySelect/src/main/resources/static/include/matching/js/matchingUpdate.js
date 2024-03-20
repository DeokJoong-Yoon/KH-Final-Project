$(function(){
	
	$("#editFinish").on("click", function(){
		
		if(!chkData("#matchingComment","수정 내용을"))		return;
		
		$("#updateForm").attr({
			"method":"post",
			"action":"/matching/boardUpdate"
		})
		$("#updateForm").submit();

		
	})
})