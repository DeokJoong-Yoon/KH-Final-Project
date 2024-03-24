package com.myedumyselect.academy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

@Mapper
public interface AcademyMatchingBoardDAO {
	
	//매칭게시판 미리 보기 
	public List<MatchingBoardVO> boardList(MatchingBoardVO matchingBoardVO);
	
	//전체 레코드 수 반환
	public int boardListCnt(MatchingBoardVO matchingBoardVO);
	
}
