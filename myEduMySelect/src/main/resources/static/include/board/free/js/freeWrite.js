$(function(){
    /* 저장 버튼 클릭 시 처리 */
    $("#freeInsertBtn").on("click", function() {
        // 입력값 체크
        if (!chkData("#commonTitle", "글제목을")) return;
        else if (!chkData("#commonContent", "글내용을")) return;
        else if (!chkFile($("#file"),"업로드 할 이미지 파일을.")) return;
        else {
            $("#f_writeForm").attr({
                "method":"post",
                "enctype":"multipart/form-data",
                "action":"/free/freeInsert"
            });
            $("#f_writeForm").submit();
        }
    });
    
    $("#freeCancelBtn").on("click", function(){
        $("#f_writeForm")[0].reset(); // 폼 초기화
    });
    
    $("#freeListBtn").on("click", function(){
        location.href = "/free/freeList"; // 목록 페이지로 이동
    });    
});




