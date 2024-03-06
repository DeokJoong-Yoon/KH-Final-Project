package com.myedumyselect.commonboard.free.service;

import java.util.List;

import com.myedumyselect.commonboard.free.vo.FreeVO;

public interface FreeService {
	public List<FreeVO> freeList(FreeVO fvo);
	public FreeVO freeDetail(FreeVO fvo);
}
