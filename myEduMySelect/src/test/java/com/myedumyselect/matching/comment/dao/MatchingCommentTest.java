package com.myedumyselect.matching.comment.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.myedumyselect.matching.comment.vo.MatchingCommentVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class MatchingCommentTest {

	@Autowired
	private MatchingCommentDAO mcDAO;
	
	@Test
	public void testMCommentList() {
		
		log.info("mCommentList() 메소드 실행");
		MatchingCommentVO mcVO = new MatchingCommentVO();
		mcVO.setMatchingNo(6);
		
		List<MatchingCommentVO> list = mcDAO.mCommentList(mcVO);
		
		for(MatchingCommentVO vo : list) {
			log.info(vo.toString());
		}
		
		
	}
}
