package com.myedumyselect.matching.board.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.myedumyselect.matching.board.dao.MatchingBoardDAO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class MatchingBoardTest {
	
	@Autowired
	private MatchingBoardDAO mbDAO;
	
	@Test
	public void testMBoardList() {
		log.info("mBoardList() 메소드 실행");
		
		MatchingBoardVO mbVO = null;
		List<MatchingBoardVO> list = mbDAO.mBoardListPreview(mbVO);
		for(MatchingBoardVO vo : list) {
			log.info(vo.toString());
		}
	}
}
