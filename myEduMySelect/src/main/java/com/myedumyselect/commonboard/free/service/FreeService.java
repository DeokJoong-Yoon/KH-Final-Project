package com.myedumyselect.commonboard.free.service;

import java.util.List;

import com.myedumyselect.commonboard.free.vo.FreeVO;

public interface FreeService {
	public List<FreeVO> freeList(FreeVO fvo);
	public int freeListCnt(FreeVO fvo);
	public int freeInsert(FreeVO fvo);
	public FreeVO freeDetail(FreeVO fvo);
	
	public FreeVO freeUpdateForm(FreeVO fvo);
	public int freeUpdate(FreeVO fvo);
	public int freeDelete(FreeVO fvo);
	
}
