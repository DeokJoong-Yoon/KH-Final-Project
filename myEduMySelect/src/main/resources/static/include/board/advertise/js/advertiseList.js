	const gallery = document.getElementById('gallery');

	thumbnailsData.forEach(data => {
	    const thumbnailDiv = document.createElement('div');
	    thumbnailDiv.className = 'thumbnail';
	    
	    thumbnailDiv.innerHTML = `
	        <a href="${data.pageUrl}">
	            <img src="${data.imageUrl}" alt="${data.name}">
	            <div class="info">
	                <p>${data.name}</p>
	                <p>전화번호: ${data.phone}</p>
	                <p>주소: ${data.address}</p>
	            </div>
	        </a>
	    `;
	    
	    gallery.appendChild(thumbnailDiv);
	});

	$(function(){
	$(".goDetail").on("click", function(){
		/*let common_no = $(this).parents("tr").attr("data-num");
		$("#common_no").val(common_no);
		console.log("글번호 : "+common_no);
		location.href="/advertise/advertiseDetail?common_no="+common_no;*/
		let common_no = $(this).parents("tr").attr("data-num");
		$("#common_no").val(common_no);
		
		$("#detailForm").attr({
			"method":"get",
			"action":"/advertise/advertiseDetail"
		});
		$("#detailForm").submit();
	});
	
	
	$("#advertiseInsertBtn").on("click", () => {
		location.href="/advertise/advertiseInsertForm";
	});
	
	
	
	$("#keyword").bind("keydown", function(event){
		if(event.keyCode == 13){
			event.preventDefault();
		}
	});
	
	$("#search").on("change", function(){
	    if($("#search").val() == "all"){
	        $("#keyword").val("전체 목록을 조회합니다.");
	    }else {
	        $("#keyword").val("");
	        $("#keyword").focus();
	    }
	});

	
	$("#searchData").on("click", function(){
		if($("#advertiseSearch").val()!="all"){	
			if(!chkData("#keyword","검색어를")) return;
		}
	/*	$("#pageNum").val(1);	// 페이지 초기화*/
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


function goPage(){
    if($("#search").val() == "all"){
        $("#keyword").val("");
    }
    $("#a_search").attr({
        "method":"get",
        "action":"/advertise/advertiseList"
    });
    $("#a_search").submit();
}