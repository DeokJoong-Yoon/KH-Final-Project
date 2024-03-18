package com.myedumyselect.admin.board.matching.service;

import java.util.List;

import com.myedumyselect.matching.board.vo.MatchingBoardVO;

public interface MatchingBoardAdminService {

	public List<MatchingBoardVO> boardList(MatchingBoardVO matchingBoardVO);

	public int boardListCnt(MatchingBoardVO matchingBoardVO);

	public MatchingBoardVO boardDetail(MatchingBoardVO matchingBoardVO);

	public int boardDelete(MatchingBoardVO matchingBoardVO);

}
