package com.myedumyselect.academy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.myedumyselect.academy.service.AcademyService;
import com.myedumyselect.academy.vo.AcademyVo;



@Controller
public class AcademyController {
    @Autowired
    private AcademyService academyService;

    @GetMapping("/userAccount/join/academy")
    public String signUpForm(Model model) {
        AcademyVo academyVo = academyService.getAcademyVo();
        model.addAttribute("academyInfo", academyVo);
        return "academySignUp"; // signUp.jsp 페이지로 이동
    }
    
    /* 수정해야함 일단 적어놓음
    @PostMapping("/saveKeywords")
    public ResponseEntity<String> saveKeywords(@RequestParam("keywords") List<String> keywords) {
        // keywords를 순회하면서 데이터베이스에 저장
        for (int i = 0; i < keywords.size(); i++) {
            String keyword = keywords.get(i);
            // 키워드를 데이터베이스에 저장하는 로직 구현
            // 예를 들어, i 번째 키워드를 academy_keyword(i+1) 컬럼에 저장할 수 있습니다.
        }
        return ResponseEntity.ok("Keywords saved successfully");
    }
    */
}
