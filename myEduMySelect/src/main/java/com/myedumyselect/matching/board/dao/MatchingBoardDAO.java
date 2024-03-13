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
	
	//
	//비공개매칭 시 이메일로 전송할 게시글 번호 검색 
	public MatchingBoardVO getMatchingNo(MatchingBoardVO mbVO);
	
	//매칭게시판 전체 보기
	public List<MatchingBoardVO> mBoardList(MatchingBoardVO mbVO);
	
	//매칭게시판 게시글 상세 보기
	public MatchingBoardVO mBoardDetail(MatchingBoardVO mbVO);

	//전체 레코드 수 반환
	public int mBoardListCnt(MatchingBoardVO mbVO);
	
	//매칭게시판 게시글 수정하기
	public int mBoardUpdate(MatchingBoardVO mbVO);
	
	//매칭게시판 게시글 삭제하기
	
	//매칭게시판 다음글 이동하기
	
	//매칭게시판 이전글 이동하기
	//public 
	

	
}
