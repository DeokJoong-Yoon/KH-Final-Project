package com.myedumyselect.commonboard.like.service;

import com.myedumyselect.commonboard.like.vo.LikeVO;

public interface LikeService {
	
	//최초 좋아요 처리
	public int insertLike(LikeVO lvo);
	
	//좋아요 토글
	public int toggleLike(LikeVO lvo);

	//좋아요 상태 확인
	public Integer getLike(LikeVO lvo);
	
}
