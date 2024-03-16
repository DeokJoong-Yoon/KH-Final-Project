package com.myedumyselect.commonboard.advertise.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.commonboard.advertise.dao.AdvertiseDAO;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

import lombok.Setter;

@Service
public class AdvertiseServiceImpl implements AdvertiseService {
	@Setter(onMethod_ = @Autowired)
	private AdvertiseDAO advertiseDAO;
	
	// 목록 구현
	@Override
	public List<AdvertiseVO> advertiseList(AdvertiseVO avo){
		List<AdvertiseVO> list = null;
		list = advertiseDAO.advertiseList(avo);
		return list;
	}
}
