<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>		
<!DOCTYPE html>
<html lang="kr">

<link href="/resources/include/assets/css/style.css" rel="stylesheet">



<body class="commentSection">
	<div class="container"> 
		<h4>댓글</h4><hr/><br/>
		
		<%-- 댓글 입력 화면 --%>
		<div>
			<form id="freereplyForm" name="freereplyForm">
				<div class="row mb-3">
					<label for="commonCommentContent" class="col-sm-1 col-form-label">댓글내용</label>
					<div class="col-sm-11">
						<textarea name="commonCommentContent" id="commonCommentContent" rows="3" placeholder="댓글을 입력하세요"></textarea>
						<button type="button" id="freereplyInsertBtn" >저장</button>
					</div>
					
				</div>
			</form>
		</div>
		
		<hr><br>
		
		<%-- 리스트 영역 --%>
		<div id="freereplyList">
			<div class="card mb-2" id="item-template">
			<div class="card-header">
				<h5 class="personalId"></h5>
				<p class="commonCommentDate"></p>
			</div>				
			<div class="card-body">
				<p class="card-text"></p>
				<div class="btnArea">
					<button type="button" id="frDeleteBtn">삭제</button>
					<button type="button" id="frUpdateBtn">수정</button>
				</div>
			</div>
			</div>
		</div>

	</div>


	<!-- Template Main JS File -->
	<script src="/resources/include/js/common.js"></script>
	<script src="/resources/include/board/free/js/freeReply.js"></script>
<script>
    let replyTotal = 0;

    $(function() {
        let commonNo = ${detail.commonNo};
        listAll(commonNo);

        $(document).on("click", "#freereplyInsertBtn", function() {
            let insertUrl = "/freereplies/freereplyInsert";

            let value = JSON.stringify({
                commonNo: commonNo,
                personalId: $("#personalId").val(),
                commonCommentContent: $("#commonCommentContent").val()
            });
            $.ajax({
                url: insertUrl,
                type: "post",
                headers: {
                    "Content-Type": "application/json"
                },
                dataType: "text",
                data: value,
                error: function(xhr, textStatus, errorThrown) {
                    alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
                },
                beforeSend: function() {
                    if (!checkForm("#personalId", "작성자를")) return false;
                    else if (!checkForm("#commonCommentContent", "댓글내용을")) return false;
                },
                success: function(result) {
                    if (result == "SUCCESS") {
                        alert("댓글 등록이 완료되었습니다.");
                        dataReset();
                        listAll(commonNo);
                    }
                }
            });
        });
        
        // 수정 버튼 클릭 이벤트 핸들러 추가
        $(document).on("click", "#frUpdateBtn", function() {
            let commonCommentNo = $(this).parents("div.card").attr("data-num");
            updateForm(commonCommentNo, $(this).parents("div.card"));
        });

        // 삭제 버튼 클릭 이벤트 핸들러 수정
        $(document).on("click", "#frDeleteBtn", function() {
            let commonCommentNo = $(this).parents("div.card").attr("data-num");
            frDeleteBtn(commonNo, commonCommentNo); // commonNo 전달 추가
        });
        

        $(document).on("click", "#upBtn", function() {
            let commonCommentNo = $(this).attr("data-rnum");
            let commonCommentContent = $("#commonCommentContent").val(); // 댓글 내용 받아오기
            $.ajax({
                url: '/freereplies/' + commonCommentNo,
                type: 'put',
                headers: {
                    "Content-Type": "application/json",
                    "X-HTTP-Method-Override": "PUT"
                },
                data: JSON.stringify({
                	commonCommentContent: commonCommentContent, // 받아온 댓글 내용 전달
                }),
                dataType: 'text',
                error: function(xhr, textStatus, errorThrown) {
                    alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
                },
                beforeSend: function() {
                    if (!checkForm("#commonCommentContent", "덧글내용을")) return false;
                },
                success: function(result) {
                    console.log("result: " + result);
                    if (result == "SUCCESS") {
                        alert("댓글 수정이 완료되었습니다.");
                        console.log($("updateForm").val());
                        dataReset();
                        listAll(commonNo);
                    }
                }
            });
        });

    });

    function listAll(commonNo) {
    	
 
    	
        $(".freereply").detach();
        let url = "/freereplies/all/" + commonNo;
        $.getJSON(url, function(data) {
            $(data).each(function(index) {
                let commonCommentNo = this.commonCommentNo;
                let personalId = this.personalId;
                let commonCommentContent = this.commonCommentContent;
                let commonCommentDate = this.commonCommentDate;
                commonCommentContent = commonCommentContent.replace(/(\r\n|\r|\n)/g, "<br />");

                template(commonCommentNo, personalId, commonCommentContent, commonCommentDate);
               
            });
        }).fail(function() {
            alert("댓글 목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
        });
    }

    function template(commonCommentNo, personalId, commonCommentContent, commonCommentDate) {
        let $div = $('#freereplyList');

        let $element = $('#item-template').clone().removeAttr('id');
        $element.attr("data-num", commonCommentNo);
        $element.addClass("freereply");
        $element.find('.card-header .personalId').html(personalId);
        $element.find('.card-header .commonCommentDate').html(" / " + commonCommentDate);
        $element.find('.card-body .card-text').html(commonCommentContent);

        $div.append($element);
    }

    function dataReset() {
        $("#freereplyForm").each(function() {
            this.reset();
        });

        $("#personalId").prop("readonly", false);
        $("#freereplyForm button[type='button']").removeAttr("data-rnum");
        $("#freereplyForm button[type='button']").attr("id", "freereplyInsertBtn");
        $("#freereplyForm button[type='button'].frsendBtn").html("저장");
        $("#freereplyForm button[type='button'].frresetBtn").detach();
    }

    function updateForm(commonCommentNo, card) {
        $("#freereplyForm .frresetBtn").detach();

        $("#personalId").val(card.find(".card-header .personalId").html());
        $("#personalId").prop("readonly", true);

        let commonCommentContent = card.find(".card-text").html();
        commonCommentContent = commonCommentContent.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
        $("#commonCommentContent").val(commonCommentContent);

        $("#freereplyForm button[type='button']").attr("id", "upBtn");
        $("#freereplyForm button[type='button']").attr("data-rnum", commonCommentNo);
        $("#freereplyForm button[type='button']").html("수정");

        let frresetButton = $("<button type='button' class='btn btn-primary col-sm-1 frresetBtn'>");
        frresetButton.html("취소");
        $("#freereplyForm .frsendBtn").after(frresetButton);
    }

    function frDeleteBtn(commonNo, commonCommentNo) {
        if (confirm("선택하신 댓글을 삭제하시겠습니까?")) {
            $.ajax({
                url: '/freereplies/' + commonCommentNo,
                type: 'delete',
                headers: {
                    "X-HTTP-Method-Override": "DELETE"
                },
                dataType: 'text',
                error: function(xhr, textStatus, errorThrown) {
                    alert("댓글 삭제 중 오류가 발생했습니다: " + textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
                },
                success: function(result) {
                    console.log("result: " + result);
                    if (result == 'SUCCESS') {
                        alert("댓글 삭제가 완료되었습니다.");
                        listAll(commonNo);
                    } else {
                        alert("댓글 삭제에 실패했습니다.");
                    }
                }
            });
        }
    };


</script>


</body>
