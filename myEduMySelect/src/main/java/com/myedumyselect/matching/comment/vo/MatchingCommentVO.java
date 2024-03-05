package com.myedumyselect.matching.comment.vo;

import lombok.Data;

@Data
public class MatchingCommentVO {
	
	private int matchingNo = 0;
	private int matchingCommentNo = 0;
	private String academyId = "";
	private String matchingCommentNickname = "";
	private String matchingCommentContent = "";
	private String matchingCommentDate;

}
