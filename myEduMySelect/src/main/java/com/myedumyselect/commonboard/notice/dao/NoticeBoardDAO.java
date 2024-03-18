package com.myedumyselect.commonboard.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.commonboard.notice.vo.NoticeBoardVO;

@Mapper
public interface NoticeBoardDAO {

	public List<NoticeBoardVO> boardList(NoticeBoardVO noticeBoardVO);
	public int boardListCnt(NoticeBoardVO noticeBoardVO);
	public int boardInsert(NoticeBoardVO noticeBoardVO);
	public NoticeBoardVO boardDetail(NoticeBoardVO noticeBoardVO);
	public int boardDelete(NoticeBoardVO noticeBoardVO);
	public int boardUpdate(NoticeBoardVO noticeBoardVO);
	public int readCntUpdate(NoticeBoardVO noticeBoardVO);

}
