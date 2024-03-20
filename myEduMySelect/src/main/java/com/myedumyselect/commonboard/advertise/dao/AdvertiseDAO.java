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
	
	//홍보게시판 게시글 삭제
	public int advertiseDelete(AdvertiseVO aVO);

	//홍보게시판 상세페이지 이동
	public AdvertiseVO advertiseDetail(AdvertiseVO aVO);
	
	//홍보게시판 게시글만 수정
	public int advertiseUpdate(AdvertiseVO aVO);
	
	//첨부파일 삭제
	public int advertiseDeleteFile(AdvertiseVO aVO);
	
	//기존에 존재하는 첨부파일 모두 가져오기
	public List<FileVO> advertiseNowFile(int commonNo);
	
	//이전 게시글 번호 추출
	public int prevCommonNo(AdvertiseVO aVO);
	
	//다음 게시글 번호 추출
	public int nextCommonNo(AdvertiseVO aVO);
}
