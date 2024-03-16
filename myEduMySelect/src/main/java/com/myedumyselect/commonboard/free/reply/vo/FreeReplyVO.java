package com.myedumyselect.commonboard.free.reply.vo;

import lombok.Data;

@Data
public class FreeReplyVO {
	private int common_comment_no 					=0;		// 댓글번호
	private int common_no 						 	=0;		//게시판 번호
	private String personal_id						="";	// 개인회원ID
	private String common_comment_content			="";	// 댓글 내용
	private String common_comment_date				="";	// 댓글 작성일
}
