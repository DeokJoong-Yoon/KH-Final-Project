package com.myedumyselect.academy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.matching.comment.vo.MatchingCommentVO;

@Mapper
public interface AcademyMatchingCommentDAO {
	 
	//댓글 목록 조회
	public List<MatchingCommentVO> CommentList(MatchingCommentVO matchingCommentVO);
	
	//댓글 입력
	public int CommentInsert(MatchingCommentVO matchingCommentVO);
	
	//댓글 삭제
	public int CommentDelete(MatchingCommentVO matchingCommentVO);
	
	//댓글 수정
	public int CommentUpdate(MatchingCommentVO matchingCommentVO);
	
}
