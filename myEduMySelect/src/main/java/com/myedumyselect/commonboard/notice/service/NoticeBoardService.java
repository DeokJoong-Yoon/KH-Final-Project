package com.myedumyselect.commonboard.notice.service;

import java.util.List;

import com.myedumyselect.commonboard.notice.vo.NoticeBoardVO;

public interface NoticeBoardService {

	public List<NoticeBoardVO> boardList(NoticeBoardVO noticeBoardVO);
	
	public int boardListCnt(NoticeBoardVO noticeBoardVO);

}
