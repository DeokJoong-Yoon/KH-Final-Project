package com.myedumyselect.personal.service;

import java.util.List;

import com.myedumyselect.commonboard.free.vo.FreeVO;

public interface PersonalFreeBoardService {

	// 자유 게시판 목록
	public List<FreeVO> boardList(FreeVO freeVO);

	// 자유 게시판 조회수
	public int boardListCnt(FreeVO freeVO);

	// 자유 게시판 상세보기
	public FreeVO boardDetail(FreeVO freeVO);
} 
 