package com.myedumyselect.commonboard.like.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.myedumyselect.commonboard.like.service.LikeService;
import com.myedumyselect.commonboard.like.vo.LikeVO;

@RestController
public class LikeController {

	@Autowired
	private LikeService lservice;
	
	@PostMapping("/like")
	public @ResponseBody String likeProcess(@RequestBody LikeVO lVO) {
		lservice.likeProcess(lVO);
		return "success";
	}
	
	@GetMapping("/like/count")
	public @ResponseBody int getLikeCount(@RequestParam("commonNo") int commonNo) {
		return lservice.getLikeCount(commonNo);
	}
	
	@GetMapping("/like/view")
	public String likeView(@RequestParam("commonNo") int commonNo, Model model) {
		int likeCount = lservice.getLikeCount(commonNo);
        model.addAttribute("likeCount", likeCount);
        return "likeView";
	}
}
