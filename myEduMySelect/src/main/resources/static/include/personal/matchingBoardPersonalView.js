$(function() {	  
	/* 페이징 처리 이벤트 */
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		$("#matchingForm").find("input[name='pageNum']").val($(this).attr("href"));
			$("#matchingForm").attr({
				"method" : "get",
				"action" : "/personalMatchingView"
			});
			$("#matchingForm").submit();
	});
	
	//제목 클릭 시 상세 페이지 이동
	$(".mbdLink").on("click", function(){
    let matchingPrivate = $(this).closest("tr").find("input[name='matchingPrivate']").val();
    let boardNumber = $(this).closest("tr").attr("data-num");
    let writerId = $(this).closest("tr").find(".writerId").text();
    let userId = $(".userId").text();

    if (matchingPrivate === 'N' || userId === writerId) {
        $(this).attr("href", "/matching/boardDetail?matchingNo=" + boardNumber);
    } else {
        $(this).attr("href", "/matching/boardDetail?matchingNo=" + boardNumber);
    }
});
});




