$(function(){
	
	//파일 입력 시
	$("#fileInput").change(function(){
		let files = this.files;
		if (files.length > 10) {
	        alert('최대 10개의 파일만 선택할 수 있습니다.');
	        this.value = ''; // 파일 선택 취소
	    }
	})
		
	
	//저장 버튼 클릭 시 처리 
	$("#insertBtn").on("click", () => {
		//입력값 체크
		if(!chkData("#commonTitle","제목을"))		return;
		if (!chkData("#commonContent","글 내용을"))	return;
		
		// enctype 속성의 기본값은 "application/x-www-form-urlcencoded". POST방식 폼 전송에 기본값으로 사용
		$("#insertForm").attr({
			"method":"post",
			"enctype":"multipart/form-data",
			"action":"/advertise/advertiseInsert"
		});
		$("#insertForm").submit();
	});
	
	
	
	$("#resetBtn").on("click", function(){
		$("#insertForm").each(function(){
			this.reset();
		});
	});
	
	
	$("#goBackBtn").click(function(){
		location.href="/advertise/advertiseBoardList";
	});
	
});