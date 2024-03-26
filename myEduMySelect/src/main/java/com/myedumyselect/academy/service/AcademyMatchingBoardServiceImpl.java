package com.myedumyselect.academy.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.myedumyselect.academy.dao.AcademyMatchingBoardDAO;
import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

@Service
public class AcademyMatchingBoardServiceImpl implements AcademyMatchingBoardService {

	@Autowired
	private AcademyMatchingBoardDAO academyMatchingBoardDAO;

	@Override
	public List<MatchingBoardVO> getCommented(AcademyLoginVO academyLoginVO) {
		List<Integer> commentedNos = academyMatchingBoardDAO.getCommentMatchingNos(academyLoginVO);
		List<MatchingBoardVO> commentedMatching = new ArrayList<>();
		for (Integer matchingNo : commentedNos) {
			MatchingBoardVO matchingVO = academyMatchingBoardDAO.getMatchingBoardByNo(matchingNo);
			commentedMatching.add(matchingVO);
		}
		return commentedMatching;
	}

	@Override
	public List<Integer> getCommentMatchingNos(AcademyLoginVO academyLoginVO) {
		return academyMatchingBoardDAO.getCommentMatchingNos(academyLoginVO);
	}

	@Override
	public MatchingBoardVO getMatchingBoardByNo(int matchingNo) {
		return academyMatchingBoardDAO.getMatchingBoardByNo(matchingNo);
	}

	@Override
	public List<MatchingBoardVO> boardList(MatchingBoardVO matchingBoardVO) {
		return academyMatchingBoardDAO.boardList(matchingBoardVO);
	}

	@Override
	public int boardListCnt(MatchingBoardVO matchingBoardVO) {
		return academyMatchingBoardDAO.boardListCnt(matchingBoardVO);
	}

}