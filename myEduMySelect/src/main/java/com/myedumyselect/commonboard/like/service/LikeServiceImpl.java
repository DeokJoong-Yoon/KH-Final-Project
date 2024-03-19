package com.myedumyselect.commonboard.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.commonboard.like.dao.LikeDAO;
import com.myedumyselect.commonboard.like.vo.LikeVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LikeServiceImpl implements LikeService {
	
	@Autowired
	private LikeDAO ldao;

	@Override
	public void likeProcess(LikeVO lvo) {
		
		log.info("likeProcess() 호출");
		
		//좋아요 상태
		int likeStatus = ldao.getLikeStatus(lvo);
		
		if (likeStatus == 0) {			//좋아요를 누르지 않은 상태일 때
			ldao.insertLike(lvo);		//좋아요 상태로 변경
		} else {						//좋아요를 누른 상태일 때
			ldao.cancelLike(lvo);		//좋아요 취소 상태로 변경
		}
	}


	@Override
	public int getLikeCount(int commonNo) {
		return ldao.getLikeCount(commonNo);
	}
	
	
	@Override
	public int getLikeStatus(LikeVO lvo) {
		Integer likeStatus = ldao.getLikeStatus(lvo);
		return likeStatus != null ? likeStatus.intValue() : 0;
	}

}
