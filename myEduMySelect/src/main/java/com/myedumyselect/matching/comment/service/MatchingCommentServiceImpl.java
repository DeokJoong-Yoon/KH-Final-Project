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
	
	@Override
	public List<MatchingCommentVO> mCommentList(MatchingCommentVO mcVO) {
		
		List<MatchingCommentVO> list = mcDAO.mCommentList(mcVO);
		return list;
	}
}
