$(function(){
	
	//제목 클릭 시 상세 페이지 이동
	$(".mbdLink").on("click", function(){
		let boardNumber = $(this).parents("tr").attr("data-num");
		$(this).attr("href", "/matching/boardDetail?matchingNo=" + boardNumber)
	})
	
	//페이징 처리 이벤트
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
		$("#f_search").attr({
			"method":"get",
			"action":"/matching/boardList"
		});
		$("#f_search").submit();
	});
	
})


