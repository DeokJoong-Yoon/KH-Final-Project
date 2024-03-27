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
	
	// 해당 학원회원이 작성한 댓글이 달린 매칭게시판 게시글 리스트 가져오기
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
	
	// 해당 학원회원이 작성한 댓글이 달린 매칭게시판 게시글 번호 가져오기
	@Override
	public List<Integer> getCommentMatchingNos(AcademyLoginVO academyLoginVO) {
		return academyMatchingBoardDAO.getCommentMatchingNos(academyLoginVO);
	}
	
	// 게시글 번호에 해당하는 매칭게시판 게시글 리스트 가져오기
	@Override
	public MatchingBoardVO getMatchingBoardByNo(int matchingNo) {
		return academyMatchingBoardDAO.getMatchingBoardByNo(matchingNo);
	}
	
	// 매칭게시판 게시글 목록 가져오기 
	@Override
	public List<MatchingBoardVO> boardList(MatchingBoardVO matchingBoardVO) {
		return academyMatchingBoardDAO.boardList(matchingBoardVO);
	}
	
	// 전체 레코드 수 반환
	@Override
	public int boardListCnt(MatchingBoardVO matchingBoardVO) {
		return academyMatchingBoardDAO.boardListCnt(matchingBoardVO);
	}

}