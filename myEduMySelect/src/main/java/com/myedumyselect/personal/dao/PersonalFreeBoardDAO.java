package com.myedumyselect.personal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.commonboard.free.vo.FreeVO;

@Mapper
public interface PersonalFreeBoardDAO {
	
	//자유 게시판 목록
	public List<FreeVO> boardList(FreeVO freeVO);
	
	//자유 게시판 조회수
	public int boardListCnt(FreeVO freeVO);
	
	//자유 게시판 상세보기
	public FreeVO boardDetail(FreeVO freeVO);
}
