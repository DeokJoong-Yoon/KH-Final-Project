package com.myedumyselect.admin.board.free.service;

import java.util.List;

import com.myedumyselect.admin.board.free.vo.FreeBoardAdminVO;

public interface FreeBoardAdminService {

	public List<FreeBoardAdminVO> boardList(FreeBoardAdminVO freeBoardAdminVO);

	public int boardListCnt(FreeBoardAdminVO freeBoardAdminVO);

	public FreeBoardAdminVO boardDetail(FreeBoardAdminVO freeBoardAdminVO);

	public int boardDelete(FreeBoardAdminVO freeBoardAdminVO);

}
