$(function(){
	
	let personalId = $("#personalId").val();
	let writerId = $(".writerId").text();

	
	if(personalId) {
		$("#matchingCommentNickname").val("댓글은 학원회원만 작성 가능합니다.");
		$('#matchingCommentContent').prop('disabled', true);
		if(personalId != writerId) {
			$("#editPost").css("display", "none");
			$("#deletePost").css("display", "none");
		} 
	} else if(!personalId) {
		$("#editPost").css("display", "none");
		$("#deletePost").css("display", "none");
	}
	
	
	//게시물 수정
	$("#editPost").on("click", function(){
		$("#formData").attr({
			"method":"get",
			"action":"/matching/boardUpdate"
		});
		$("#formData").submit();
	})
	
	//게시물 삭제
	$("#deletePost").click(function(){
		
		var isConfirmed = confirm("게시물을 삭제하시겠습니까?");
		
		if(isConfirmed) {
			$("#formData").attr({
				"method":"post",
				"action":"/matching/boardDelete"
			});
			$("#formData").submit();
		
		}
	})
	
	$("#gotoList").click(function(){
		location.href="/matching/boardList"
	})
})


