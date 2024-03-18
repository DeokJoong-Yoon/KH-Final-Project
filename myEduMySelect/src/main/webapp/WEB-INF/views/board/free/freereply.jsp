<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>		
<!DOCTYPE html>
<html lang="kr">

<link href="/resources/include/assets/css/style.css" rel="stylesheet">



<body class="commentSection">
	<div class="container"> 
		<%-- 댓글 입력 화면 --%>
		<!-- <div>
			<form id="freereplyForm" name="freereplyForm">
				<div class="row mb-3">
					<label for="personalId" class="col-sm-1 col-form-label">작성자</label>
					<div class="col-sm-3">
						<input type="text" name="personalId" id="personalId" maxlength="6" class="form-control" />
					</div>
					<button type="button" id="freereplyInsertBtn" class="btn btn-primary col-sm-1 sendBtn mx-2">저장</button>
				</div>
				<div class="row mb-3">
					<label for="commonCommentContent" class="col-sm-1 col-form-label">댓글내용</label>
					<div class="col-sm-11">
						<textarea name="commonCommentContent" id="commonCommentContent" class="form-control" rows="3"></textarea>
					</div>
				</div>
			</form>
		</div> -->

		<hr><br>
		<h4>댓글</h4>
		<form id="commentSection" name="commentSection">
			<div class="commentForm">
				
				
				<input type="text" name="personalId" id="personalId" value='' disabled/>
				<br>
				<textarea name="commonCommentContent" id="commentContent" placeholder="댓글을 입력하세요"></textarea>
				<button type="button" id="saveComment">등록</button>
			</div>
		</form>

		<%-- 리스트 영역 --%>
		<div id="list">
			<div class="list" id="item-template">
				<h5 class="personalId"></h5>
				<p class="commonCommentContent"></p>
				<p class="commonCommentDate"></p>
				<div class="commentBtns">
					<button type="button" id="freeDeleteBtn">삭제</button>
					<button type="button" id="freeUpdateBtn">수정</button>
				</div>
			<hr/>
			</div>
		</div>

	</div>


	<!-- Template Main JS File -->
	<script src="/resources/include/js/common.js"></script>
	<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
	<script src="/resources/include/assets/js/main.js"></script>
	<script>
	$(function() {
	    /* 기본 덧글 목록 */
	    let commonNo = ${detail.commonNo};
	    console.log("reply : "+ commonNo);
	    listAll(commonNo);
	});

	function listAll(commonNo) { 
	    let url = "/freereplies/all/" + commonNo;
	    
	    $.getJSON(url, function(data) {
	        // 받아온 댓글 데이터를 반복문으로 처리하여 화면에 표시
	        $(data).each(function(index) {
	            let commonCommentNo = this.commonCommentNo;
	            let personalId = this.personalId;
	            let commonCommentContent = this.commonCommentContent;
	            let commonCommentDate = this.commonCommentDate;
	            let freereplyTotal = commonCommentContent.replace(/(\r\n|\r|\n)/g, "<br />");
	            
	            // 화면에 댓글 추가하는 코드
	            let $div = $('#list');
	            let $element = $('#item-template').clone().removeAttr('id');
	            $element.attr("data-num", commonCommentNo);
	            $element.addClass("freereply");
	            $element.find('.card-header .personalId').html(personalId);
	            $element.find('.card-header .commonCommentDate').html(" / " + commonCommentDate);
	            $element.find('.card-body .card-text').html(freereplyTotal);
	            
	            $div.append($element);
	        });
	    }).fail(function() {
	        alert("댓글 목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
	    });
	}

	</script>
</body>
