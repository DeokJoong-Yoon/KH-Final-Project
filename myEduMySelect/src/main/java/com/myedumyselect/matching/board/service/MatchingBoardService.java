package com.myedumyselect.matching.board.service;

import java.util.List;

import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

public interface MatchingBoardService {
	
	//매칭게시판 미리 보기
	public List<MatchingBoardVO> mBoardListPreview(MatchingBoardVO mbVO);

	//맞춤형 검색 결과 보기
	public List<AcademyLoginVO> mResult(MatchingBoardVO mbVO);

	//공개매칭 자동등록
	public int publicUpload(MatchingBoardVO mbVO);
	
	//비공개매칭 자동등록
	public int privateUpload(MatchingBoardVO mbVO);
	
	//비공개 매칭 시 메일 전송
	public void sendEmail(MatchingBoardVO mbVO);
	
	//매칭게시판 전체 보기
	public List<MatchingBoardVO> mBoardList(MatchingBoardVO mbVO);
	
	//매칭게시판 게시글 상세 보기
	public MatchingBoardVO mBoardDetail(MatchingBoardVO mbVO);

	//전체 레코드 수 반환
	public int mBoardListCnt(MatchingBoardVO mbVO);
	
	//매칭게시판 게시글 수정하기
	public int mBoardUpdate(MatchingBoardVO mbVO);
	
	//매칭게시판 게시글 삭제하기
	public int mBoardDelete(MatchingBoardVO mbVO);
	
}

