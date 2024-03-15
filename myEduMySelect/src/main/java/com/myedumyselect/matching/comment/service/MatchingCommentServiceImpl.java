package com.myedumyselect.matching.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.matching.comment.dao.MatchingCommentDAO;
import com.myedumyselect.matching.comment.vo.MatchingCommentVO;

@Service
public class MatchingCommentServiceImpl implements MatchingCommentService {
	
	@Autowired
	private MatchingCommentDAO mcDAO;
	
	//댓글 조회
	@Override
	public List<MatchingCommentVO> mCommentList(MatchingCommentVO mcVO) {
		List<MatchingCommentVO> list = mcDAO.mCommentList(mcVO);
		return list;
	}
	
	
	//댓글 입력
	@Override
	public int mCommentInsert(MatchingCommentVO mcVO) {
		int result = 0;
		result = mcDAO.mCommentInsert(mcVO);
		return result;
	}
	
	
	//댓글 조회
	@Override
	public int mCommentDelete(MatchingCommentVO mcVO) {
		int result = 0;
		result = mcDAO.mCommentDelete(mcVO);
		return result;
	}
}
