package com.myedumyselect.commonboard.free.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.commonboard.free.vo.FreeVO;


@Mapper
public interface FreeDAO {
	public List<FreeVO> freeList(FreeVO fvo);
	public FreeVO freeDetail(FreeVO fvo);
}
