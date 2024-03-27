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

	@Override
	public int boardListCnt(FreeBoardAdminVO freeBoardAdminVO) {
		return freeBoardDAO.boardListCnt(freeBoardAdminVO);
	}

	@Override
	public FreeBoardAdminVO boardDetail(FreeBoardAdminVO freeBoardAdminVO) {
		FreeBoardAdminVO detail = freeBoardDAO.boardDetail(freeBoardAdminVO);
		if(detail!=null) {
			detail.setCommonContent(detail.getCommonContent().replaceAll("\n", "<br />"));
		}
		return detail;
	}

	@Override
	public int boardDelete(FreeBoardAdminVO freeBoardAdminVO) {
		int result = 0;
		result = freeBoardDAO.boardDelete(freeBoardAdminVO);
		return result;
	}

}
