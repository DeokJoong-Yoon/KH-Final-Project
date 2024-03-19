$(function(){
	
	$("#editFinish").on("click", function(){
		
		if(!chkData("#commonTitle","제목을"))		return;
		if (!chkData("#commonContent","글 내용을"))	return;
		
		//첨부파일 유효성 검사
		for(let i=1; i<=5; i++) {
			if($("#file" + i).val() != "") {		// 업로드 할 이미지 파일이 존재한다면.
				if(!chkFile($("#file" + i))) 
					return;
			}
		}
		
		
		$("#formData").attr({
			"method":"post",
			"enctype":"multipart/form-data",
			"action":"/advertise/advertiseUpdate"
		})
		$("#formData").submit();

		
		$("#cancel").on("click", function(){
			$("#formData").each(function(){
				this.reset();
			});
		});
		
	})
})