package com.myedumyselect.commonboard.advertise.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

public interface AdvertiseService {
	
	//홍보게시판 전체 레코드 수 반환
	public int advertiseListCnt(AdvertiseVO aVO);
	
	//홍보게시판 전체 목록 보기
	public List<AdvertiseVO> advertiseList(AdvertiseVO aVO);
	
	//홍보게시판 글 등록
	public void advertiseInsertWithFiles(AdvertiseVO aVO, List<MultipartFile> files) throws Exception;
	
	//홍보게시판 상세페이지 이동
	public AdvertiseVO advertiseDetail(AdvertiseVO aVO);
	
	//홍보게시판 게시글 삭제
	public int advertiseDelete(AdvertiseVO aVO) throws Exception;
	
	//홍보게시판 글 수정 폼 이동
	public AdvertiseVO advertiseUpdateForm(AdvertiseVO aVO);
	
	//홍보게시판 게시글 수정
	public int advertiseUpdateWithFiles(AdvertiseVO aVO, List<MultipartFile> files) throws Exception;
}
