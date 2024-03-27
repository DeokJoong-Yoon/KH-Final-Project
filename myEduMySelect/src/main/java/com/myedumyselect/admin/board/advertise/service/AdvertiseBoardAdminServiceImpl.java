package com.myedumyselect.admin.board.advertise.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.admin.board.advertise.dao.AdvertiseBoardAdminDAO;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

import lombok.Setter;

@Service
public class AdvertiseBoardAdminServiceImpl implements AdvertiseBoardAdminService {

	@Setter(onMethod_ = @Autowired)
	AdvertiseBoardAdminDAO advertiseBoardAdminDAO;

	@Override
	public List<AdvertiseVO> boardList(AdvertiseVO advertiseVO) {
		List<AdvertiseVO> list = null;
		list = advertiseBoardAdminDAO.boardList(advertiseVO);
		return list;
	}

}
