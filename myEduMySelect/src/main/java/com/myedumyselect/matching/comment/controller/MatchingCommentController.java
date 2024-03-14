package com.myedumyselect.matching.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myedumyselect.matching.comment.service.MatchingCommentService;
import com.myedumyselect.matching.comment.vo.MatchingCommentVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value="/matchingcomments")
public class MatchingCommentController {
	
	@Autowired
	private MatchingCommentService mcService;
	
	@GetMapping(value="/all/{matchingNo}", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<MatchingCommentVO> mCommentList(@PathVariable("matchingNo") int matchingNo, MatchingCommentVO mcVO) {
		log.info("댓글 리스트 JSON 호출 성공");
		
		List<MatchingCommentVO> list = null;
		mcVO.setMatchingCommentNo(matchingNo);
		list = mcService.mCommentList(mcVO);
		return list;
	}

}
