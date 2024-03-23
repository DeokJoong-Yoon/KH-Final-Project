package com.myedumyselect.personal.service;

import java.util.List;

import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;
import com.myedumyselect.commonboard.like.vo.LikeVO;
import com.myedumyselect.personal.vo.PersonalLoginVO;

public interface PersonalLikeService {
	
	public List<AdvertiseVO> getLikedCommon(PersonalLoginVO personalLogin);

	
}
