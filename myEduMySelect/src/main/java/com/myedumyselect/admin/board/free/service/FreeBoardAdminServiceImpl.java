package com.myedumyselect.admin.board.free.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.admin.board.free.dao.FreeBoardDAO;
import com.myedumyselect.admin.board.free.vo.FreeBoardAdminVO;

import lombok.Setter;

@Service
public class FreeBoardAdminServiceImpl implements FreeBoardAdminService {

	@Setter(onMethod_ = @Autowired)
	private FreeBoardDAO freeBoardDAO;

	@Override
	public List<FreeBoardAdminVO> boardList(FreeBoardAdminVO freeBoardAdminVO) {
		List<FreeBoardAdminVO> list = null;
		list = freeBoardDAO.boardList(freeBoardAdminVO);
		return list;
	}

}
