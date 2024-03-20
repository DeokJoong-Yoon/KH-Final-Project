$(function(){
	
	$("#freeUpdateBtn").on("click", () => {
	    $("#f_data").attr({
	        "method":"get",
	        "action":"/free/freeUpdateForm"
	    });
	    $("#f_data").submit();
	});

	
	$("#freeDeleteBtn").on("click", () => {
		$.ajax({
			 	url: "/free/freereplyCount",
                type: "POST",
                data: "commonNo="+$("#commonNo").val(),
                dataype : "text",
                error: function(xhr, status, error) {
                    alert("삭제 과정에서 오류가 발생했습니다: " + error);
                },
                 success: function(resultData) {
                   if(resultData==="0"){
					   btnInit();
					   buttonCheck = "deleteButton";
				   }else{
					   alert("댓글 존재 시 게시글을 삭제할 수 없습니다.\n댓글이 전부 삭제되어야 삭제 가능합니다.");
					   return;
				   }
                },
            });
       	});
	
	$("#freeWriterBtn").on("click", () => {
		location.href="/free/freeWriterForm";
	});
	
	$("#freeListBtn").click(function(){
		location.href="/free/freeList";
	});
	
	$("#")
});

function actionProcess(method, goUrl){
		$("#f_data").attr({
			"method":method,
			"action":goUrl
		});
		$("#f_data").submit();
}