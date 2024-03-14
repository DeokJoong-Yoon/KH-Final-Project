package com.myedumyselect.commonboard.notice.service;

import java.io.IOException;
import java.util.List;

import com.myedumyselect.commonboard.notice.vo.NoticeBoardVO;

public interface NoticeBoardService {

	public List<NoticeBoardVO> boardList(NoticeBoardVO noticeBoardVO);
	
	public int boardListCnt(NoticeBoardVO noticeBoardVO);

	public int boardInsert(NoticeBoardVO noticeBoardVO) throws IOException;

	public NoticeBoardVO boardDetail(NoticeBoardVO noticeBoardVO);

	public int boardDelete(NoticeBoardVO noticeBoardVO);

}
