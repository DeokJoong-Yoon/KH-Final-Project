$(function(){
    /* 제목 클릭 시 상세페이지 이동 */
    $(document).on("click", ".goDetail", function(){
        let commonNo = $(this).parents("tr").attr("data-num");
        $("#commonNo").val(commonNo);
        $("#detailForm").attr({
            "method":"get",
            "action":"/free/freeDetail"
        }).submit();
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
    $("#search").on("change", function(){
        if($("#search").val() == "all"){
            $("#keyword").val("전체 목록을 조회합니다.");
        } else {
            $("#keyword").val("").focus();
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
	    if ($("#search").val() !== "all") {
	        if (!chkData("#keyword", "검색어를")) return;
	    }
	    $("#pageNum").val(1); // 페이지 번호를 1로 설정
	    goPage(); // 페이지 이동 함수 호출
	});
	
	   /* 페이징 처리 이벤트 */
   $(".page-item a").on("click", function(e) {
      e.preventDefault();
      $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
         $("#f_search").attr({
            "method" : "get",
            "action" : "/free/freeList"
         });
         $("#f_search").submit();
   });
	
});
function goPage(){
    if($("#search").val() === "all") {
        $("#keyword").val("");
    }
    $("#f_search").attr({
        "method":"get",
        "action":"/free/freeList"
    });
    $("#f_search").submit();
 }  
  