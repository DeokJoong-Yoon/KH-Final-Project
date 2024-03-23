package com.myedumyselect.personal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.commonboard.free.vo.FreeVO;
import com.myedumyselect.personal.dao.PersonalFreeBoardDAO;

import lombok.Setter;

@Service
public class PersonalFreeBoardServiceImpl implements PersonalFreeBoardService {
	
	@Setter(onMethod_= @Autowired)
	PersonalFreeBoardDAO personalFreeBoardDAO;
	
	@Override
	public List<FreeVO> boardList(FreeVO freeVO) {
		return personalFreeBoardDAO.boardList(freeVO);
	}
 
	@Override
	public int boardListCnt(FreeVO freeVO) {
		return personalFreeBoardDAO.boardListCnt(freeVO);
	}

	@Override
	public FreeVO boardDetail(FreeVO freeVO) {
		FreeVO detail = personalFreeBoardDAO.boardDetail(freeVO);
		return detail;
	}
}
