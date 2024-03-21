$(function(){
	
	let matchingNo = $("#matchingNo").val();
	
	let userId = $(".userId").text();
	let writerId = $(".writerId").text();
	/*if(userId != writerId) {
		$("#editPost").css("display", "none");
		$("#deletePost").css("display", "none");
	}*/
		
	
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
	
	$("#prevPost").click(function(){
		window.location.href = "/matching/prev/" + matchingNo;
	})
	
	$("#nextPost").click(function(){
		window.location.href = "/matching/next/" + matchingNo;
	})
	
	$("#gotoList").click(function(){
		location.href="/matching/boardList"
	})
})


