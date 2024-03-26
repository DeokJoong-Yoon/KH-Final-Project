package com.myedumyselect.commonboard.like.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.myedumyselect.commonboard.like.service.LikeService;
import com.myedumyselect.commonboard.like.vo.LikeVO;


@RestController
public class LikeController {
    
    @Autowired
    private LikeService likeService;
    
    //좋아요 상태 체크
    @PostMapping("/like/get")
    public int getLike(@RequestBody LikeVO likeVO, Model model) {
    	int status = likeService.getLike(likeVO);
    	model.addAttribute("like", likeVO);
        return status;
    }
    
    
    //좋아요 최초 등록
    @PostMapping("/like/insert")
    public int insertLike(@RequestBody LikeVO likeVO) {
        int result = likeService.insertLike(likeVO);
        return result;
    }
    
    
    //좋아요 토글
    @PostMapping("/like/toggle")
    public String toggleLike(@RequestBody LikeVO likeVO, Model model) {
        likeService.getLike(likeVO);
        likeService.toggleLike(likeVO);
        int result = likeService.getLike(likeVO);
        
        String returnVal;
        if(result == 1) {
        	returnVal = "좋아요 등록";
        } else {
        	returnVal = "좋아요 취소";
        }
        return returnVal;
    }
    
    
}