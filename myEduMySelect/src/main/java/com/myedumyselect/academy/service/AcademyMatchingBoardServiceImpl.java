package com.myedumyselect.academy.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.academy.dao.AcademyMatchingBoardDAO;
import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AcademyMatchingBoardServiceImpl implements AcademyMatchingBoardService {
	
	@Autowired
	AcademyMatchingBoardDAO academyMatchingBoardDAO;

	@Override
	public List<MatchingBoardVO> getCommented(AcademyLoginVO academyLoginVO) {
		
		//내가 댓글 단 게시물 번호들을 담을 List (번호만 담기 때문에 자료형이 Integer인 배열)
		List<Integer> commentedNos = academyMatchingBoardDAO.getCommentMatchingNos(academyLoginVO);
		
		//내가 댓글 단 매칭 게시물들을 담을 MatchingBoardVO 객체 타입의 List 만들기
		List<MatchingBoardVO> commentedMatching = new ArrayList<>();
		
		
		for(Integer matchingNo : commentedNos) {
			MatchingBoardVO matchingVO = academyMatchingBoardDAO.getMatchingBoardByNo(matchingNo);
			commentedMatching.add(matchingVO);
		}
		
		return commentedMatching;
	}
	
	@Override
	public List<Integer> getCommentMatchingNos(AcademyLoginVO academyLoginVO) {
		// TODO Auto-generated method stub
		return academyMatchingBoardDAO.getCommentMatchingNos(academyLoginVO);
	}
	
	
}
