package com.myedumyselect.matching.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.academy.vo.AcademyLoginVo;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

@Mapper
public interface MatchingBoardDAO {
	
	//매칭게시판 미리 보기
	public List<MatchingBoardVO> mBoardListPreview(MatchingBoardVO mbVO);

	//맞춤형 검색 결과 보기
	public List<AcademyLoginVo> mResult(MatchingBoardVO mbVO);

	//공개매칭 자동등록
	public int publicUpload(MatchingBoardVO mbVO);
	
	//비공개매칭 자동등록
	public int privateUpload(MatchingBoardVO mbVO);
	
	//비공개매칭 시 이메일 검색
	public List<AcademyLoginVo> searchEmail(MatchingBoardVO mbVO);
	
	//매칭게시판 전체 보기
	public List<MatchingBoardVO> mBoardList(MatchingBoardVO mbVO);

	
}
