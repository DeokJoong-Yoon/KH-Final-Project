package com.myedumyselect.admin.board.free.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.admin.board.free.reply.vo.FreeReplyAdminVO;

@Mapper
public interface  FreeReplyAdminDAO {

	public List<FreeReplyAdminVO> commentList(FreeReplyAdminVO freeReplyAdminVO);

	public int commentListCnt(FreeReplyAdminVO freeReplyAdminVO);

	public int commentDelete(FreeReplyAdminVO freeReplyAdminVO);
}
