package com.myedumyselect.academy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.academy.dao.AcademyMatchingCommentDAO;
import com.myedumyselect.matching.comment.vo.MatchingCommentVO;

import lombok.Setter;
@Service
public class AcademyMatchingCommentServiceImpl implements AcademyMatchingCommentService {
	
	@Setter(onMethod_ = @Autowired)
	public AcademyMatchingCommentDAO academyMatchingCommentDAO;
	
	//댓글 조회
	@Override
	public List<MatchingCommentVO> CommentList(MatchingCommentVO matchingCommentVO) {
		List<MatchingCommentVO> list = academyMatchingCommentDAO.CommentList(matchingCommentVO);
		return list;
	}
	
	//댓글 입력
	@Override
	public int CommentInsert(MatchingCommentVO matchingCommentVO) {
		int result = 0;
		result = academyMatchingCommentDAO.CommentInsert(matchingCommentVO);
		return result;
	}
	
	//댓글 삭제
	@Override
	public int CommentDelete(MatchingCommentVO matchingCommentVO) {
		int result = 0;
		result = academyMatchingCommentDAO.CommentDelete(matchingCommentVO);
		return result;
	}
	
	//댓글 수정
	public int CommentUpdate(MatchingCommentVO matchingCommentVO) {
		int result = 0;
		result = academyMatchingCommentDAO.CommentUpdate(matchingCommentVO);
		return result;
	}

}
