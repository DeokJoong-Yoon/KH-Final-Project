$(function(){
    /* 저장 버튼 클릭 시 처리 */
    $("#freeInsertBtn").on("click", () => {
        // 입력값 체크
        if (!chkData("#commonTitle", "제목을")) return;
        else if (!chkData("#commonContent", "글내용을")) return;
        else if (!chkFile($("#file"))) return; // 파일 체크

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

/*$(function(){
    let errorMsg = "${errorMsg}";
    if(errorMsg != ""){
        alert(errorMsg);
    }
});*/
  /*var formData = new FormData($("#f_writeForm")[0]); // FormData 객체 생성

            $.ajax({
                url: "/free/freeInsert",
                type: "POST",
                data: formData,
                processData: false, // FormData를 사용할 때 필요한 옵션
                contentType: false, // FormData를 사용할 때 필요한 옵션
                success: function(response) {
                    // 성공 시 처리 로직, 예를 들어 리스트 페이지로 리다이렉트
                    location.href = "/free/freeList";
                },
                error: function(xhr, status, error) {
                    // 에러 시 처리 로직
                    alert("오류 발생");
                }
            });*/