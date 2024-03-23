$(function(){
    /* 제목 클릭 시 상세페이지 이동 */
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
		
    
    /* 글쓰기 버튼 클릭 */
    $("#freeWriterBtn").on("click", function() {
        location.href = "/free/freeWriterForm";
    });
    
    /* 입력 양식 enter 제거 */
    $("#keyword").bind("keydown", function(event){
        if(event.keyCode == 13) {
            event.preventDefault();
            $("#searchData").click(); 
        }
    });
    
    /* 검색 대상이 변경될 때 마다 처리 */
	$("#search").on("change", function() {
		if ($("#search").val() == "all") {
			$("#keyword").val("전체 목록을 조회합니다.");
		} else if ($("#search").val() !="all") {
			$("#keyword").val("");
			$("#keyword").focus();
		} 
	});
    
     //검색 버튼 클릭 시 처리 
    /*$("#searchData").on("click", function(){
        if($("#search").val() !== "all") {
            if(!chkData("#keyword","검색어를")) return;
        }
        $("#pageNum").val(1);
        goPage();
    });
    
    $(".page-item a").on("click", function(e){
		e.preventDefault();
		var pageNum = $(this).text();
		$("#f_search").find("input[name='pageNum']").val(pageNum);
		goPage();
	});*/
	
	/* 검색 버튼 클릭 시 처리 */
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
		$("#freeForm").find("input[name='pageNum']").val($(this).attr("href"));
			$("#freeForm").attr({
				"method" : "get",
				"action" : "/free/freeList"
			});
			$("#freeForm").submit();
	});
	
});
function goPage() {
	if ($("#search").val() == "all") {
		$("#keyword").val("");
	}
	$("#freeForm").attr({
		"method" : "get",
		"action" : "/free/freeList"
	});
	$("#freeForm").submit();
}
  