$(function(){
	/* 제목 클릭 시 상세페이지 이동 */
	$(".goDetail").on("click", function(){
		let commonNo = $(this).parents("tr").attr("data-num");
		$("#commonNo").val(commonNo);
		
		$("#detailForm").attr({
			"method":"get",
			"action":"/board/free/freeDetail"
		});
		$("#detailForm").submit();
	});
	
	/* 글쓰기 버튼 클릭 */
	$("#insertFormBtn").on("click", () => {
		location.href = "/board/free/freeWriterForm";
	});
	
	/* 입력 양식 enter 제거 */
	$("#keyword").bind("keydown", function(event){
		if(event.keyCode == 13) {
			event.preventDefault();
		}
	});
	
	
	/* 검색 대상이 변경될 때 마다 처리 */
	$("#search").on("change", function(){
		if($("#search").val()=="all"){
			$("#keyword").val("전체 목록을 조회합니다.");
		}else if($("#search").val()!="all"){
			$("#keyword").val("");
			$("#keyword").focus();
		}
	});
	
	
	/* 검색 버튼 클릭 시 처리 */
	$("#searchData").on("click", function(){
		if($("#search").val!="all") {
			if(!chkData("#keyword","검색어를")) return;
		}
		$("#pageNum").val(1);
		goPage();
	});
});

function goPage(){
	if($("#search").val() == "all") {
		$("#keyword").val("");
	}
	$("#f_search").attr({
		"method":"get",
		"action":"/board/free/freeList"
	});
	$("#f_search").submit();
}