$(function() {
	
	let commonNo = $("#commonNo").val();
	
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