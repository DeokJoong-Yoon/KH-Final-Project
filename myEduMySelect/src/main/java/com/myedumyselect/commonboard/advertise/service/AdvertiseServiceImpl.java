package com.myedumyselect.commonboard.advertise.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.myedumyselect.common.file.FileUploadUtil;
import com.myedumyselect.common.file.FileVO;
import com.myedumyselect.commonboard.advertise.dao.AdvertiseDAO;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

import lombok.Setter;

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
	public int advertiseInsertWithFiles(AdvertiseVO aVO, List<MultipartFile> files) throws Exception {
		
		int result = 0;
		
		//게시글 제목, 내용 등록
		result = aDAO.advertiseInsert(aVO);	
		
		//게시글 id로 각 파일을 file 테이블에 추가
		for (MultipartFile file : files) {
	        if (!file.isEmpty()) { // 파일이 첨부되었는지 확인
	            String fileName = FileUploadUtil.fileUpload(file , "advertise");
	            
	            FileVO fileVO = new FileVO();
	            fileVO.setCommonNo(aVO.getCommonNo());
	            fileVO.setFileName(fileName);
	            
	            int fileResult = aDAO.advertiseInsertFile(fileVO);
	            
	            if(fileResult == 0) {
	            	result = 0;
	            }
	        }
	    }   
		
		//썸네일 등록
		aDAO.advertiseThumbnail(aVO);
		
		return result;
	}

	
	//홍보게시판 글 상세 보기
	@Override
	public AdvertiseVO advertiseDetail(AdvertiseVO aVO) {
		
		AdvertiseVO detail = aDAO.advertiseDetail(aVO);
		
		if(detail != null) {
			detail.setCommonContent(detail.getCommonContent().replaceAll("\n", "<br/>"));
		}
		
		aDAO.readCntUpdate(aVO);
		
		return detail;
	}
	
	
	//홍보게시판 글 삭제
	@Override
	public int advertiseDelete(AdvertiseVO aVO) throws Exception {
		
		if(!aVO.getCommonFile().equals("noimage.png")) {
			List<FileVO> files = aDAO.advertiseSelectFile(aVO);
			for(FileVO file : files) {
				FileUploadUtil.fileDelete(file.getFileName());
			}
		}
		
		int result = 0;
		result = aDAO.advertiseDelete(aVO);
		
		return result;
	}
	
	
	//홍보게시판 글 수정 폼 이동
	@Override
	public AdvertiseVO advertiseUpdateForm(AdvertiseVO aVO) {
		AdvertiseVO updateData = aDAO.advertiseDetail(aVO);
		return updateData;
	}
	
	
	//홍보게시판 글 수정 (+파일)
	@Override
	public int advertiseUpdateWithFiles(AdvertiseVO aVO, List<MultipartFile> files) throws Exception {
		
		int result = 0;
		
		//게시글 글 수정
		result = aDAO.advertiseUpdate(aVO);
		
		boolean empty = true;
		
		//새로 추가한 파일이 있는지 검사
		for (MultipartFile file : files) {
			empty = file.isEmpty();
			if(!empty) { 		//있음 => empty = false
				break; 
			}
		}
		
		
		if(!empty) {		//추가할 파일이 있는 경우
			for (MultipartFile file : files) {		//파일 목록을 순회하며
				
				if (!file.isEmpty()) { 				//새로 첨부한 파일들 업데이트 진행

					//기존의 파일을 디렉토리에서 삭제
					List<FileVO> beforeFiles = aDAO.advertiseSelectFile(aVO);
					for(FileVO beforeFile : beforeFiles) {
						FileUploadUtil.fileDelete(beforeFile.getFileName());
					}
					//기존의 파일에 대한 내용을 DB에서 삭제
					aDAO.advertiseDeleteFile(aVO);			

					//새로운 파일의 이름, 경로 지정
		            String fileName = FileUploadUtil.fileUpload(file , "advertise");

		            FileVO fileVO = new FileVO();
		            fileVO.setCommonNo(aVO.getCommonNo());
		            fileVO.setFileName(fileName);
		            
		            //새로운 파일을 insert
		            int fileResult = aDAO.advertiseInsertFile(fileVO);
		            
		            if(fileResult == 0) {
		            	result = 0;
		            }
		            
		            //썸네일 등록
		    		aDAO.advertiseThumbnail(aVO);
		            
				} 
			} 
		}
		
		return result;
	}


	//이전 게시글 번호 추출
	@Override
	public int prevCommonNo(AdvertiseVO aVO) {
		int prev = aDAO.prevCommonNo(aVO);
		
		return prev;
	}


	//다음 게시글 번호 추출
	@Override
	public int nextCommonNo(AdvertiseVO aVO) {
		int next = aDAO.nextCommonNo(aVO);
		return next;
	}


}
