$(function() {

	
	/* 검색 버튼 클릭 시 처리 이벤트 */
	$("#searchData").on("click", function() {
		if ($("#search").val() != "all") {
			if (!chkData("#keyword", "검색어를")) return;
		}
		$("#pageNum").val(1);	// 페이지 초기화
		goPage();
	});
	  
	/* 페이징 처리 이벤트 */
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		$("#matchingForm").find("input[name='pageNum']").val($(this).attr("href"));
			$("#matchingForm").attr({
				"method" : "get",
				"action" : "/personalMatchingView"
			});
			$("#matchingForm").submit();
	});
	
	//제목 클릭 시 상세 페이지 이동
	$(".mbdLink").on("click", function(){
		
		let matchingPrivate = $(this).closest("tr").find("input[name='matchingPrivate']").val();
		let matchingPasswd = $(this).closest("tr").find("input[name='matchingPasswd']").val();
		let boardNumber = $(this).closest("tr").attr("data-num");
		let writerId = $(this).closest("tr").find(".writerId").text();
		let userId = $(".userId").text();
		
		 if(matchingPrivate == 'N' || userId == writerId) {
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
});




