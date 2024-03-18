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
	
	
	
	/* 검색 대상이 변경될 때 마다 처리 이벤트 */
	$("#search").on("change", function(){
		if($("#search").val()=="all"){
			$("#keyword").val("전체 목록을 조회합니다.");
		}else if($("#search").val()!="all") {
			$("#keyword").val("");
			$("#keyword").focus();
		}
	});
	
	/* 검색 버튼 클릭 시 처리 이벤트 */
	$("#searchData").on("click", function(){
		if($("#search").val()!="all"){	//제목/내용/작성자 선택 시 검색어 유효성 체크
			if(!chkData("#keyword","검색어를")) return;
		}
		$("#pageNum").val(1);	// 페이지 초기화
		goPage();
	});
});

function chkData(inputId, message) {
    var inputValue = $(inputId).val();
    if(inputValue.trim() === "") {
        alert(message + " 입력해주세요.");
        $(inputId).focus();
        return false;
    }
    return true;
}


/* 검색을 위한 실질적인 처리 함수 */
function goPage(){
	if($("#search").val() == "all"){
		$("#keyword").val("");
	} 
	$("#f_search").attr({
		"method":"get",
		"action":"/free/freeList"
	});
	$("#f_search").submit();
};