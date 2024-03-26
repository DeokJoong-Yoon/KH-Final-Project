package com.myedumyselect.academy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

@Mapper
public interface AcademyMatchingBoardDAO {
    
    // 작성한 댓글 조회
    public List<Integer> getCommentMatchingNos(AcademyLoginVO academyLoginVO);
    
    // 해당 댓글이 달린 게시글 조회
    public MatchingBoardVO getMatchingBoardByNo(int matchingNo);
    
    // 내가 댓글 단 게시물 목록 불러오기
    public List<MatchingBoardVO> getCommented(AcademyLoginVO academyLoginVO);
    public List<MatchingBoardVO> boardList(MatchingBoardVO matchingBoardVO);
    public int boardListCnt(MatchingBoardVO matchingBoardVO);
}