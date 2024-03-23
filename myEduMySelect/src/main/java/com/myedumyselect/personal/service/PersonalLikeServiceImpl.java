package com.myedumyselect.personal.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;
import com.myedumyselect.personal.dao.PersonalLikeDAO;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import lombok.Setter;

@Service
public class PersonalLikeServiceImpl implements PersonalLikeService {

	@Setter(onMethod_ = @Autowired)
	PersonalLikeDAO personalLikeDAO;

	@Override
	public List<AdvertiseVO> getLikedCommon(PersonalLoginVO personalLogin) {
		List<AdvertiseVO> likedCommonBoards = new ArrayList<>();
		List<Integer> likedNumbers = personalLikeDAO.getLikedCommonNos(personalLogin);

		for (Integer commonNo : likedNumbers) {
			AdvertiseVO advertiseVO = personalLikeDAO.getCommonBoardByNo(commonNo);
			likedCommonBoards.add(advertiseVO);

		}
		return likedCommonBoards;
	}
	

}
