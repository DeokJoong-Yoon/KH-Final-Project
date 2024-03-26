package com.myedumyselect.commonboard.like.dao;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.commonboard.like.vo.LikeVO;

@Mapper
public interface LikeDAO {
	
	//좋아요 등록
	public int insertLike(LikeVO lvo);
	
	//좋아요 변경
	public int toggleLike(LikeVO lvo);
	
	//좋아요 상태 확인
	public Integer getLike(LikeVO lvo);
	
}
