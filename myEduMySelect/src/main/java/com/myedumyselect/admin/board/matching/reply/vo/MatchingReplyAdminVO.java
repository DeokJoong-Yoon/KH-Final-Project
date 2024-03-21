package com.myedumyselect.admin.board.matching.reply.vo;

import com.myedumyselect.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MatchingReplyAdminVO extends CommonVO {
	private int matchingCommentNo = 0;
	private String academyId = "";
	private String matchingCommentNickname = "";
	private String matchingCommentContent = "";
	private String matchingCommentDate = "";
}
