$(function(){
    /* 저장 버튼 클릭 시 처리 */
    $("#freeInsertBtn").on("click", function() {
        // 입력값 체크
        if (!chkData("#commonTitle", "글제목을")) return;
        else if (!chkData("#commonContent", "글내용을")) return;
        else if (!chkFile($("#file","업로드 할 이미지 파일을."))) return;
        else {
			if($("#file").val()!=""){
				if (!chkFile($("#file"))) return;
			}
			$("#f_writeForm").attr({
				"method":"post",
				"enctype":"multipart/form-data",
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
    
    $("#freeListBtn").on("click", function(){ // 클릭 이벤트 바인딩 수정
        location.href = "/free/freeList";
    });    
});
