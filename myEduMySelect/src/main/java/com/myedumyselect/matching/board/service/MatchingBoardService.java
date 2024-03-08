package com.myedumyselect.matching.board.service;

import java.util.List;

import com.myedumyselect.academy.vo.AcademyLoginVo;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

public interface MatchingBoardService {
	public List<MatchingBoardVO> mBoardListPreview(MatchingBoardVO mbvo);

<<<<<<< HEAD
	//public int mPublicUpload(MatchingBoardVO mbVO);
	
=======
	public int publicUpload(MatchingBoardVO mbVO);
>>>>>>> branch 'main' of https://github.com/kimzionoff/KH-Final-Project.git
	public List<AcademyLoginVo> mResult(MatchingBoardVO mbVO);
}

