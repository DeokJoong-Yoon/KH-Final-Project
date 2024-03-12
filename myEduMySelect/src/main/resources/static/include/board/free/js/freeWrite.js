$(function(){
	/* 저장 버튼 클릭 시 처리 */
	$("#freeInsertBtn").on("click", () => {
		//입력값 체크
		if(!chkData("#common_title","제목을")) return;
		else if (!chkData("#common_content","글내용을"))return;
		//else if (!chkData("#file","업로드할 이미지 파일을"))return;		
		else {
			/*if($("#file").val() != ""){	// 업로드 할 이미지 파일이 존재한다면.
				// 확장자가 png, jpg, gif 외 파일을 업로드 할 수 없습니다. 또는 igf, png, jpg 파일만 업로드 할 수 있습니다.
				if (!chkFile($("#file"))) return;
			}*/
			// enctype 속성의 기본값은 "application/x-www-form-urlcencoded". POST방식 폼 전송에 기본값으로 사용
			$("#f_writeForm").attr({
				"method":"post",
				/*"enctype":"multipart/form-data",*/
				"action":"/free/freeInsert"
			});
			$("#f_writeForm").submit();
		}
	});
	
	
	
	$("#freeCancelBtn").on("click", function(){
		$("#f_writeForm").each(function(){
			this.reset();
		});
	});
	
	
	$("#freeListBtn").click(function(){
		location.href="/free/freeList";
	});
	
});