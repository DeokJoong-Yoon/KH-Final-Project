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
