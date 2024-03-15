$(function() {
	tinymce.init({
		selector : '.tinymce-editor'
	});
	
	/* 수정 버튼 클릭 시 처리 이벤트 */
	$("#boardUpdateBtn").on("click", function() {
		// 입력값 체크
		var content = tinymce.get('commonContent').getContent();
		if (!chkData("#commonTitle", "글제목을 ")) return;
		else if (!content.trim()) {
			alert("글 내용을 입력하세요.");
			return;
		}
		else {
			if($("#commonFile").val() != "") {
				if (!chkFile($("#commonFile"))) return;
			}
			$("#f_updateForm").attr({
				"method" : "post",
				"enctype" : "multipart/form-data",
				"action" : "/adminBoard/boardUpdate"
			});
			$("#f_updateForm").submit();
		}
	});
	
	/** 목록 버튼 클릭 시 처리 이벤트 */
	$("#boardListBtn").on("click", function() {
		location.href="/adminBoard/notice"
	});
	

	
});