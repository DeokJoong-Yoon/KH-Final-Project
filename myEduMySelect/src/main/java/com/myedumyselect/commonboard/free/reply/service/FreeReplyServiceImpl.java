package com.myedumyselect.commonboard.free.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.commonboard.free.reply.dao.FreeReplyDAO;
import com.myedumyselect.commonboard.free.reply.vo.FreeReplyVO;

import lombok.Setter;

@Service
public class FreeReplyServiceImpl implements FreeReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private FreeReplyDAO freereplyDAO;
	
	@Override
    public List<FreeReplyVO> freereplyList(FreeReplyVO frvo){
        List<FreeReplyVO> list = null;
        list = freereplyDAO.freereplyList(frvo);
        return list;
    }
	
	@Override
	public int freereplyInsert(FreeReplyVO frvo) {
		int result = 0;
		result = freereplyDAO.freereplyInsert(frvo);
		return result;
	}
	
	@Override
	public int freereplyUpdate(FreeReplyVO frvo) {
		int result = 0;
		result = freereplyDAO.freereplyUpdate(frvo);
		return result;
	}
	
	@Override
	public int freereplyDelete(FreeReplyVO frvo) {
		int result = 0;
		result = freereplyDAO.freereplyDelete(frvo);
		return result;
	}
}
