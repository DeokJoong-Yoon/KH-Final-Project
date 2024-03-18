$(function(){
	/* 저장 버튼 클릭 시 처리 */
	$("#insertBtn").on("click", () => {
		//입력값 체크
		if(!chkData("#commonTitle","제목을"))		return;
		if (!chkData("#commonContent","글 내용을"))	return;
		
		//첨부파일 유효성 검사
		for(let i=1; i<=5; i++) {
			if($("#file" + i).val() != "") {		// 업로드 할 이미지 파일이 존재한다면.
				if(!chkFile($("#file" + i))) 
					return;
			}
		}
			
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