package com.myedumyselect.commonboard.advertise.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

@Mapper
public interface AdvertiseDAO {
	public List<AdvertiseVO> advertiseList(AdvertiseVO avo);
	public int advertiseInsert(AdvertiseVO avo);
}
