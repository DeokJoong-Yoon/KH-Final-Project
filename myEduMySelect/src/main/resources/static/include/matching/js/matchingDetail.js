$(function(){
	
	let matchingNo = $("#matchingNo").val();
	
	let userId = $(".userId").text();
	let writerId = $(".writerId").text();
	if(userId != writerId) {
		$("#editPost").css("display", "none");
		$("#deletePost").css("display", "none");
	}
		
	
	$("#editPost").on("click", function(){
		
		$("#formData").attr({
			"method":"get",
			"action":"/matching/boardUpdate"
		});
		$("#formData").submit();
	})
	
	$("#deletePost").click(function(){
		
		var isConfirmed = confirm("게시물을 삭제하시겠습니까?");
		
		if(isConfirmed) {
			$("#formData").attr({
				"method":"get",
				"action":"/matching/boardDelete"
			});
			$("#formData").submit();
		
		}
	})
	
	$("#prevPost").click(function(){
	})
	
	$("#nextPost").click(function(){
	})
	
	$("#gotoList").click(function(){
		location.href="/matching/boardList"
	})
})