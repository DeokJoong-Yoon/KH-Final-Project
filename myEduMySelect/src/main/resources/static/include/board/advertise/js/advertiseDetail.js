$(function() {
	
	let commonNo = $("#commonNo").val();
	
	let personalId = $("#personalId").val();
	let academyId = $("#academyId").val();
	let writerId = $(".writerId").val();
	
	console.log("개인세션 : " + personalId);
	console.log("학원세션 : " + academyId);
	console.log("작성자 : " + writerId);
	
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
		$("#formData").attr({
			"method":"get",
			"action":"/advertise/advertiseUpdate"
		});
		$("#formData").submit();
	})
	
	//게시물 삭제
	$("#deletePost").click(function(){	
		
		var isConfirmed = confirm("게시물을 삭제하시겠습니까?");
		
		if(isConfirmed) {
			$("#formData").attr({
				"method":"post",
				"action":"/advertise/advertiseDelete"
			});
			$("#formData").submit();
		
		}
	})
	
	$("#prevPost").click(function(){
		window.location.href = "/advertise/prev/" + commonNo;
	})
	
	$("#nextPost").click(function(){
		window.location.href = "/advertise/next/" + commonNo;
	})
	
	$("#gotoList").click(function(){
		location.href="/advertise/advertiseBoardList"
	})
	
})