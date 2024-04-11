$(function(){
	
	//파일 입력 시
	$("#fileInput").change(function(){
		let files = this.files;
		if (files.length > 10) {
	        alert('최대 10개의 파일만 선택할 수 있습니다.');
	        this.value = ''; // 파일 선택 취소
	    }
	})
	
	//수정완료 버튼 클릭 시 처리
	$("#editFinish").on("click", function(){
		//입력값 체크
		if(!chkData("#commonTitle","제목을"))		return;
		if (!chkData("#commonContent","글 내용을"))	return;
		
		$("#updateForm").attr({
			"method":"post",
			"enctype":"multipart/form-data",
			"action":"/advertise/advertiseUpdate"
		})
		$("#updateForm").submit();
		
	})
})