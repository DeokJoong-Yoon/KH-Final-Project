$(function() {
	$(".myPage").on("click", function() {
			$("#myPageForm").attr({
				"method" : "post",
				"action" : "/admin/myPage"
			});
			$("#myPageForm").submit();
		});
});