package com.myedumyselect.matching.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.matching.comment.vo.MatchingCommentVO;

@Mapper
public interface MatchingCommentDAO {
	public List<MatchingCommentVO> mCommentList(MatchingCommentVO mcVO);
}
