package com.myedumyselect.academy.service;

import java.util.List;


import com.myedumyselect.matching.board.vo.MatchingBoardVO;

public interface AcademyMatchingBoardService {
	
	//매칭게시판 미리 보기
	public List<MatchingBoardVO> boardList(MatchingBoardVO matchingBoardVO);

	//전체 레코드 수 반환
	public int boardListCnt(MatchingBoardVO academyMatchingDTO);	
}
 