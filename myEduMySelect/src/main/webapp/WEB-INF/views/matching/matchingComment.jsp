<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>		
<%@ include file="/WEB-INF/views/common/common.jspf" %>						
<!DOCTYPE html>
<html lang="kr">

<link href="/resources/include/assets/css/style.css" rel="stylesheet">
<link href="/resources/include/matching/css/matchingDetail.css" rel="stylesheet">




<body>
	<div class="container">
		<h4>댓글</h4><hr/><br/>

		<%-- 댓글 입력 화면 --%>
		<form id="mcForm" name="mcForm">
			<div class="mcComment">
				<input type="text" name="matchingCommentNickname" id="matchingCommentNickname" value=${userName } disabled/>
				<br>
				<textarea name="matchingCommentContent" id="matchingCommentContent" placeholder="댓글을 입력하세요"></textarea>
				<button type="button" id="mcBtn">등록</button>
			</div>
		</form>
		<hr><br>
		
		
		<%-- 댓글 리스트 출력 영역 --%>
		<div id="mcList">
			<div class="list" id="item-template">
				<h5 class="mcName"></h5>
				<p class="mcDate"></p>
				<p class="mcContent"></p>
				<div class="commentBtns">
					<button type="button" id="commentDeleteBtn">삭제</button>
					<button type="button" id="commentUpdateBtn">수정</button>
				</div>
			<hr/>
			</div>
		</div>
		
	</div>
	
	<script src="/resources/include/js/common.js"></script>
	
	<script>
	
		//새로운 댓글을 화면에 추가하기 위한 함수
		function template(matchingCommentNo, matchingCommentNickname, matchingCommentContent, matchingCommentDate) {
			let $div = $("#mcList");
			
			let $element = $("#item-template").clone().removeAttr("id");
			$element.attr("data-num", matchingCommentNo);
			$element.addClass("comment");
			$element.find(".mcName").html(matchingCommentNickname);
			$element.find(".mcContent").html(matchingCommentContent);
			$element.find(".mcDate").html(matchingCommentDate);
			
			$div.append($element);
			
		}
	
	
		//댓글 목록을 보여주는 함수
		function listAll(matchingNo) {
			
			$(".comment").detach();
			let url = "/matchingcomments/all/" + matchingNo;
			
			$.getJSON(url, function(data) {
				
				$(data).each(function(index) {
					let matchingCommentNo = this.matchingCommentNo;
					let matchingCommentNickname = this.matchingCommentNickname;
					let matchingCommentContent = this.matchingCommentContent;
					let matchingCommentDate = this.matchingCommentDate;
					matchingCommentContent = matchingCommentContent.replace(/(\r\n|\r\n)/g, "<br/>");
					
					console.log(matchingCommentDate);
					
					template(matchingCommentNo, matchingCommentNickname, matchingCommentContent, matchingCommentDate);
					
				});
			}).fail(function() {
				alert("댓글 목록을 불러오는 데 실패했습니다. 잠시 후에 다시 실행해 주세요.")
			})
		}
		
		
		//입력 폼 초기화 함수
		function dataReset() {
			$("#mcForm").each(function() {
				this.reset();
			});
		}	
		
		
		//댓글 삭제 함수
		function deleteComment(matchingNo, matchingCommentNo) {
			if(confirm("선택한 댓글을 삭제하시겠습니까?")) {
				$.ajax({
					url : '/matchingcomments/' + matchingCommentNo,
					type : 'delete',
					headers : { "X-HTTP-Method-Override" : "DELETE" },
					dataType : 'text',
					error : function(xhr, textStatus, errorThrown) {
						alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
					},
					success : function(result) {
						console.log("result : " + result);
						if(result == "SUCCESS") {
							alert("댓글 삭제가 완료되었습니다.");
							listAll(matchingNo);
						}
					}
				})
			}
		}
		
		
		//댓글 수정 함수
		function updateComment(matchingNo, matchingCommentNo) {
			$.ajax({
				url: '/matchingcomments/' + matchingCommentNo,
				type : 'put',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT" 
				},
				data: JSON.stringify({
					matchingCommentContent: $("#updateCommentForm").val(),
				}), 
				dataType: 'text',
				error: function(xhr, textStatus, errorThrown) {
					alert(textStatus + " ( HTTP-" + xhr.status + " / " + errorThrown + ")");
					console.log($("#updateCommentForm").val())
				},
				beforeSend : function(){
					if(!chkData("#updateCommentForm", "댓글 내용을")) return false;
				}, 
				success: function(result) {
					console.log("result : " + result);
					if(result == "SUCCESS") {
						alert("댓글 수정이 완료되었습니다.");
						console.log($("#updateCommentForm").val())
						dataReset();
						listAll(matchingNo);
					}
				}
			})
		} 
		
		
		 
		
		
		//로딩 시 실행
		$(function() {
			
			//댓글 목록 출력
			let matchingNo = ${detail.matchingNo};
			listAll(matchingNo);
			
			
			//댓글 등록 처리
			$(document).on("click", "#mcBtn", function(){
				
				let value = {
					academyId : "${userId }",
					matchingCommentNickname : "${userName }",
					matchingNo : matchingNo,
					matchingCommentContent : $("#matchingCommentContent").val(),
				};
				
				$.ajax({
					url : "/matchingcomments/commentInsert",
					type : "post",
					headers : {"Content-Type" : "application/json"},
					dataType : "text",
					data : JSON.stringify(value),
					error : function(xhr, textStatus, errorThrown) {
						alert(textStatus + " ( HTTP-" + xhr.status + " / " + errorThrown + ")");
					},
					beforeSend : function(){
						if(!chkData("#matchingCommentContent", "댓글 내용을")) return false;
					}, 
					success : function(result) {
						if (result == "SUCCESS") {
							alert("댓글 등록이 완료되었습니다.");
							dataReset();
							listAll(matchingNo);
						}
					}
				})
				
			})
			
			
			//댓글 삭제 처리
			$(document).on("click", "#commentDeleteBtn", function(){
				console.log("삭제 버튼 클릭");
				let matchingCommentNo = $(this).parents("div.list").attr("data-num");
				deleteComment(matchingNo, matchingCommentNo);
				console.log(matchingCommentNo);
			})
			
			
			//원 댓글 내용 담을 변수
			var original; 
			
			//댓글 수정 버튼 클릭 시
			$(document).on("click", "#commentUpdateBtn", function(){
				console.log("수정 버튼 클릭");
				
				//댓글 리스트와, 리스트 내 각 댓글 가져오기
				let list = $(this).parents("div.list");
				let matchingCommentNo = list.attr("data-num");
				
				//댓글 부분을 폼으로 바꾸기
				let paragraph = list.find(".mcContent");			// <p> 요소 가져오기
				original = paragraph.text();
                let textarea = $("<textarea id='updateCommentForm'>");		// <textarea> 요소 생성
                textarea.val(paragraph.text());						// <p> 요소의 텍스트 내용을 <textarea>의 값으로 설정
                paragraph.replaceWith(textarea);					// <p> 요소를 <textarea>로 교체
				
                //수정,삭제 버튼을 취소,완료 버튼으로 번경
    	    	let updateBtn = list.find("#commentUpdateBtn");
    	    	let resetBtn = $("<button type='button' id='commentResetBtn'>되돌리기</button>")
    	    	updateBtn.replaceWith(resetBtn);
    	    	
    	    	let deleteBtn = list.find("#commentDeleteBtn");
    	    	let completeBtn = $("<button type='button' id='commentCompleteBtn'>완료</button>")
    	    	deleteBtn.replaceWith(completeBtn);
			})
			
			
			//댓글 수정 시 완료 버튼 클릭시
			$(document).on("click", "#commentCompleteBtn", function(){
				console.log("수정 완료 버튼 클릭");
				let matchingCommentNo = $(this).parents("div.list").attr("data-num");
				updateComment(matchingNo, matchingCommentNo);
				//console.log(matchingCommentNo);
				//console.log(matchingNo);
			})
			
			
			
			//댓글 수정 시 수정 취소 버튼 처리
			$(document).on("click", "#commentResetBtn", function(){
				console.log("수정 취소 버튼 클릭");
				let matchingCommentNo = $(this).parents("div.list").attr("data-num");
				$("#updateCommentForm").val(original);
			}) 

			
			
		})
	</script>
	
	
	
</body>