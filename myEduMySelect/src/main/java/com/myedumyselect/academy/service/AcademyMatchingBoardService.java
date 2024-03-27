package com.myedumyselect.academy.service;

import java.util.List;

import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

public interface AcademyMatchingBoardService {
    
    // 내가 댓글 단 게시물 목록 불러오기 (각각의 작업이 아닌 하나의 작업이기 때문에 두 개의 쿼리를 하나의 메소드 안에서 실행)
    public List<MatchingBoardVO> getCommented(AcademyLoginVO academyLoginVO);
    
    // 해당 학원회원의 댓글이 달린 게시글 조회
    public MatchingBoardVO getMatchingBoardByNo(int matchingNo);
    
    // 해당 학원회원이 작성한 댓글이 달린 매칭게시판 게시글 번호 가져오기
    public List<Integer> getCommentMatchingNos(AcademyLoginVO academyLoginVO);
    
    // 매칭게시판 전체보기
    public List<MatchingBoardVO> boardList(MatchingBoardVO matchingBoardVO);
    
    // 전체 레코드 수 반환
    public int boardListCnt(MatchingBoardVO matchingBoardVO);
}