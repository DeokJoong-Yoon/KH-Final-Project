$(function(){
	
	$("#freeUpdateBtn").on("click", () => {
		$("#f_data").attr({
			"method":"get",
			"action":"/free/freeUpdateForm"
		});
		$("#f_data").submit();
	});
	
	
	$("#freeDeleteBtn").on("click", () => {
		/*$("#f_data").attr({
			"method":"post",
			"action":"/free/freeDelete"
		});
		$("#f_data").submit();*/
		 if(confirm("정말 삭제하시겠습니까?")) {
            // AJAX 요청을 통해 서버에 삭제 요청을 보냅니다.
            $.ajax({
                type: "POST", // 삭제 요청이므로 POST 방식을 사용
                url: "/free/freeDelete", // 삭제 요청을 처리할 서버의 URL
                data: $("#f_data").serialize(), // 폼 데이터를 직렬화하여 전송
                success: function(response) {
                    // 서버에서 삭제 처리가 성공적으로 완료되었을 때의 동작
                    // 예: 사용자에게 성공 메시지를 표시하고, 목록 페이지로 이동
                    alert("성공적으로 삭제되었습니다.");
                    location.href="/free/freeList";
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 처리
                    // 예: 사용자에게 오류 메시지를 표시
                    alert("삭제 과정에서 오류가 발생했습니다: " + error);
                }
            });
        }
	});
	
	$("#freeWriterBtn").on("click", () => {
		location.href="/free/freeWriterForm";
	});
	
	$("#freeListBtn").click(function(){
		location.href="/free/freeList";
	});
	
	function actionProcess(method, goUrl){
		$("#f_data").attr({
			"method":method,
			"action":goUrl
		});
		$("#f_data").submit();
	}
});