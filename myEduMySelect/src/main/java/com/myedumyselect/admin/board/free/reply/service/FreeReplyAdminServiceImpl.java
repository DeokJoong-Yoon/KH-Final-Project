package com.myedumyselect.admin.board.free.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.admin.board.free.reply.dao.FreeReplyAdminDAO;
import com.myedumyselect.admin.board.free.reply.vo.FreeReplyAdminVO;
import com.myedumyselect.commonboard.free.reply.vo.FreeReplyVO;

import lombok.Setter;

@Service
public class FreeReplyAdminServiceImpl implements FreeReplyAdminService {

	@Setter(onMethod_ = @Autowired)
	FreeReplyAdminDAO freeReplyAdminDAO;

	@Override
	public List<FreeReplyAdminVO> commentList(FreeReplyAdminVO freeReplyAdminVO) {
		List<FreeReplyAdminVO> list = null;
		list = freeReplyAdminDAO.commentList(freeReplyAdminVO);
		return list;
	}

	@Override
	public int commentListCnt(FreeReplyAdminVO freeReplyAdminVO) {
		return freeReplyAdminDAO.commentListCnt(freeReplyAdminVO);
	}

	@Override
	public int commentDelete(FreeReplyAdminVO freeReplyAdminVO) {
		int result = 0;
		result = freeReplyAdminDAO.commentDelete(freeReplyAdminVO);
		return result;

	}

}
