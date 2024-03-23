package com.myedumyselect.personal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.matching.board.vo.MatchingBoardVO;
import com.myedumyselect.personal.dao.PersonalMatchingBoardDAO;

import lombok.Setter;

@Service
public class PersonalMatchingBoardServiceImpl implements PersonalMatchingBoardService {

	@Setter(onMethod_ = @Autowired)
	PersonalMatchingBoardDAO personalMatchingBoardDAO;

	@Override
	public List<MatchingBoardVO> boardList(MatchingBoardVO matchingBoardVO) {
		return personalMatchingBoardDAO.boardList(matchingBoardVO);
	}

	@Override
	public int boardListCnt(MatchingBoardVO matchingBoardVO) {
		return personalMatchingBoardDAO.boardListCnt(matchingBoardVO);
	}

	@Override
	public MatchingBoardVO boardDetail(MatchingBoardVO matchingBoardVO) {
		MatchingBoardVO detail = personalMatchingBoardDAO.boardDetail(matchingBoardVO);
		return detail;
	}

}
