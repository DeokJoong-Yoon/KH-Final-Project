package com.myedumyselect.admin.board.matching.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.matching.board.vo.MatchingBoardVO;

@Mapper
public interface MatchingBoardAdminDAO {
	public List<MatchingBoardVO> boardList(MatchingBoardVO matchingBoardVO);

	public int boardListCnt(MatchingBoardVO matchingBoardVO);

	public int readCntUpdate(MatchingBoardVO matchingBoardVO);

	public MatchingBoardVO boardDetail(MatchingBoardVO matchingBoardVO);

	public int boardDelete(MatchingBoardVO matchingBoardVO);
}
