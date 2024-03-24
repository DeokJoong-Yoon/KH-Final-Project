package com.myedumyselect.academy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.academy.dao.AcademyMatchingBoardDAO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AcademyMatchingBoardServiceImpl implements AcademyMatchingBoardService {
	
	@Setter(onMethod_ = @Autowired)
	AcademyMatchingBoardDAO academyMatchingBoardDAO;
	
	//매칭게시판 미리보기
	@Override
	public List<MatchingBoardVO> boardList(MatchingBoardVO matchingBoardVO) {
		return academyMatchingBoardDAO.boardList(matchingBoardVO);
		
	}
  
	//전체 레코드 수 반환
	@Override
	public int boardListCnt(MatchingBoardVO matchingBoardVO) {
		return academyMatchingBoardDAO.boardListCnt(matchingBoardVO);
	}
	
}
