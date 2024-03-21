package com.myedumyselect.admin.board.matching.reply.service;

import java.util.List;

import com.myedumyselect.admin.board.matching.reply.vo.MatchingReplyAdminVO;

public interface MatchingReplyAdminService {

	public List<MatchingReplyAdminVO> commentList(MatchingReplyAdminVO matchingReplyAdminVO);

	public int commentListCnt(MatchingReplyAdminVO matchingReplyAdminVO);

	public int commentDelete(MatchingReplyAdminVO matchingReplyAdminVO);

}
