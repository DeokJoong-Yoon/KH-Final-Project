package com.myedumyselect.matching.board.service;

import java.util.List;

import com.myedumyselect.academy.vo.AcademyVo;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

public interface MatchingBoardService {
	public List<MatchingBoardVO> mBoardListPreview(MatchingBoardVO mbvo);
	
	public List<AcademyVo> mResult(MatchingBoardVO mbVO);

	public int publicUpload(MatchingBoardVO mbVO);
}

