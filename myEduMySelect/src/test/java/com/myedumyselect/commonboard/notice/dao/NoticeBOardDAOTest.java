package com.myedumyselect.commonboard.notice.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.myedumyselect.commonboard.notice.vo.NoticeBoardVO;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class NoticeBOardDAOTest {
	
	@Autowired
	private NoticeBoardDAO noticeBoardDAO;
	
	@Test
	public void boardListCnt( ) {
		NoticeBoardVO nvo = new NoticeBoardVO();
		nvo.setPageNum(1);
		nvo.setAmount(10);
		nvo.setMemberTypeId(3);
		List<NoticeBoardVO> list = noticeBoardDAO.boardList(nvo);
		for (NoticeBoardVO vo : list) {
			log.info(vo.toString());
		}
		log.info("총 레코드 수 : " + noticeBoardDAO.boardListCnt(nvo));
	}
	
}
