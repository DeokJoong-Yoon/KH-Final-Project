package com.myedumyselect.matching.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.academy.vo.AcademyVo;
import com.myedumyselect.matching.board.dao.MatchingBoardDAO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

@Service
public class MatchingBoardServiceImpl implements MatchingBoardService {

	@Autowired
	private MatchingBoardDAO mbDAO;
	
	@Override
	public List<MatchingBoardVO> mBoardListPreview(MatchingBoardVO mbvo) {
		List<MatchingBoardVO> list = mbDAO.mBoardListPreview(mbvo);
		return list;
	}

	@Override
	public List<AcademyVo> mResult(MatchingBoardVO mbVO) {
		return mbDAO.mResult(mbVO);
	}

	@Override
	public int publicUpload(MatchingBoardVO mbVO) {
		int result = 0;
		result = mbDAO.publicUpload(mbVO);
		
		return result;
	}


}
