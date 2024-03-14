package com.myedumyselect.matching.comment.vo;

import lombok.Data;

@Data
public class MatchingCommentVO {
	
	private int matchingCommentNo;				//댓글 번호
	private String academyId;					//학원 번호
	private int matchingNo;						//게시글 번호
	private String matchingCommentNickname;		//닉네임(학원명)
	private String matchingCommentContent;		//댓글 내용
	private String matchingCommentDate;			//댓글 작성 일시

}
