package com.myedumyselect.personal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.matching.board.vo.MatchingBoardVO;

@Mapper 
public interface PersonalMatchingBoardDAO {

	public List<MatchingBoardVO> boardList(MatchingBoardVO matchingBoardVO);

	public int boardListCnt(MatchingBoardVO matchingBoardVO);


   
}
