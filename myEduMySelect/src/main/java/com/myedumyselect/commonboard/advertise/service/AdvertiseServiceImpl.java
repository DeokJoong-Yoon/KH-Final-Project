package com.myedumyselect.commonboard.advertise.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.commonboard.advertise.dao.AdvertiseDAO;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdvertiseServiceImpl implements AdvertiseService {
	@Setter(onMethod_ = @Autowired)
	private AdvertiseDAO aDAO;
	
	// 목록 구현
	@Override
	public List<AdvertiseVO> advertiseList(AdvertiseVO aVO){
		List<AdvertiseVO> list = null;
		list = aDAO.advertiseList(aVO);
		return list;
	}

	
	//전체 레코드 수 반환
	@Override
	public int advertiseListCnt(AdvertiseVO aVO) {
		return aDAO.advertiseListCnt(aVO);
	}
}
