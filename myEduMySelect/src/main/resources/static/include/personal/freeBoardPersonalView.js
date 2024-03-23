$(function() {
    /* 검색 버튼 클릭 시 처리 이벤트 */
    $("#searchData").on("click", function() {
        if ($("#search").val() != "all") {
            if (!chkData("#keyword", "검색어를")) return;
        }
        $("#pageNum").val(1);    // 페이지 초기화
        goPage();
    });
    
    /* 페이징 처리 이벤트 */
    $(".page-item a").on("click", function(e) {
        e.preventDefault();
        $("#pagenum").val($(this).attr("href"));
        $("#freeForm").submit(); // 폼 제출
    });
    
	$(".goDetail").on("click", function() {
		
		/* form을 생성하여 제어 */
		let commonNo = $(this).parents("tr").attr("data-num");
		$("#commonNo").val(commonNo);
		
		// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
		$("#detailForm").attr({
			"method" : "get",
            "action":"/free/freeDetail"
		});
		$("#detailForm").submit();
	});
});
