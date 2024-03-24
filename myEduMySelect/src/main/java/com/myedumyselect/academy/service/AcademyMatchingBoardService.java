package com.myedumyselect.academy.service;

import java.util.List;

import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

public interface AcademyMatchingBoardService {
    
    // 내가 댓글 단 게시물 목록 불러오기 
    //(각각의 작업이 아닌 하나의 작업이기 때문에 두 개의 쿼리를 하나의 메소드 안에서 실행)
    public List<MatchingBoardVO> getCommented(AcademyLoginVO academyLoginVO);
    
    // 해당 댓글이 달린 게시글 조회
    public MatchingBoardVO getMatchingBoardByNo(int matchingNo);
    
    // 추가 메서드
    public List<Integer> getCommentMatchingNos(AcademyLoginVO academyLoginVO);
}
