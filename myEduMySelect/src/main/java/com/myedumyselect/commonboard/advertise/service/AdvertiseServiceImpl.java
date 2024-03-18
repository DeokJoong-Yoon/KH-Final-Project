package com.myedumyselect.commonboard.advertise.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.myedumyselect.common.file.FileUploadUtil;
import com.myedumyselect.common.file.FileVO;
import com.myedumyselect.commonboard.advertise.dao.AdvertiseDAO;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdvertiseServiceImpl implements AdvertiseService {
	@Setter(onMethod_ = @Autowired)
	private AdvertiseDAO aDAO;
	
	// 목록 구현
	@Override
	public List<AdvertiseVO> advertiseList(AdvertiseVO aVO){
		List<AdvertiseVO> list = null;
		list = aDAO.advertiseList(aVO);
		return list;
	}

	
	//전체 레코드 수 반환
	@Override
	public int advertiseListCnt(AdvertiseVO aVO) {
		return aDAO.advertiseListCnt(aVO);
	}


	//홍보게시판 글 입력 (+파일)
	@Override
	public void advertiseInsertWithFiles(AdvertiseVO aVO, List<MultipartFile> files) throws Exception {
		
		//게시글 제목, 내용 등록
		aDAO.advertiseInsert(aVO);	
		
		//게시글 id로 각 파일을 file 테이블에 추가
		for (MultipartFile file : files) {
	        if (!file.isEmpty()) { // 파일이 첨부되었는지 확인
	            String fileName = FileUploadUtil.fileUpload(file , "advertise");
	            
	            FileVO fileVO = new FileVO();
	            fileVO.setCommonNo(aVO.getCommonNo());
	            fileVO.setFileName(fileName);
	            fileVO.setFilePath("../../uploadStorage/advertise/" + fileName); // 파일이 첨부되지 않은 경우 이 부분 수정
	            aDAO.advertiseInsertFile(fileVO);
	        }
	    }   
		
		//썸네일 등록
		aDAO.advertiseThumbnail(aVO);
		
	}

	
	//홍보게시판 글 상세 보기
	@Override
	public AdvertiseVO advertiseDetail(AdvertiseVO aVO) {
		AdvertiseVO detail = aDAO.advertiseDetail(aVO);
		return detail;
	}
}
