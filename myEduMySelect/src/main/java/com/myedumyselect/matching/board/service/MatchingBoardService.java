package com.myedumyselect.matching.board.service;

import java.util.List;

import com.myedumyselect.academy.vo.AcademyLoginVo;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

public interface MatchingBoardService {
	
	public List<MatchingBoardVO> mBoardListPreview(MatchingBoardVO mbVO);

	public List<AcademyLoginVo> mResult(MatchingBoardVO mbVO);
	
	public int publicUpload(MatchingBoardVO mbVO);
	
	public int privateUpload(MatchingBoardVO mbVO);
	
	public void sendEmail(MatchingBoardVO mbVO);
	
	public List<MatchingBoardVO> mBoardList(MatchingBoardVO mbVO);
	
	public MatchingBoardVO mBoardDetail(MatchingBoardVO mbVO);

	public int mBoardListCnt(MatchingBoardVO mbVO);
	
	public MatchingBoardVO mBoardUpdateForm(MatchingBoardVO mbVO);
	public int mBoardUpdate(MatchingBoardVO mbVO);
	
	public int mBoardDelete(MatchingBoardVO mbVO);
}

