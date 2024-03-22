package com.myedumyselect.commonboard.free.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.commonboard.free.vo.FreeVO;


@Mapper
public interface FreeDAO {
	public List<FreeVO> freeList(FreeVO fvo);
	public int freeInsert(FreeVO fvo);
	public FreeVO freeDetail(FreeVO fvo);
	public int readCntUpdate(FreeVO fvo);
	public int freeUpdate(FreeVO fvo);
	public int freeDelete(FreeVO fvo);
	public int freeListCnt(FreeVO fvo);
	public List<FreeVO> boardListExcel(FreeVO bvo);
	
	
}