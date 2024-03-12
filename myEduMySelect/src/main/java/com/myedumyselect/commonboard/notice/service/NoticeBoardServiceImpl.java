package com.myedumyselect.commonboard.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.commonboard.notice.dao.NoticeBoardDAO;
import com.myedumyselect.commonboard.notice.vo.NoticeBoardVO;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {
	
	@Autowired
	private NoticeBoardDAO noticeBoardDAO;

	@Override
	public List<NoticeBoardVO> boardList(NoticeBoardVO noticeBoardVO) {
		List<NoticeBoardVO> list = null;
		list = noticeBoardDAO.boardList(noticeBoardVO);
		return list;
	}

	@Override
	public int boardListCnt(NoticeBoardVO noticeBoardVO) {
		return noticeBoardDAO.boardListCnt(noticeBoardVO);
	}

}
