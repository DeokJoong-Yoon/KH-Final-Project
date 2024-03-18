package com.myedumyselect.commonboard.free.reply.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.myedumyselect.commonboard.free.reply.vo.FreeReplyVO;


import lombok.extern.slf4j.Slf4j;
import lombok.Setter;

@SpringBootTest
@Slf4j
public class FreeReplyDAOTests {
	@Setter(onMethod_ = @Autowired)
	private FreeReplyDAO freereplyDAO;
	
	/*@Test
	public void testFreeReplyList() {
		FreeReplyVO frvo = new FreeReplyVO();
		log.info("FreeReplyList() 메소드 실행");
		
		frvo.setCommon_no(10021);
		List<FreeReplyVO> list = freereplyDAO.freereplyList(frvo);
		for(FreeReplyVO vo : list) {
			log.info(vo.toString());
		}
		
	}*/
}
