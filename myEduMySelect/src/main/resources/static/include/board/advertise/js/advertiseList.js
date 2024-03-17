$(function(){
	
	//제목 클릭 시 상세 페이지 이동
	$(".advLink").on("click", function() {
		
		let commonNo = $(this).closest("tr").attr("data-num");		//게시글 번호
		let userId = $(".userId").text();							//접속한 개인회원 id
		let acaId = $(".acaId").text();								//접속한 학원회원 id
		
		//글 제목 클릭 시, 로그인 시에만 열람 가능하도록 제어
		if (userId == '' && acaId == '') {
			alert("로그인 후 열람 가능합니다.");
			$(this).attr("href", "/advertise/advertiseBoardList");
		} else {
			$(this).attr("href", "/advertise/advertiseBoardDetail?commonNo=" + commonNo)
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
	$("#boardSearchBtn").on("click", function() {
		$("#pageNum").val(1);
		goPage();
	});
	
	
	//페이징 처리 이벤트
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		let pageNum = $(this).attr("href");
		$("#a_search").find("input[name='pageNum']").val(pageNum);
		goPage();
	});
	
	
	//전체보기 버튼
	$("#boardAll").on("click", function(){
		$("#pageNum").val(1);
		$("#keyword").val("");
		goPage();
	});
});



//검색 함수
function goPage() {
	$("#a_search").attr({
		"method":"get",
		"action":"/advertise/advertiseBoardList"
	});
	$("#a_search").submit();
}