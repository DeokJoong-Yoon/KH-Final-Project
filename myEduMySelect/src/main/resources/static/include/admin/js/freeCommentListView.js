$(function() {
	
	$(".goDelete").on("click", function() {
		
		
		if(confirm("정말 삭제하시겠습니까?")) {
		let commonCommentNo = $(this).parents("tr").attr("data-num");
		$("#commonCommentNo").val(commonCommentNo);
		
		$("#detailForm").attr({
			"method" : "post",
			"action" : "/adminBoard/freeCommentDelete"
		});
		$("#detailForm").submit();
		} else {
			return;
		}
	});
		
		/* 입력 양식 enter 제거 */
	$("#keyword").bind("keydown", function(event) {
		if (event.keyCode == 13) {
			event.preventDefault();
			$("#searchData").click();
		}
	});
	
	/* 검색 대상이 변경될 때마다 처리 이벤트 */
	$("#search").on("change", function() {
		if ($("#search").val() == "all") {
			$("#keyword").val("전체 목록을 조회합니다.");
		} else if ($("#search").val() !="all") {
			$("#keyword").val("");
			$("#keyword").focus();
		} 
	});
	
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
		$("#commentForm").find("input[name='pageNum']").val($(this).attr("href"));
			goPage();
	});
});

function goPage() {
	if ($("#search").val() == "all") {
		$("#keyword").val("");
	}
	$("#commentForm").attr({
		"method" : "get",
		"action" : "/adminBoard/freeComment"
	});
	$("#commentForm").submit();
}