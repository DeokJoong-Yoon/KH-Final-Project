package com.myedumyselect.commonboard.free.reply.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.Setter;

@SpringBootTest
public class FreeReplyDAOTests {
	@Setter(onMethod_ = @Autowired)
	private FreeReplyDAO freereplyDAO;

	/*
	 * @Test public void testFreeReplyList() { FreeReplyVO frvo = new FreeReplyVO();
	 * log.info("FreeReplyList() 메소드 실행");
	 * 
	 * frvo.setCommon_no(10021); List<FreeReplyVO> list =
	 * freereplyDAO.freereplyList(frvo); for(FreeReplyVO vo : list) {
	 * log.info(vo.toString()); }
	 * 
	 * }
	 */

	/*
	 * @Test public void testReplyCount() { int commonNo = 10017; int result =
	 * freereplyDAO.freeReplyCnt(commonNo); log.info(commonNo + "번 게시물 댓글 수 : " +
	 * result); }
	 */
}
