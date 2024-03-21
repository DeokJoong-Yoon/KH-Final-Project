package com.myedumyselect.commonboard.free.reply.vo;

import lombok.Data;

@Data
public class FreeReplyVO {
	private int commonCommentNo 					=0;		// 댓글번호
	private int commonNo 						 	=0;		//게시판 번호
	private String personalId						="";	// 개인회원ID
	private String commonCommentContent			="";	// 댓글 내용
	private String commonCommentDate				="";	// 댓글 작성일
	private int freereplyTotal						=0;
	
	
}
