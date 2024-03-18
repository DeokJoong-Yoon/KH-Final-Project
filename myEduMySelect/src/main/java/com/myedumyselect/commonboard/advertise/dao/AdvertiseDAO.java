package com.myedumyselect.commonboard.advertise.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.common.file.FileVO;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

@Mapper
public interface AdvertiseDAO {
	
	//홍보게시판 전체 레코드 수 반환
	public int advertiseListCnt(AdvertiseVO aVO);
	
	//홍보게시판 전체 목록 보기
	public List<AdvertiseVO> advertiseList(AdvertiseVO aVO);
	
	//홍보게시판 글 등록
	public int advertiseInsert(AdvertiseVO aVO);
	
	//홍보게시판 파일 등록
	public int advertiseInsertFile(FileVO fileVO);

	//홍보게시판 글 등록 시 첫 번째 파일을 썸네일로 설정
	public int advertiseThumbnail(AdvertiseVO aVO);
	
	//홍보게시판 상세페이지 이동
	public AdvertiseVO advertiseDetail(AdvertiseVO aVO);
}
