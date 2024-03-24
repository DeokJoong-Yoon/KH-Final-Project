package com.myedumyselect.academy.service;

import java.util.List;

import com.myedumyselect.matching.comment.vo.MatchingCommentVO;

public interface AcademyMatchingCommentService {
	
	public List<MatchingCommentVO> CommentList(MatchingCommentVO matchingCommentVO);
	
	public int CommentInsert(MatchingCommentVO matchingCommentVO);
	
	public int CommentDelete(MatchingCommentVO matchingCommentVO);
	
	public int CommentUpdate(MatchingCommentVO matchingCommentVO);
}
 