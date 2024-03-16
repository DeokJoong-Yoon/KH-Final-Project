let buttonCheck = 0;

$(function(){
	 $("#freeUpdateBtn").on("click", function(){
        if(!chkData("#common_title","글제목을")) return;
        else if(!chkData("#common_content","글내용을"))return;
        else {
            $("#f_updateForm").attr({
                "method":"post",
                "action":"/free/freeUpdate"
            });
            $("#f_updateForm").submit();
        }
    });    
	
	$("#freeCancelBtn").on("click", function(){
		$("#f_updateForm").each(function(){
			this.reset();
		});
	});
	
	$("#freeListBtn").click(function(){
		location.href="/free/freeList";
	});	
});

function getParameterByName(name, url = window.location.href) {
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}