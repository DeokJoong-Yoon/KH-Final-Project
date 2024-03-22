package com.myedumyselect.academy.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myedumyselect.academy.dao.AcademyLoginDao;
import com.myedumyselect.academy.service.AcademyLoginService;
import com.myedumyselect.academy.vo.AcademyLoginVO;

//import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes("academyLogin")       
public class AcademyLoginController {

   @Setter(onMethod_ = @Autowired)
   private AcademyLoginService academyLoginService;

   // 학원회원 로그인으로 이동
   @GetMapping("/academy/login")
   public String loginform() {
	   log.info("academyLogin 페이지 호출");
	   return "academy/login";
   }

   // 학원회원 로그인 POST
   @PostMapping("/academy/login")
   public String loginProcess(AcademyLoginVO login, Model model, 
            RedirectAttributes ras, HttpSession session) {
      
      Integer loginAttempts = (Integer) session.getAttribute("loginAttempts");
      Date bannedUntil = (Date) session.getAttribute("bannedUntil");
      // 세션에서 loginAttempts와 bannedUntil 속성을 가져온다. 결국 얘네도 변수 이름이다.
      // loginAttempts는 로그인 시도 횟수를, bannedUntil은 계정 잠금이 해제되는 시간을 나타낸다.
      // currentTiem는 현재시간을 나타내는 변수이다 . 밑에 System.currentTimeMillis()을 통해
      // 현재 시간을 밀리초 단위로 가져온다. 결론적으로 이 변수는 계정 잠금 해제 시간을 계산할때 사용한다.
      // lockoutTime 계정이 잠금되는 시간을 나타내는 변수이다 currentTime 와 똑같은 개념이다
      // ex) 1분은 60초 1초는 1000밀리초 그래서 10분을 밀리초 단위로 계산하면 10 * 60 * 1000 이렇게된다 10분 =
      // 600000 밀리초
      // currentTime + 600000 잠금이 풀리는 시간을 계산하면 이런식이다.

      // 즉시 잠금 해제
      // session.removeAttribute("bannedUntil");

      // 계정이 잠겨 있을 때
      if (bannedUntil != null && new Date().before(bannedUntil)) {
         long remainingTime = (bannedUntil.getTime() - new Date().getTime()) / (1000 * 60); // 잔여 시간(분)
         ras.addFlashAttribute("errorMsg", "계정이 잠겨 있습니다. 잠금 해제 시간까지 약 " + remainingTime + "분 남았습니다.");
         return "redirect:/academy/login";
      }
      // 계정이 잠겨 있고, 잠금 해제 시간이 현재 시간 이후인 경우를 검사한다.
      // 계정이 잠겨 있을 때 사용자에게 알림 메시지를 추가하고, 로그인 페이지로 리다이렉트한다.

      // 로그인 시도 횟수 카운트
      if (loginAttempts == null) {
         loginAttempts = 0;
      }
      // 로그인 시도 횟수를 확인하고, 값이 없으면 0으로 초기화한다.

      // 로그인 시도
      AcademyLoginVO academyLogin = academyLoginService.loginProcess(login);
      
      // AcademyLoginService를 통해 로그인을 시도한다.
      
      if (academyLogin != null) {         
         model.addAttribute("academyLogin", academyLogin);
         session.removeAttribute("loginAttempts");// 로그인이 성공한 경우, 모델에 로그인 정보를 추가하고, 세션에서 로그인 시도 횟수 속성을 제거한다.
         log.info("로그인 성공!");
      } else {
         loginAttempts++;
         session.setAttribute("loginAttempts", loginAttempts);

         if (loginAttempts >= 5) {
            long currentTime = System.currentTimeMillis();
            Date lockoutTime = new Date(currentTime + (10 * 60 * 1000)); // 10분 후 시간
            session.setAttribute("bannedUntil", lockoutTime);

            long remainingTime = (lockoutTime.getTime() - new Date().getTime()) / (1000 * 60); // 잔여 시간(분)
            ras.addFlashAttribute("loginAttempts", "5/5");
            ras.addFlashAttribute("errorMsg",
                  "아이디 및 비밀번호 입력 5회 이상 실패하였습니다. 계정 로그인이 10분간 제한됩니다. 잠금 해제 시간까지 약 " + remainingTime + "분 남았습니다.");
            ras.addFlashAttribute("bannedUntil", lockoutTime);

            return "redirect:/academy/login";
         } else {
            ras.addFlashAttribute("errorMsg",
                  "아이디 또는 비밀번호를 잘못 입력하셨습니다. 입력하신 내용을 다시 확인해주세요.로그인 시도 횟수: " + loginAttempts + "/5");
            log.warn("로그인 실패  현재 로그인 시도 횟수: " + loginAttempts);
            return "redirect:/academy/login";
         } // 로그인이 실패한 경우, 로그인 시도 횟수를 증가시키고, 잠금 시간을 설정한다.
            // 잠금 시간까지 남은 시간을 계산하고, 알림 메시지를 추가하여 사용자에게 알린다.
            // 로그인 시도 횟수가 5회 이상이면 계정을 잠그고, 잠금 해제 시간까지 알려주는 알림 메시지를 추가한다.
            // 로그인 시도 횟수가 5회 미만인 경우, 실패 메시지와 함께 로그인 페이지로 리다이렉트한다.
      }
      //log.info("학원 회원 로그인 성공");
      log.info("로그인 성공: 학원회원 ID - " + academyLogin.getAcademyId());
      return "redirect:/academy/login"; // 로그인이 성공하거나 실패한 후에는 항상 로그인 페이지로 리다이렉트한다.
   }
   
   // 로그아웃 처리
   @PostMapping("/academy/logout")
   public String logout(SessionStatus sessionStatus) {
	   log.info("로그아웃 처리");
	   sessionStatus.setComplete();
	   return "redirect:/academy/login";
   }
      
   //학원회원 가입 페이지
   @GetMapping(value = "/academy/join")
   public String academyjoinForm() {
	   log.info("academyjoinForm 호출 성공");
	   return "academy/academyJoin";
   }
   
   // 학원회원 회원가입 POST
   @PostMapping("/academyInsert")
   public String academyInsert(AcademyLoginVO login) {
	   
       log.info("academyInsert 호출 성공");               
       academyLoginService.academyInsert(login);            
       return "redirect:/academy/join/complete";
   }


   // 학원회원 회원가입 완료 페이지로 이동
   @GetMapping("/academy/join/complete")
   public String completeSignUp(@ModelAttribute AcademyLoginVO academyLoginVO) {
      // 회원가입 완료 페이지로 이동
      return "/academy/completeJoin";
   }

   // 학원회원 마이페이지로 이동
   @GetMapping(value = "/academy/mypage")
   public String mypage(@SessionAttribute("academyLogin") AcademyLoginVO academyLoginVO, RedirectAttributes redirectAttributes, Model model) {
	   
      //AcademyLoginVO academyLoginVO = (AcademyLoginVO) session.getAttribute("academyLogin");
      //academyLoginService.loginProcess(academyLoginVO);
      log.info("학원회원 mypage 접속!");      
      
      /* 로그인이 되어있지 않다면 */
      if (academyLoginVO == null) {
    	  redirectAttributes.addFlashAttribute("errorMsg", "로그인 후 이용해주세요.");         
         return "/academy/login";
      } 
            
      //model.addAttribute("academyLoginVO", academyLoginVO);
      log.info("학원회원 정보 불러오기 {} : ", academyLoginVO);      
      return "/academy/mypage";   
      
      /*
      // 로그인된 경우에는 학원 정보를 가져와서 모델에 추가
      String academyId = academyLogin.getAcademyId();
      AcademyLoginVO academyLoginVO = academyLoginService.findById(academyId);
                  
       if (academyLoginVO != null) {
           model.addAttribute("academyLoginVo", academyLoginVO);
           
           // 담당자 전화번호 모델에 등록
           if(academyLoginVO.getAcademyManagerPhone() != null) {
               model.addAttribute("academyManagerPhone", academyLoginVO.getAcademyManagerPhone());
           }
           // 학원 전화번호 모델에 등록
           if(academyLoginVO.getAcademyPhone() != null) {
               model.addAttribute("academyPhone", academyLoginVO.getAcademyPhone());
           }       
           // 담당자 이름 모델에 등록
           if(academyLoginVO.getAcademyManagerName() != null) {
               model.addAttribute("academyManagerName", academyLoginVO.getAcademyManagerName());
           }
       } else {
           // 학원 정보가 없을 경우 처리
           academyLoginVO = new AcademyLoginVO();
           model.addAttribute("academyLoginVo", academyLoginVO);
       }*/

         
   }

   // 아이디 중복체크
   @PostMapping("/checkId")
   @ResponseBody
   public int checkId(@RequestParam("academyId") String academyId) {
      return academyLoginService.checkId(academyId);
   }

   // 이메일 중복체크
   @PostMapping("/checkEmail")
   @ResponseBody
   public int checkEmail(@RequestParam("academyManagerEmail") String academyManagerEmail) {
       return academyLoginService.checkEmail(academyManagerEmail);
   }

   // 사업자등록번호 조회 및 중복여부 확인
   @PostMapping("/findByNumber")
   @ResponseBody
   public AcademyLoginVO findByNumber(@RequestParam("academyNumber") String academyNumber) {
      return academyLoginService.findByNumber(academyNumber);
   }

   // 마이페이지 회원정보 수정
   @PostMapping("/academyUpdate")
   public String academyUpdate(@ModelAttribute AcademyLoginVO academyLogin, @SessionAttribute("academyLogin") AcademyLoginVO sessionAcademyLogin, Model model) {
            
      
//      AcademyLoginVO sessionAcademyLogin = (AcademyLoginVO) session.getAttribute("academyLogin");        
       
      System.out.println(sessionAcademyLogin.toString());
      sessionAcademyLogin.setAcademyManagerName(academyLogin.getAcademyManagerName());
      sessionAcademyLogin.setAcademyManagerEmail(academyLogin.getAcademyManagerEmail());
      sessionAcademyLogin.setAcademyManagerPhone(academyLogin.getAcademyManagerPhone());      
      sessionAcademyLogin.setAcademyPhone(academyLogin.getAcademyPhone());
      sessionAcademyLogin.setAcademyTargetSubject(academyLogin.getAcademyTargetSubject());
      /**/
      //log.info("newAcademyInfo 정보 {} : ", academyLogin);
      
      // 학원 회원 정보가 null이 아니면 모델에 추가
		/*
		 * if(academyLoginVO != null) {
		 * 
		 * model.addAttribute("academyLoginVo", academyLoginVO);
		 * log.info("academyLoginVo null값 아닐 때 모델에 정상 등록 {} : ", academyLoginVO); } else
		 * { academyLoginVO = new AcademyLoginVO(); model.addAttribute("academyLoginVo",
		 * academyLoginVO); log.info("academyLoginVo null값 일 때 {} : ", academyLoginVO);
		 * }
		 */
      
      // 학원 정보 업데이트
      // academyLoginService의 academyUpdate 메서드를 호출하여 데이터베이스에 개인 정보를 업데이트
      int result = academyLoginService.academyUpdate(sessionAcademyLogin);
      //log.info("sessionAcademyLogin.toString() 2번 {} : ", academyLoginVo.toString());
      log.info("result값 {} : ", result);
      
      // 업데이트가 실패하면 에러 메시지를 추가하고 로그인 페이지로 리다이렉트
      if (result == 0) {         
         model.addAttribute("errorMsg", "개인 정보 업데이트에 실패했습니다. 다시 시도해 주세요.");
         return "redirect:/academy/mypage";
      } 
      
      
      // 업데이트 성공 시
      model.addAttribute("academyLogin", sessionAcademyLogin);
//      model.  ("academyLogin", sessionAcademyLogin);
      //model.addAttribute(academyLogin);
      //log.info("모델에 academyLoginVo 등록 {} : ", sessionAcademyLogin);
      
   // 업데이트가 성공하면 세션에 업데이트된 academyLoginVo 객체를 저장하고 마이 페이지로 리다이렉트
      
      return "/academy/mypage";
      
      
      //model.addAttribute(result);
      
   }

   /* 비밀번호 변경 */
   @GetMapping("/passwdChangePage")
   public String passwdChangePage(Model model, HttpSession session, RedirectAttributes redirectAttributes) {

      AcademyLoginVO academyLoginVO = (AcademyLoginVO) session.getAttribute("academyLogin");           
      if (academyLoginVO == null) {
    	  return "redirect:/useraccount/login";
      }
      model.addAttribute("academyLogin", academyLoginVO);
      return "academy/passWd";
   }

   /* 비밀번호 변경 POST */
   @PostMapping("/passwdChange")
   public String updatePasswdChangeDate(@ModelAttribute AcademyLoginVO academyLogin, HttpSession session, Model model,
           RedirectAttributes redirectAttributes) {
      
      
       // 세션에서 academyLogin 객체 가져오기
       AcademyLoginVO academyLoginVO = (AcademyLoginVO) session.getAttribute("academyLogin");
       log.info("세션에서 가져온 academyLoginVO 객체 정보 {} : ", academyLoginVO);             
       // 새로운 비밀번호 설정
       academyLoginVO.setAcademyPasswd(academyLogin.getAcademyPasswd());            

       // 변경된 비밀번호 업데이트
       int result = academyLoginService.updatePasswdChangeDate(academyLoginVO);

       if (result == 0) {
           redirectAttributes.addFlashAttribute("errorMsg", "개인 정보 업데이트에 실패했습니다. 다시 시도해 주세요.");
           return "redirect:/academy/login";
       }

       // 세션에 academyLoginVO 객체를 다시 설정
       session.setAttribute("academyLoginVO", academyLoginVO);               
       log.info("비밀번호 변경 완료 {} : ", academyLoginVO);              
       redirectAttributes.addFlashAttribute("errorMsg", "비밀번호 변경 완료");

       // 로그아웃 후 리다이렉트
       session.invalidate(); // 세션 무효화
       log.info("비밀번호 변경완료, 다시 로그인");
       return "redirect:/academy/login";
   }


   /*
    * @PostMapping("/checkCurrentPassword")
    * 
    * @ResponseBody public boolean checkCurrentPassword(@RequestParam("academyId")
    * String academyId,
    * 
    * @RequestParam("currentPassword") String currentPassword) { // 현재 비밀번호가 일치하는지
    * 확인하는 로직을 추가 //boolean isValidPassword =
    * academyLoginService.updatePasswdChangeDate(AcademyLoginVo
    * AcademyLoginVo.builder()); //return isValidPassword; }
    */

}