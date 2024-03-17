package com.myedumyselect.commonboard.advertise.service;

import java.util.List;

import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

public interface AdvertiseService {
	
	//홍보게시판 전체 레코드 수 반환
	public int advertiseListCnt(AdvertiseVO aVO);
	
	//홍보게시판 전체 목록 보기
	public List<AdvertiseVO> advertiseList(AdvertiseVO aVO);
}
