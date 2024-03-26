package com.myedumyselect.commonboard.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.commonboard.like.dao.LikeDAO;
import com.myedumyselect.commonboard.like.vo.LikeVO;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	private LikeDAO ldao;

	@Override
	public int insertLike(LikeVO lvo) {
		int result = 0;
		result = ldao.insertLike(lvo);
		return result;
	}

	@Override
	public int toggleLike(LikeVO lvo) {
		int result = 0;
		result = ldao.toggleLike(lvo);

		return result;
	}

	@Override
	public Integer getLike(LikeVO lvo) {
		Integer result = ldao.getLike(lvo);
		return (result != null) ? result : 0;
	}

}
