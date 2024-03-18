$(function() {
	
	$(".goDetail").on("click", function() {
		let matchingNo = $(this).parents("tr").attr("data-num");
		$("#matchingNo").val(matchingNo);
		
		$("#detailForm").attr({
			"method" : "get",
			"action" : "/adminBoard/matchingBoardDetail"
		});
		$("#detailForm").submit();
	});
		

	
	$("#insertFormBtn").on("click", () => {
		location.href = "/adminBoard/writeForm";
	});
	
	/* 입력 양식 enter 제거 */
	$("#keyword").bind("keydown", function(event) {
		if (event.keyCode == 13) {
			event.preventDefault();
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
		$("#matchingForm").find("input[name='pageNum']").val($(this).attr("href"));
			$("#matchingForm").attr({
				"method" : "get",
				"action" : "/adminBoard/matching"
			});
			$("#matchingForm").submit();
	});
});

function goPage() {
	if ($("#search").val() == "all") {
		$("#keyword").val("");
	}
	$("#mathcingForm").attr({
		"method" : "get",
		"action" : "/adminBoard/matching"
	});
	$("#matchingForm").submit();
}