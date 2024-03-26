package com.myedumyselect.admin.board.matching.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.admin.board.free.reply.dao.MatchingReplyAdminDAO;
import com.myedumyselect.admin.board.matching.reply.vo.MatchingReplyAdminVO;

@Service
public class MatchingReplyAdminServiceImpl implements MatchingReplyAdminService {

	@Autowired
	private MatchingReplyAdminDAO matchingReplyAdminDAO;

	@Override
	public List<MatchingReplyAdminVO> commentList(MatchingReplyAdminVO matchingReplyAdminVO) {
		List<MatchingReplyAdminVO> list = null;
		list = matchingReplyAdminDAO.commentList(matchingReplyAdminVO);
		return list;
	}

	@Override
	public int commentListCnt(MatchingReplyAdminVO matchingReplyAdminVO) {
		return matchingReplyAdminDAO.commentListCnt(matchingReplyAdminVO);
	}

	@Override
	public int commentDelete(MatchingReplyAdminVO matchingReplyAdminVO) {
		int result = 0;
		result = matchingReplyAdminDAO.commentDelete(matchingReplyAdminVO);
		return result;

	}

}
