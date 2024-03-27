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
	
	
	/* 댓글 리스트 */
	@Override
    public List<FreeReplyVO> freereplyList(FreeReplyVO frvo){
        List<FreeReplyVO> list = null;
        list = freereplyDAO.freereplyList(frvo);
        return list;
    }
	
	/* 댓글 글쓰기 */
	@Override
	public int freereplyInsert(FreeReplyVO frvo) {
		int result = 0;
		result = freereplyDAO.freereplyInsert(frvo);
		return result;
	}
	
	/* 댓글 글수정 */
	@Override
	public int freereplyUpdate(FreeReplyVO frvo) {
		int result = 0;
		result = freereplyDAO.freereplyUpdate(frvo);
		return result;
	}
	
	/* 댓글 글삭제 */
	@Override
	public int freereplyDelete(FreeReplyVO frvo) {
		int result = 0;
		result = freereplyDAO.freereplyDelete(frvo);
		return result;
	}

	/* 댓글 응답 처리 */
	@Override
	public FreeReplyVO selectedFreeReply(FreeReplyVO frvo) {
		return freereplyDAO.selectedFreeReply(frvo);
	}
	
	
	
}
