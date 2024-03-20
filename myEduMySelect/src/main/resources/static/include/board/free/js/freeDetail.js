$(function(){
	
	$("#freeUpdateBtn").on("click", () => {
	    $("#f_data").attr({
	        "method":"get",
	        "action":"/free/freeUpdateForm"
	    });
	    $("#f_data").submit();
	});

	$("#freeDeleteBtn").on("click", ()=>{
		$.ajax({
			url : "/free/freeReplyCnt",
			type : "post",
			data : "commonNo=" + $("#commonNo").val(),
			dataType : "text",
			error : function() {
				alert('시스템에 문제가 있어 잠시 후 다시 진행해 주세요.');
			},
			success : function(resultData) {
				if(resultData==="0") { //댓글이 존재하지 않을 경우
					btnInit();
					buttonCheck = "deleteButton";
				} else {
					alert("댓글 존재시 게시글을 삭제할 수 없습니다.\n 댓글이 전부 삭제되어야 삭제 가능합니다.");
					return;
				}
			}
		});
	});
	
	
	

	$("#freeWriterBtn").on("click", () => {
		location.href="/free/freeWriterForm";
	});
	
	$("#freeListBtn").click(function(){
		location.href="/free/freeList";
	});

});
function actionProcess(method, goUrl){
		$("#f_data").attr({
			"method":method,
			"action":goUrl
		});
		$("#f_data").submit();
}