$(function(){
	$(".goDetail").on("click", function(){
		/*let common_no = $(this).parents("tr").attr("data-num");
		$("#common_no").val(common_no);
		console.log("글번호 : "+common_no);
		location.href="/free/freeDetail?common_no="+common_no;*/
		let common_no = $(this).parents("tr").attr("data-num");
		$("#common_no").val(common_no);
		
		$("#detailForm").attr({
			"method":"get",
			"action":"/free/freeDetail"
		});
		$("#detailForm").submit();
	});
	
	
	$("#freeWriterBtn").on("click", () => {
		location.href="/free/freeWriterForm";
	});
	
	
	
	$("#keyword").bind("keydown", function(event){
		if(event.keyCode == 13){
			event.preventDefault();
		}
	});
	
	$("#freeSearch").on("change", function(){
		if($("#freeSearch").val()=="all"){
			$("#keyword").val("전체 목록을 조회합니다.");
		}else if($("#freeSearch").val()!="all") {
			$("#keyword").val("");
			$("#keyword").focus();
		}
	});
	
	$("#searchData").on("click", function(){
		if($("#freeSearch").val()!="all"){	//제목/내용/작성자 선택 시 검색어 유효성 체크
			if(!chkData("#keyword","검색어를")) return;
		}
	/*	$("#pageNum").val(1);	// 페이지 초기화*/
		goPage();
	});
	
});


function goPage(){
	if($("#search").val() == "all"){
		$("#keyword").val("");
	}
	$("#f_search").attr({
		"method":"get",
		"action":"/free/freeList"
	});
	$("#f_search").submit();
}
