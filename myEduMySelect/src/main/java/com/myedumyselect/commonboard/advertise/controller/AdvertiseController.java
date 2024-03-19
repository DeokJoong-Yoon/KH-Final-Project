package com.myedumyselect.commonboard.advertise.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myedumyselect.common.SessionUtil;
import com.myedumyselect.common.vo.PageDTO;
import com.myedumyselect.commonboard.advertise.service.AdvertiseService;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;
import com.myedumyselect.commonboard.like.vo.LikeVO;

import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/advertise/*")
@Slf4j
public class AdvertiseController {
	
	@Setter(onMethod_ = @Autowired)
	private AdvertiseService aService;
	
	// 홍보게시판 목록 전체보기 구현
	@GetMapping("/advertiseBoardList")
	public String advertiseList(@ModelAttribute AdvertiseVO aVO, Model model, HttpSession session) {
		log.info("advertiseBoardList() 호출 성공");
		
		//개인회원 로그인 세션 받기
		SessionUtil.personalLoginCheck(session, model, "로그인 후 열람 가능합니다.");
		
		//전체 레코드 조회
		List<AdvertiseVO> advertiseList = aService.advertiseList(aVO);
		model.addAttribute("advertiseList", advertiseList);
		
		//전체 레코드 수 반환
		int total = aService.advertiseListCnt(aVO);
		
		//페이징 처리
		model.addAttribute("pageMaker", new PageDTO(aVO, total));
		model.addAttribute("kwd", aVO.getKeyword());
		
		return "board/advertise/advertiseBoardList";
	}
	
	
	//홀보게시판 글쓰기 입력 폼 출력
	@GetMapping("/advertiseWriteForm")
	public String writeForm(Model model, HttpSession session) {
		log.info("writeForm 호출 성공");
		
		//개인회원 로그인 세션 받기
		SessionUtil.personalLoginCheck(session, model, "로그인 후 열람 가능합니다.");
		
		return "board/advertise/advertiseInsertForm";
	}
	
	
	//홍보게시판 글 등록
	@PostMapping("/advertiseInsert")
	public String advertiseInsertWithFiles(@ModelAttribute AdvertiseVO aVO,
											@RequestParam("file1") MultipartFile file1,
								            @RequestParam("file2") MultipartFile file2,
								            @RequestParam("file3") MultipartFile file3,
								            @RequestParam("file4") MultipartFile file4,
								            @RequestParam("file5") MultipartFile file5) throws Exception {
        
        aService.advertiseInsertWithFiles(aVO, Arrays.asList(file1, file2, file3, file4, file5));
        return "redirect:/advertise/advertiseBoardList"; 
	}
	
	
	//홍보게시판 게시글 상세 보기
	@GetMapping("/advertiseDetail")
	public String advertiseDetail(AdvertiseVO aVO, Model model) {
		log.info("advertiseDetail() 메소드 호출");
		
		AdvertiseVO detail = aService.advertiseDetail(aVO);
		model.addAttribute("detail", detail);
		
		log.info(detail.toString());
		
		
//		//찜
//		LikeVO like = new LikeVO();
//		like.setCommonNo(aVO.getCommonNo());
//		like.setLikeMemberId(aVO.ge)
//		
		return "board/advertise/advertiseBoardDetail";
	}
	
	
	
	
}
