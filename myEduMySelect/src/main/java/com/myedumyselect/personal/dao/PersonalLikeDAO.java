package com.myedumyselect.personal.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;

import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;
import com.myedumyselect.commonboard.like.vo.LikeVO;
import com.myedumyselect.personal.vo.PersonalLoginVO;

@Mapper
public interface PersonalLikeDAO {

	public List<Integer> getLikedCommonNos(PersonalLoginVO personalLogin);
	
	public AdvertiseVO getCommonBoardByNo (int commonNo);
	

}
