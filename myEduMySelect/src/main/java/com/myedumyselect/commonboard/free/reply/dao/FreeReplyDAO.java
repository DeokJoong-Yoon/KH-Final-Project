package com.myedumyselect.commonboard.free.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.commonboard.free.reply.vo.FreeReplyVO;

@Mapper
public interface FreeReplyDAO {
	public List<FreeReplyVO> freereplyList(FreeReplyVO frvo);
}
