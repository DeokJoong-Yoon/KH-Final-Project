package com.myedumyselect.admin.board.free.reply.vo;

import com.myedumyselect.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class FreeReplyAdminVO extends CommonVO {
	private int commonCommentNo = 0; // 댓글번호
	private int commonNo = 0; // 게시판 번호
	private String personalId = ""; // 개인회원ID
	private String commonCommentContent = ""; // 댓글 내용
	private String commonCommentDate = ""; // 댓글 작성일
	private int freereplyTotal = 0;
}
