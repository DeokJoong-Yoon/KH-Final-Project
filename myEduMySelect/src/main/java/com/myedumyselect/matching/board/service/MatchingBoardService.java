package com.myedumyselect.matching.board.service;

import java.util.List;

import com.myedumyselect.academy.vo.AcademyLoginVo;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

public interface MatchingBoardService {
	public List<MatchingBoardVO> mBoardListPreview(MatchingBoardVO mbvo);

	//public int mPublicUpload(MatchingBoardVO mbVO);
	
	public List<AcademyLoginVo> mResult(MatchingBoardVO mbVO);
}

