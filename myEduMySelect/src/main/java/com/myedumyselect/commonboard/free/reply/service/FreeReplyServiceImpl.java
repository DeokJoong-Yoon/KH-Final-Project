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
}
