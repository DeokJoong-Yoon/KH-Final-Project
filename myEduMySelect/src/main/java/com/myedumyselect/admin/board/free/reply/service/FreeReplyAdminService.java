package com.myedumyselect.admin.board.free.reply.service;

import java.util.List;

import com.myedumyselect.admin.board.free.reply.vo.FreeReplyAdminVO;
import com.myedumyselect.commonboard.free.reply.vo.FreeReplyVO;

public interface FreeReplyAdminService {

	public List<FreeReplyAdminVO> commentList(FreeReplyAdminVO freeReplyAdminVO);

	public int commentListCnt(FreeReplyAdminVO freeReplyAdminVO);

	public int commentDelete(FreeReplyAdminVO freeReplyAdminVO);

}
