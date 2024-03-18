package com.myedumyselect.commonboard.free.reply.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myedumyselect.commonboard.free.reply.service.FreeReplyService;
import com.myedumyselect.commonboard.free.reply.vo.FreeReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping(value="/freereplies")
@Slf4j
public class FreeReplyController {
	
	@Setter(onMethod_ = @Autowired)
	private FreeReplyService freereplyService;
	
	@GetMapping(value="/all/{common_no}", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<FreeReplyVO> freereplyList(@PathVariable("common_no") int common_no){
	    log.info("list 호출 성공");
	    
	    List<FreeReplyVO> list = null;
	    FreeReplyVO frvo = new FreeReplyVO(); // 수정된 부분
	    frvo.setCommon_no(common_no);
	    list = freereplyService.freereplyList(frvo);

	    return list;
	}
}