package com.myedumyselect.academy.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

@Mapper
public interface AcademyAdvertiseDAO {

	// 홍보게시판 전체 레코드 수 반환
	public int advertiseListCnt(AdvertiseVO advertiseVO);

	// 홍보게시판 전체 목록 보기
	public List<AdvertiseVO> advertiseList(AdvertiseVO advertiseVO);

}
