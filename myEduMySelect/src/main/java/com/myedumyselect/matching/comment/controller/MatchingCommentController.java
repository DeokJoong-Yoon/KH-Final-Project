package com.myedumyselect.matching.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.myedumyselect.matching.comment.service.MatchingCommentService;
import com.myedumyselect.matching.comment.vo.MatchingCommentVO;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value="/matchingcomments")
public class MatchingCommentController {
	
	@Autowired
	private MatchingCommentService mcService;
	
	//댓글 리스트 JSON 호출
	@GetMapping(value="/all/{matchingNo}", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<MatchingCommentVO> mCommentList(@PathVariable("matchingNo") int matchingNo, MatchingCommentVO mcVO) {
		log.info("댓글 리스트 JSON 호출 성공");
		
		List<MatchingCommentVO> list = null;
		mcVO.setMatchingCommentNo(matchingNo);
		list = mcService.mCommentList(mcVO);
		
		log.info(list.toString());
		return list;
	}
	
	
	//댓글 입력 구현
	@PostMapping(value="/commentInsert", consumes="application/json", produces=MediaType.APPLICATION_JSON_VALUE)
	public String mCommentInsert(@RequestBody MatchingCommentVO mcVO, Model model) {
		
		log.info("mCommentInsert 호출 성공");
		log.info("MatchingCommentVO : " + mcVO);
		
		int result = 0;
		result = mcService.mCommentInsert(mcVO);
		
		return (result == 1) ? "SUCCESS" : "FAILURE";
	}
	
	
	//댓글 삭제 구현
	@DeleteMapping(value="/{matchingCommentNo}", produces=MediaType.TEXT_PLAIN_VALUE) 
	public String mCommentDelete(@PathVariable("matchingCommentNo") int matchingCommentNo, MatchingCommentVO mcVO, 
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO) {
		log.info("mCommentDelete 호출 성공");
		
		int result = 0;
		result = mcService.mCommentDelete(mcVO);
		return (result == 1) ? "SUCCESS" : "FAILURE";
		
	}
	
	
	//댓글 수정 구현
	@PutMapping(value="/{matchingCommentNo}", consumes="application/json", produces=MediaType.TEXT_PLAIN_VALUE)
	public String mCommentUpdate(@PathVariable("matchingCommentNo") int matchingCommentNo, @RequestBody MatchingCommentVO mcVO) {
		log.info("mCommentUpdate 호출 성공");
		
		mcVO.setMatchingCommentNo(matchingCommentNo);
		//log.info("matchingCommentNo : " + matchingCommentNo);
		
		int result = 0;
		result = mcService.mCommentUpdate(mcVO);
		
		return (result == 1) ? "SUCCESS" : "FAILURE";
	}

}
