$(function(){
	
	//제목 클릭 시 상세 페이지 이동
	$(".mbdLink").on("click", function(){
		
		let matchingPrivate = $(this).closest("tr").find("input[name='matchingPrivate']").val();
		let matchingPasswd = $(this).closest("tr").find("input[name='matchingPasswd']").val();
		let boardNumber = $(this).closest("tr").attr("data-num");
		let writerId = $(this).closest("tr").find(".writerId").text();
		let userId = $(".userId").text();
		
		if(userId == '') {
			alert("로그인 후 열람 가능합니다.");
			$(this).attr("href", "/matching/boardList")
		} else if(matchingPrivate == 'N' || userId == writerId) {
			$(this).attr("href", "/matching/boardDetail?matchingNo=" + boardNumber)
		} else {
			let pwd = prompt("비밀번호를 입력하세요", '');
				if(pwd == matchingPasswd) {
					$(this).attr("href", "/matching/boardDetail?matchingNo=" + boardNumber)
				} else {
					alert("비밀번호가 일치하지 않습니다.");
					$(this).attr("href", "/matching/boardList")
			}
		} 
		
		
	})
	
	//페이징 처리 이벤트
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
		$("#f_search").attr({
			"method":"get",
			"action":"/matching/boardList"
		});
		$("#f_search").submit();
	});
	
})


