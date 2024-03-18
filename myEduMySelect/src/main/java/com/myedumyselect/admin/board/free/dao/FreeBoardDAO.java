package com.myedumyselect.admin.board.free.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.admin.board.free.vo.FreeBoardAdminVO;

@Mapper
public interface FreeBoardDAO {

	public List<FreeBoardAdminVO> boardList(FreeBoardAdminVO freeBoardAdminVO);

	public int boardListCnt(FreeBoardAdminVO freeBoardAdminVO);

	public FreeBoardAdminVO boardDetail(FreeBoardAdminVO freeBoardAdminVO);

	public int boardDelete(FreeBoardAdminVO freeBoardAdminVO);

}
