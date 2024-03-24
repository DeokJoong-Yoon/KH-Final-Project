
    $(function() {	  
	/* 페이징 처리 이벤트 */
		$(".page-item a").on("click", function(e) {
		e.preventDefault();
		$("#freeForm").find("input[name='pageNum']").val($(this).attr("href"));
			$("#freeForm").attr({
				"method" : "get",
				"action" : "/personalFreeView"
			});
			$("#freeForm").submit();
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
