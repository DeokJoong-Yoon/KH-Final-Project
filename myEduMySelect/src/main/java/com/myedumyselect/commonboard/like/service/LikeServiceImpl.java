package com.myedumyselect.commonboard.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.commonboard.like.dao.LikeDAO;
import com.myedumyselect.commonboard.like.vo.LikeVO;

import lombok.extern.slf4j.Slf4j;

@Service
public class LikeServiceImpl implements LikeService {
	
	@Autowired
	private LikeDAO ldao;


	//최초 좋아요 처리
	@Override
	public int insertLike(LikeVO lvo) {
		int result = 0;
		result = ldao.insertLike(lvo);
		return result;
	}


	//이후 좋아요 취소/등록 토글
	@Override
	public int toggleLike(LikeVO lvo) {
		int result = 0;
		result = ldao.toggleLike(lvo);
		
		return result;
	}

	
	//좋아요 상태 확인
	@Override
	public Integer getLike(LikeVO lvo) {
		Integer result = ldao.getLike(lvo);
		return (result != null) ? result : 0;
	}

	

}
