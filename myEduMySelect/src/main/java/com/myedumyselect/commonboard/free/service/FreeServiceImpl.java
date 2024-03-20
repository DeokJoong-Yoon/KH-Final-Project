package com.myedumyselect.commonboard.free.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.common.file.FileUploadUtil;
import com.myedumyselect.commonboard.free.dao.FreeDAO;
import com.myedumyselect.commonboard.free.reply.dao.FreeReplyDAO;
import com.myedumyselect.commonboard.free.vo.FreeVO;

import lombok.Setter;

@Service
public class FreeServiceImpl implements FreeService {
	@Setter(onMethod_ = @Autowired)
	private FreeDAO freeDAO;
	
	@Setter(onMethod_ = @Autowired)
	private FreeReplyDAO freereplyDAO;
	
	
	
	// 글 목록 구현
	@Override
	public List<FreeVO> freeList(FreeVO fvo){
		List<FreeVO> list = null;
		list = freeDAO.freeList(fvo);
		return list;
	}
	
	
	// 전체 레코드 수 구현
	@Override
	public int freeListCnt(FreeVO fvo) {
		return freeDAO.freeListCnt(fvo);
	}
	
	// 글 입력 구현
	@Override
	public int freeInsert(FreeVO fvo) throws Exception{
		int result = 0;
		if(fvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(fvo.getFile(), "free");
			fvo.setCommonFile(fileName);
		}
		result = freeDAO.freeInsert(fvo);
		return result;
	}
	
	// 글 상세 구현
	@Override
	public FreeVO freeDetail(FreeVO fvo) {
		freeDAO.readCntUpdate(fvo);
		
		FreeVO detail = freeDAO.freeDetail(fvo);
		if(detail!=null) {
			detail.setCommonContent(detail.getCommonContent().replaceAll("\n", "<br />"));
		}
		return detail;
	}
	
	// 글 수정 구현
	@Override
	public FreeVO freeUpdateForm(FreeVO fvo) {
		FreeVO freeUpdateData = null;
		freeUpdateData = freeDAO.freeDetail(fvo);
		return freeUpdateData;
	}
	
	@Override
	public int freeUpdate(FreeVO fvo) throws Exception {
		int result = 0;
		if(!fvo.getFile().isEmpty()) {
			if(!fvo.getCommonFile().isEmpty()) {
				FileUploadUtil.fileDelete(fvo.getCommonFile());
			}
			
			String fileName = FileUploadUtil.fileUpload(fvo.getFile(), "free");
			fvo.setCommonFile(fileName);
		}
		result = freeDAO.freeUpdate(fvo);
		return result;
	}
	
	// 글 삭제 구현
	@Override
	public int freeDelete(FreeVO fvo) throws Exception {
		int result = 0;
		if(!fvo.getCommonFile().isEmpty()) {
			FileUploadUtil.fileDelete(fvo.getCommonFile());
		}
		result = freeDAO.freeDelete(fvo);
		return result;
	}
	
	@Override
	public int freeReplyCnt(int commonNo) {
		int result = 0;
	    result = freereplyDAO.freeReplyCnt(commonNo);
	    return result;
	}
}
