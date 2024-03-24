package com.myedumyselect.personal.service;

import java.util.List;

import com.myedumyselect.matching.board.vo.MatchingBoardVO;

public interface PersonalMatchingBoardService {

	public List<MatchingBoardVO> boardList(MatchingBoardVO matchingBoardVO);

	public int boardListCnt(MatchingBoardVO matchingBoardVO);

}
 