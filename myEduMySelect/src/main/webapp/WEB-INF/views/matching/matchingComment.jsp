<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>		
<%@ include file="/WEB-INF/views/common/common.jspf" %>						
<!DOCTYPE html>
<html lang="kr">

<body>
	<div>
		<h5>댓글</h5>

		<%-- 댓글 입력 화면 --%>
		<form id="mcForm" name="mcForm">
			<table>
				<tr>
					<td>
						<input type="text" name="matchingCommentNickname" id="matchingCommentNickname" value=${userName } disabled/>
					</td>
					<td>
						<button type="button" id="mcBtn">등록</button>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="matchingCommentContent" id="matchingCommentContent" placeholder="댓글을 입력하세요"></textarea>
					</td>
			</table>
		</form>
		
		
		<%-- 댓글 리스트 출력 영역 --%>
		<div id="mcList">
			<table class="list" id="item-template">
				<tr><td class="mcName"></td></tr>
				<tr><td class="mcContent"></td></tr>
				<tr><td class="mcDate"></td></tr>
				<tr><td><button type="button" id="mcDeleteBtn">삭제</button></td></tr>
			</table>
		</div>
		
	</div>
	
	
	
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
		
		
		//로딩 시 실행
		$(function() {
			
			//댓글 목록 출력
			let matchingNo = ${detail.matchingNo};
			listAll(matchingNo);
			
			
			//댓글 등록 위한 ajax 연동 처리
			$(document).on("click", "#mcBtn", function(){
				
				let value = {
					academyId : "${userId }",
					matchingCommentNickname : "${userName }",
					matchingNo : matchingNo,
					matchingCommentContent : $("#matchingCommentContent").val()
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
					beforeSend : function() {
						if(!checkForm("#matchingCommentContent", "댓글 내용을"))
							return false;
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
			
			
			//댓글 삭제
			$(document).on("click", "#mcDeleteBtn", function(){
				console.log("삭제 버튼 클릭");
				let matchingCommentNo = $(this).parents("table.list").attr("data-num");
				deleteComment(matchingNo, matchingCommentNo);
				console.log(matchingCommentNo);
			})

			
			
		})
	</script>
	
</body>