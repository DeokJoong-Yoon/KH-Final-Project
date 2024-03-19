package com.myedumyselect.commonboard.free.service;

import java.util.List;

import com.myedumyselect.commonboard.free.vo.FreeVO;

public interface FreeService {
	public List<FreeVO> freeList(FreeVO fvo);
	public int freeListCnt(FreeVO fvo);
	
	public FreeVO freeDetail(FreeVO fvo);
	public FreeVO freeUpdateForm(FreeVO fvo);
	
	
	public int freereplyCount(int commonNo);
	
	public int freeInsert(FreeVO fvo) throws Exception;
	public int freeUpdate(FreeVO fvo) throws Exception;
	public int freeDelete(FreeVO fvo) throws Exception;
}
