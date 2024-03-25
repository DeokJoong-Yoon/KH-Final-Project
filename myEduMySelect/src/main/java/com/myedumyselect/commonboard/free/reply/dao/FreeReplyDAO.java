package com.myedumyselect.commonboard.free.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.commonboard.free.reply.vo.FreeReplyVO;

@Mapper
public interface FreeReplyDAO {
	public List<FreeReplyVO> freereplyList(FreeReplyVO frvo);
	public int freereplyInsert(FreeReplyVO frvo);
	public int freereplyUpdate(FreeReplyVO frvo);
	public int freereplyDelete(FreeReplyVO frvo);
	public int freereplyChoiceDelete(int commonNo);
	public int freeReplyCnt(int commonNo);
	public FreeReplyVO selectedFreeReply(FreeReplyVO frvo);

}
