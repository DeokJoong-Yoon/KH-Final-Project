$(function(){
	
	let personalId = $("#personalId").val();
	let academyId = $("#academyId").val();
	
	if(!academyId) {
		$("#advertiseInsertBtn").css("display", "none");
	}
	
	//제목 클릭 시 상세 페이지 이동
	$(".advLink").on("click", function() {
		
		let commonNo = $(this).closest("td").attr("data-num");		//게시글 번호
		console.log(commonNo);
	
		$(this).attr("href", "/advertise/advertiseDetail?commonNo=" + commonNo);
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
	
	
	//글 쓰기 버튼 클릭
	$("#advertiseInsertBtn").on("click", function() {
		location.href="/advertise/advertiseWriteForm";
	})
});



//검색 함수
function goPage() {
	$("#a_search").attr({
		"method":"get",
		"action":"/advertise/advertiseBoardList"
	});
	$("#a_search").submit();
}