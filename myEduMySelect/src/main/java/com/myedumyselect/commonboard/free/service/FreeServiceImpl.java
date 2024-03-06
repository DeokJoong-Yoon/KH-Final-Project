package com.myedumyselect.commonboard.free.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.commonboard.free.dao.FreeDAO;
import com.myedumyselect.commonboard.free.vo.FreeVO;

import lombok.Setter;

@Service
public class FreeServiceImpl implements FreeService {
	@Setter(onMethod_ = @Autowired)
	private FreeDAO freeDAO;
	
	@Override
	public List<FreeVO> freeList(FreeVO fvo){
		List<FreeVO> list = null;
		list = freeDAO.freeList(fvo);
		return list;
	}
	
	@Override
	public FreeVO freeDetail(FreeVO fvo) {
		FreeVO detail = freeDAO.freeDetail(fvo);
		if(detail!=null) {
			detail.setCommon_content(detail.getCommon_content().replaceAll("\n", "<br />"));
		}
		return detail;
	}
}
