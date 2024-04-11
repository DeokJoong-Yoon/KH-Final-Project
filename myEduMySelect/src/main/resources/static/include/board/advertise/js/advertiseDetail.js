$(function() {
	
	let commonNo = $("#commonNo").val();
	
	let academyId = $("#academyId").val();
	let writerId = $(".writerId").val();
	
	//세션에 따라 상세페이지에서 수정/삭제/좋아요 버튼 숨기기
	if(academyId) {
		$("#likeButton").css("display", "none");
		if(academyId != writerId) {
			$("#editPost").css("display", "none");
			$("#deletePost").css("display", "none");
		} 
	} else if(!academyId) {
		$("#editPost").css("display", "none");
		$("#deletePost").css("display", "none");
	}
	
	//게시물 수정
	$("#editPost").on("click", function(){
		$("#commonNoForm").attr({
			"method":"get",
			"action":"/advertise/advertiseUpdate"
		});
		$("#commonNoForm").submit();
	})
	
	//게시물 삭제
	$("#deletePost").click(function(){	
		
		var isConfirmed = confirm("게시물을 삭제하시겠습니까?");
		
		if(isConfirmed) {
			$("#commonNoForm").attr({
				"method":"post",
				"action":"/advertise/advertiseDelete"
			});
			$("#commonNoForm").submit();
		
		}
	})
	
	//이전 게시물 이동
	$("#prevPost").click(function(){
		window.location.href = "/advertise/prev/" + commonNo;
	})
	
	//다음 게시물 이동
	$("#nextPost").click(function(){
		window.location.href = "/advertise/next/" + commonNo;
	})
	
	//게시글 목록 이동
	$("#gotoList").click(function(){
		location.href="/advertise/advertiseBoardList"
	})
	
})