package com.myedumyselect.matching.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.academy.vo.AcademyLoginVo;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

@Mapper
public interface MatchingBoardDAO {
	
	//매칭게시판 미리 보기
	public List<MatchingBoardVO> mBoardListPreview(MatchingBoardVO mbvo);

	//맞춤형 검색 결과 보기
	public List<AcademyLoginVo> mResult(MatchingBoardVO mbVO);

	//공개매칭 자동등록
	public int publicUpload(MatchingBoardVO mbVO);
	
	//비공개매칭 자동등록
	public int privateUpload(MatchingBoardVO mbVO);

	
}
