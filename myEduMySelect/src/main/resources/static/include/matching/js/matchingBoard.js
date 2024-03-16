$(function(){
	
	//제목 클릭 시 상세 페이지 이동
	$(".mbdLink").on("click", function(){
		
		let matchingPrivate = $(this).closest("tr").find("input[name='matchingPrivate']").val();
		let matchingPasswd = $(this).closest("tr").find("input[name='matchingPasswd']").val();
		let boardNumber = $(this).closest("tr").attr("data-num");
		let writerId = $(this).closest("tr").find(".writerId").text();
		let userId = $(".userId").text();
		let acaId = $(".acaId").text();
		let acaName = $(".acaName").text(); 
		
		if(userId == '' && acaId == '') {
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
	
	
	
	
	//입력 양식 enter 제어
	$("#keyword").bind("keydown", function(event) {
		if(event.keyCode == 13) {
			event.preventDefault();
			$("#mcBoardSearchBtn").click(); 
		}
	});
	
	//검색 버튼 클릭
	$("#mcBoardSearchBtn").on("click", function() {
		$("#pageNum").val(1);
		goPage();
	});
	
	//페이징 처리 이벤트
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		
		let pageNum = $(this).attr("href");
		
		$("#f_search").find("input[name='pageNum']").val(pageNum);
		
		goPage();
	});
	
	
	//전체보기 버튼
	$("#mcBoardAll").on("click", function(){
		$("#pageNum").val(1);
		$("#keyword").val("");
		goPage();
	})
	
	//맞춤형검색으로 돌아가기 버튼
	$("#mcGoBack").on("click", function(){
		location.href= "/matching/";
	})
})


//검색 함수
function goPage() {
	$("#f_search").attr({
		"method":"get",
		"action":"/matching/boardList"
	});
	$("#f_search").submit();
}


