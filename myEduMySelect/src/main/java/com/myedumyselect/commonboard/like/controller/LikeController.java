package com.myedumyselect.commonboard.like.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.myedumyselect.commonboard.like.service.LikeService;
import com.myedumyselect.commonboard.like.vo.LikeVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class LikeController {
    
    @Autowired
    private LikeService likeService;
    
    @PostMapping("/like/get")
    public int getLike(@RequestBody LikeVO likeVO, Model model) {
    	log.info("Getting like status for commonNo: {}", likeVO.getCommonNo());
    	int status = likeService.getLike(likeVO);
    	log.info("status : " + status);
    	model.addAttribute("like", likeVO);
        return status;
    }
    
    @PostMapping("/like/insert")
    public String insertLike(@RequestBody LikeVO likeVO) {
        log.info("Inserting like for commonNo: {}", likeVO.getCommonNo());
        int result = likeService.insertLike(likeVO);
        log.info("result : " + result);
        return (result == 1) ? "SUCCESS" : "FAILURE";
    }
    
    @PostMapping("/like/toggle")
    public String toggleLike(@RequestBody LikeVO likeVO, Model model) {
        log.info("Toggling like for commonNo: {}", likeVO.getCommonNo());
        int before = likeService.getLike(likeVO);
        int result = likeService.toggleLike(likeVO);
        int after = likeService.getLike(likeVO);
        log.info("before : " + before);
        log.info("after : " + after);
        log.info("result : " + result);
        
        String returnVal;
        if(after == 1) {
        	returnVal = "좋아요 등록";
        } else {
        	returnVal = "좋아요 취소";
        }
        return returnVal;
    }
    
    
}