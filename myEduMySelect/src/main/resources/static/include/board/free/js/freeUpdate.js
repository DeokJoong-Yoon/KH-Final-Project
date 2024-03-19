$(function() {
  $("#freeUpdateBtn").on("click", function(){
    // 입력 데이터 검증
    if(!chkData("#commonTitle", "글제목을")) return;
    else if(!chkData("#commonContent", "글내용을")) return;
    else {
        if($("#commonFile").val()!=""){
			if(!chkFile($("#commonFile"))) return;
   	 	}
   	 	$("#updateForm").attr({
				"method":"post",
				"enctype":"multipart/form-data",
				"action":"/free/freeUpdate"
			});
			$("updateForm").submit();
		}   		 
   	 });
   	 
   	 /* 취소 */
   	 $("#freeCancelBtn").on("click", function(){
			$("#updateForm").each(function(){
				this.reset();
		});
	});
	
	/* 목록 */
	$("#freeListBtn").on("click", function(){
		location.href="/free/freeList";
	})
   	 
   	 
});



function chkData(selector, message) {
    if($(selector).val().trim() === "") {
        alert(message + " 입력해주세요.");
        $(selector).focus();
        return false;
    }
    return true;
}


/*// 사용자가 입력한 데이터 가져오기
        var inputData = {
            commonNo: $("#commonNo_hidden").val(),
            commonTitle: $("#commonTitle").val(),
            commonContent: $("#commonContent").val()
        };
        
        // AJAX 요청
        $.ajax({
            url: "/free/freeUpdate", // 수정 처리를 담당하는 컨트롤러의 URL
            type: "POST",
            data: inputData,
            success: function(response) {
                // 성공적으로 응답을 받았을 때 실행되는 코드
                console.log("응답 받은 데이터:", response);
                
                // 성공 메시지 표시
                alert("글이 성공적으로 수정되었습니다.");
                // 필요하다면 페이지 리로드
                location.reload();
            },
            error: function(xhr, status, error) {
                // 에러 발생 시 실행되는 코드
                console.error("에러 발생:", error);
                // 에러 메시지 표시
                alert("글 수정 중 오류가 발생했습니다.");
            }
        });*/