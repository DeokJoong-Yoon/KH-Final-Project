$(function(){
	 $("#freeUpdateBtn").on("click", function(){
        if(!chkData("#common_title", "글제목을")) return;
        else if(!chkData("#common_content", "글내용을")) return;
        else {
            $("#f_updateForm").submit();
        }
    });

	
	$("#freeCancelBtn").on("click", function(){
		$("#f_updateForm").each(function(){
			this.reset();
		});
	});
	
	$("#freeListBtn").on("click", function(){
		location.href="/free/freeList";
	});
});

function chkData(selector, message) {
    if($(selector).val().trim() === "") {
        alert(message + " 입력해주세요.");
        $(selector).focus();
        return false;
    }
    return true;
}