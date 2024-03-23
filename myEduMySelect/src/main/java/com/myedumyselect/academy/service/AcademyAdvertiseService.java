package com.myedumyselect.academy.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

public interface AcademyAdvertiseService {
	//홍보게시판 전체 레코드 수 반환
	public int advertiseListCnt(AdvertiseVO advertiseVO);
	
	//홍보게시판 전체 목록 보기
	public List<AdvertiseVO> advertiseList(AdvertiseVO advertiseVO);
	
	
}
