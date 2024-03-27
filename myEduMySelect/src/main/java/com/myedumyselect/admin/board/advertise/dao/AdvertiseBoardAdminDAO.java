package com.myedumyselect.admin.board.advertise.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

@Mapper
public interface AdvertiseBoardAdminDAO {

	public List<AdvertiseVO> boardList(AdvertiseVO advertiseVO);

}
