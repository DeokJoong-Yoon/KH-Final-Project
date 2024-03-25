package com.myedumyselect.commonboard.free.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.myedumyselect.commonboard.free.reply.service.FreeReplyService;
import com.myedumyselect.commonboard.free.reply.vo.FreeReplyVO;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping(value = "/freereplies")
@Slf4j
public class FreeReplyController {

	@Setter(onMethod_ = @Autowired)
	private FreeReplyService freereplyService;

	@GetMapping(value = "/all/{commonNo}", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<FreeReplyVO> freereplyList(@PathVariable("commonNo") int commonNo) {
		log.info("게시판번호 : " + commonNo);

		FreeReplyVO frvo = new FreeReplyVO();
		frvo.setCommonNo(commonNo);

		log.info("repl list : " + frvo.toString());

		List<FreeReplyVO> list = freereplyService.freereplyList(frvo);
		log.info(list.toString());

		return list;
	}

	@PostMapping(value = "/freereplyInsert", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String freereplyInsert(@RequestBody FreeReplyVO frvo,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLogin) {
		log.info("FreeReplyVO : " + frvo);
		int result = 0;
		frvo.setPersonalId(personalLogin.getPersonalId());

		result = freereplyService.freereplyInsert(frvo);
		return (result == 1) ? "SUCCESS" : "FAILURE";
	}

	@PutMapping(value = "/{commonCommentNo}", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String freereplyUpdate(@PathVariable("commonCommentNo") int commonCommentNo, @RequestBody FreeReplyVO frvo,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLogin) {
		frvo.setCommonCommentNo(commonCommentNo);
		int result = freereplyService.freereplyUpdate(frvo);
		return (result == 1) ? "SUCCESS" : "FAILURE";
	}

	@DeleteMapping(value = "/{commonCommentNo}", produces = MediaType.TEXT_PLAIN_VALUE)
	public String freereplyDelete(@PathVariable("commonCommentNo") int commonCommentNo, FreeReplyVO frvo) {
		frvo.setCommonCommentNo(commonCommentNo);
		int result = freereplyService.freereplyDelete(frvo);
		return (result == 1) ? "SUCCESS" : "FAILURE";
	}

}
