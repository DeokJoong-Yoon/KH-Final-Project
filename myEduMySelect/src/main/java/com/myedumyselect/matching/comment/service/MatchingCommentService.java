package com.myedumyselect.matching.comment.service;

import java.util.List;

import com.myedumyselect.matching.comment.vo.MatchingCommentVO;

public interface MatchingCommentService {

	public List<MatchingCommentVO> mCommentList(MatchingCommentVO mcVO);
	
	public int mCommentInsert(MatchingCommentVO mcVO);
	
	public int mCommentDelete(MatchingCommentVO mcVO);
}
