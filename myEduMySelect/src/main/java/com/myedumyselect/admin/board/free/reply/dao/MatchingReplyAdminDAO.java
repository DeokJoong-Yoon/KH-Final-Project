package com.myedumyselect.admin.board.free.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.admin.board.matching.reply.vo.MatchingReplyAdminVO;

@Mapper
public interface MatchingReplyAdminDAO {

	public List<MatchingReplyAdminVO> commentList(MatchingReplyAdminVO matchingReplyAdminVO);

	public int commentListCnt(MatchingReplyAdminVO matchingReplyAdminVO);

	public int commentDelete(MatchingReplyAdminVO matchingReplyAdminVO);

}
