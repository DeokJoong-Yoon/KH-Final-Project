package com.myedumyselect.commonboard.like.dao;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.commonboard.like.vo.LikeVO;

@Mapper
public interface LikeDAO {
	
	//좋아요 등록
	public void insertLike(LikeVO lvo);
	
	//좋아요 취소
	public void cancelLike(LikeVO lvo);
	
	//좋아요 개수
	public int getLikeCount(int commonNo);
	
	//좋아요 여부 확인
	public Integer getLikeStatus(LikeVO lvo);
}
