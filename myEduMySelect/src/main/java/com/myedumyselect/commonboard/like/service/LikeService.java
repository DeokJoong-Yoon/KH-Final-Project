package com.myedumyselect.commonboard.like.service;

import com.myedumyselect.commonboard.like.vo.LikeVO;

public interface LikeService {
	
	//좋아요 처리
	public void likeProcess(LikeVO lvo);
	
	//좋아요 개수
	public int getLikeCount(int commonNo);
	
	//좋아요 상태가 NULL일 때 0으로 반환하도록 수정
	public int getLikeStatus(LikeVO lvo);
}
