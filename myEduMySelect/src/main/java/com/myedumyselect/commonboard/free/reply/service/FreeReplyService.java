package com.myedumyselect.commonboard.free.reply.service;

import java.util.List;

import com.myedumyselect.commonboard.free.reply.vo.FreeReplyVO;

public interface FreeReplyService {
	public List<FreeReplyVO> freereplyList(FreeReplyVO frvo);
	public int freereplyInsert(FreeReplyVO frvo);
	public int freereplyUpdate(FreeReplyVO frvo);
	public int freereplyDelete(FreeReplyVO frvo);
	public FreeReplyVO selectedFreeReply(FreeReplyVO frvo);
}
