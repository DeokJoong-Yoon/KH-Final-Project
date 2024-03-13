package com.myedumyselect.admin.board.matching.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.admin.board.matching.dao.MatchingBoardAdminDAO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

@Service
public class MatchingBoardAdminServiceImpl implements MatchingBoardAdminService {
	
	@Autowired
	private MatchingBoardAdminDAO matchingBoardAdminDAO;

	@Override
	public List<MatchingBoardVO> boardList(MatchingBoardVO matchingBoardVO) {
		return matchingBoardAdminDAO.boardList(matchingBoardVO);
	}

}
