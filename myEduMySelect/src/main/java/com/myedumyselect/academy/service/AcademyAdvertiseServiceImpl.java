package com.myedumyselect.academy.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.academy.dao.AcademyAdvertiseDAO;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

import lombok.Setter;
@Service
public class AcademyAdvertiseServiceImpl implements AcademyAdvertiseService{
	
	@Setter(onMethod_ = @Autowired)
	AcademyAdvertiseDAO academyAdvertiseDAO;
	
	// 목록 구현
	@Override
	public List<AdvertiseVO> advertiseList(AdvertiseVO advertiseVO) {
		return academyAdvertiseDAO.advertiseList(advertiseVO);
	}
	 
	//전체 레코드 수 반환
	@Override
	public int advertiseListCnt(AdvertiseVO advertiseVO) {
		return academyAdvertiseDAO.advertiseListCnt(advertiseVO);
	}
}
