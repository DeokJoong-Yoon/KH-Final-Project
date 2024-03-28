package com.myedumyselect.academy.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myedumyselect.academy.service.AcademyAdvertiseService;
import com.myedumyselect.academy.service.AcademyLoginService;
import com.myedumyselect.academy.service.AcademyMatchingBoardService;
import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.client.main.vo.PageDTO;
import com.myedumyselect.common.util.SessionCheckService;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;
import com.myedumyselect.matching.comment.vo.MatchingCommentVO;

import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes("academyLogin")
public class AcademyLoginController {

   @Setter(onMethod_ = @Autowired)
   private AcademyLoginService academyLoginService;

   @Autowired
   private AcademyAdvertiseService academyAdvertiseService;

   @Autowired
   private AcademyMatchingBoardService academyMatchingBoardService;

   @Autowired
   private SessionCheckService sessionCheckService;   

   /*************************************************************
    * Academy Login
    *************************************************************/
   // 학원회원 로그인으로 이동
   @GetMapping("/academy/login")
   public String loginform() {
      return "academy/login";
   }

   // 학원회원 로그인 POST
   @PostMapping("/academy/login")
   public String loginProcess(AcademyLoginVO login, Model model, RedirectAttributes ras, HttpSession session) {
      
      AcademyLoginVO triedAcademy = new AcademyLoginVO();
      AcademyLoginVO bannedUntilAcademy = new AcademyLoginVO();
      
      triedAcademy.setAcademyId(login.getAcademyId());
      bannedUntilAcademy.setAcademyId(login.getAcademyId());
      
      // 게정이 잠겨있을 때
      if (session.getAttribute("bannedUntil_" + triedAcademy.getAcademyId()) != null && new Date().before((Date)session.getAttribute("bannedUntil_" + triedAcademy.getAcademyId()))) {
           long remainingTime = (((Date)session.getAttribute("bannedUntil_" + triedAcademy.getAcademyId())).getTime() - new Date().getTime()) / (1000 * 60* 10); // 잔여 시간(분)
           ras.addFlashAttribute("errorMsg", "계정이 잠겨 있습니다. 잠금 해제 시간까지 약 " + remainingTime + "분 남았습니다.");
           return "redirect:/academy/login";
       }
      
      triedAcademy = academyLoginService.loginTryCount(triedAcademy);
       int academyLoginFailCount = triedAcademy.getAcademyLoginFailCount();
       log.info("현재 실패 횟수 : " + academyLoginFailCount);
      
      // 로그인 시도
      AcademyLoginVO academyLogin = academyLoginService.loginProcess(login);
      
      if (academyLogin != null) {
         model.addAttribute("academyLogin", academyLogin);
         academyLogin.setAcademyLoginFailCount(0);
         academyLoginService.updateAcademyLoginFailCount(academyLogin);
      } else {
         // academyLoginFailCount 업데이트
         academyLoginFailCount++;
         triedAcademy.setAcademyLoginFailCount(triedAcademy.getAcademyLoginFailCount() + 1);
         academyLoginService.updateAcademyLoginFailCount(triedAcademy);
         
         if (triedAcademy.getAcademyLoginFailCount() >= 5) {
            long currentTime = System.currentTimeMillis();
            Date lockoutTime = new Date(currentTime + (10 * 60 * 1000)); // 10분 후 시간
            session.setAttribute("bannedUntil_" + triedAcademy.getAcademyId(), lockoutTime);

            long remainingTime = (lockoutTime.getTime() - new Date().getTime()) / (1000 * 60); // 잔여 시간(분)
            ras.addFlashAttribute("errorMsg",
                  "아이디 및 비밀번호 입력 5회 이상 실패하였습니다. 계정 로그인이 10분간 제한됩니다. 잠금 해제 시간까지 약 " + remainingTime + "분 남았습니다.");
            ras.addFlashAttribute("bannedUntil", lockoutTime);

            return "redirect:/academy/login";
         } else {
            ras.addFlashAttribute("errorMsg",
                  "아이디 또는 비밀번호를 잘못 입력하셨습니다. 입력하신 내용을 다시 확인해주세요.로그인 시도 횟수: " + triedAcademy.getAcademyLoginFailCount() + "/5");
            return "redirect:/academy/login";
         } 
      }
      // 로그인이 성공하거나 실패한 후에는 항상 로그인 페이지로 리다이렉트
      return "redirect:/academy/login"; 
   }

   /*************************************************************
    * Academy Logout
    *************************************************************/
   // 로그아웃 처리
   @PostMapping("/academy/logout")
   public String logout(SessionStatus sessionStatus) {
      sessionStatus.setComplete();
      return "redirect:/loginselect";
   }

   @GetMapping("/academy/logout")
   public String getLogout(SessionStatus sessionStatus) {
      sessionStatus.setComplete();
      return "redirect:/loginselect";
   }

   /*************************************************************
    * Academy Join
    *************************************************************/
   // 학원회원 가입 페이지
   @GetMapping(value = "/academy/join")
   public String academyjoinForm() {
      return "academy/academyJoin";
   }

   // 학원회원 회원가입 POST
   @PostMapping(value = "/academyInsert")
   @ResponseBody
   public String academyInsert(@RequestBody AcademyLoginVO login) {
      academyLoginService.academyInsert(login);
      return "TRUE";
   }

   // 학원회원 회원가입 완료 페이지로 이동
   @GetMapping("/academy/join/complete")
   public String completeSignUp(@ModelAttribute AcademyLoginVO academyLoginVO) {
      return "/academy/completeJoin";
   }

   /*************************************************************
    * Academy mypage
    *************************************************************/
   // 학원회원 마이페이지로 이동
   @GetMapping(value = "/academy/mypage")
   public String academyMypage(
         @SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO,
         RedirectAttributes ras, Model model) {

      if (academyLoginVO == null) {
         model.addAttribute("confirmMsg", "로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
         return "/loginselect";
      } else if (academyLoginVO.getMemberTypeId() == 1) {
         ras.addFlashAttribute("errorMsg", "잘못된 접근입니다.");
         return "/loginselect";
      }
      return "/academy/mypage";
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
   public String academyUpdate(@ModelAttribute AcademyLoginVO academyLogin,
         @SessionAttribute("academyLogin") AcademyLoginVO sessionAcademyLogin, Model model) {

      System.out.println(sessionAcademyLogin.toString());
      sessionAcademyLogin.setAcademyManagerName(academyLogin.getAcademyManagerName());
      sessionAcademyLogin.setAcademyManagerEmail(academyLogin.getAcademyManagerEmail());
      sessionAcademyLogin.setAcademyManagerPhone(academyLogin.getAcademyManagerPhone());
      sessionAcademyLogin.setAcademyPhone(academyLogin.getAcademyPhone());
      sessionAcademyLogin.setAcademyTargetSubject(academyLogin.getAcademyTargetSubject());
      sessionAcademyLogin.setAcademyTargetGrade(academyLogin.getAcademyTargetGrade());
      sessionAcademyLogin.setAcademyFee(academyLogin.getAcademyFee());
      sessionAcademyLogin.setAcademyKeyword1(academyLogin.getAcademyKeyword1());
      sessionAcademyLogin.setAcademyKeyword2(academyLogin.getAcademyKeyword2());
      sessionAcademyLogin.setAcademyKeyword3(academyLogin.getAcademyKeyword3());
      sessionAcademyLogin.setAcademyKeyword4(academyLogin.getAcademyKeyword4());
      sessionAcademyLogin.setAcademyKeyword5(academyLogin.getAcademyKeyword5());

      int result = academyLoginService.academyUpdate(sessionAcademyLogin);

      // 업데이트가 실패하면 에러 메시지를 추가하고 로그인 페이지로 리다이렉트
      if (result == 0) {
         model.addAttribute("errorMsg", "개인 정보 업데이트에 실패했습니다. 다시 시도해 주세요.");
         return "redirect:/academy/mypage";
      }
      model.addAttribute("academyLogin", sessionAcademyLogin);
      return "/academy/mypage";
   }

   /* 비밀번호 변경 */
   @GetMapping("/passwdChangePage")
   public String passwdChangePage(@SessionAttribute("academyLogin") AcademyLoginVO academyLoginVO) {

      if (academyLoginVO == null) {
         return "redirect:/academy/login";
      }

      return "academy/passWd";
   }

   /* 비밀번호 변경 POST */
   @ResponseBody
   @PostMapping("/updatePasswdChangeDate")
   public String updatePasswdChangeDate(@RequestParam("currentPassword") String currentPassword,
         @RequestParam("newPassword") String newPassword, @RequestParam("renewPassword") String renewPassword,
         @SessionAttribute("academyLogin") AcademyLoginVO academyLoginVO, RedirectAttributes ras, Model model) {
      AcademyLoginVO curAcademyLogin = new AcademyLoginVO();
      curAcademyLogin.setAcademyId(academyLoginVO.getAcademyId());
      curAcademyLogin.setAcademyPasswd(currentPassword);
      AcademyLoginVO checkPassword = academyLoginService.loginProcess(curAcademyLogin);
      
      // 현재 계정의 패스워드 재확인
      if (checkPassword != null) {
         if (!renewPassword.equals(newPassword)) {
            ras.addFlashAttribute("errorMsg", "새 비밀번호가 일치하지 않습니다.");
            return "FALSE";
         }
         int result = 0;
         checkPassword.setAcademyPasswd(renewPassword);
         result = academyLoginService.updatePasswdChangeDate(checkPassword);
         if (result == 1) {
            model.addAttribute("academyLogin", academyLoginService.loginProcess(checkPassword));
            ras.addFlashAttribute("successMsg", "패스워드 변경 완료");
            return "TRUE";
         }
      } else {
         ras.addFlashAttribute("errorMsg", "패스워드가 맞지 않습니다.");
         return "FALSE";
      }

      ras.addFlashAttribute("errorMsg", "패스워드 변경 실패");
      return "FALSE";
   }

   /*************************************************************
    * Academy Advertise
    *************************************************************/
   /* 사용자가 작성한 홍보 게시글 목록 보기 페이지로 이동 */
   @GetMapping("/academy/advertiseList")
   public String academyAdvertiseList(
         @SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO,
         RedirectAttributes ras, Model model, AdvertiseVO advertiseVO) {
      
      /* 학원전용 GetMapping 제어 */
      if (academyLoginVO != null) {
         String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
         if (academyResult != "TRUE") {
            return academyResult;
         }
      } else {
         model.addAttribute("confirmMsg", "로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
         return "redirect:/loginselect";
      }

      advertiseVO.setAcademyId(academyLoginVO.getAcademyId());
      academyAdvertiseService.advertiseList(advertiseVO);
      List<AdvertiseVO> advertiseList = academyAdvertiseService.advertiseList(advertiseVO);
      model.addAttribute("advertiseList", advertiseList);

      // 전체 레코드수 반환.
      int total = academyAdvertiseService.advertiseListCnt(advertiseVO);
      // 페이징 처리
      model.addAttribute("pageMaker", new PageDTO(advertiseVO, total));
      model.addAttribute("kwd", advertiseVO.getKeyword());
      return "academy/academyAdvertiseList"; // 사용자가 작성한 홍보 게시글 목록을 보여주는 페이지로 이동
   }

   /*************************************************************
    * Academy Matching
    *************************************************************/
   /* 사용자가 작성한 매칭 게시글 댓글 목록 보기 페이지로 이동 */
   @GetMapping("/academy/matchingBoardList")
   public String academyMatchingBoardList(MatchingBoardVO matchingBoardVO, MatchingCommentVO mcVO, Model model,
         @SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO,
         RedirectAttributes ras) {

      /* 학원전용 GetMapping 제어 */
      if (academyLoginVO != null) {
         String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
         if (academyResult != "TRUE") {
            ras.addFlashAttribute("errorMsg", "잘못된 접근입니다.");
            return academyResult;
         }
      } else {
         model.addAttribute("confirmMsg", "로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
         return "redirect:/loginselect";
      }
      
      // 본인 아이디 가져오기
      String academyId = academyLoginVO.getAcademyId();
      // 댓글 단 게시물 번호 목록 조회 
      List<Integer> commentedNos = academyMatchingBoardService.getCommentMatchingNos(academyLoginVO);
      List<MatchingBoardVO> matchingBoardList = academyMatchingBoardService.getCommented(academyLoginVO);
      
        // 전체 레코드 수 반환
        int total = academyMatchingBoardService.boardListCnt(matchingBoardVO);
        
        model.addAttribute("commentedNos", commentedNos);
      model.addAttribute("academyId", academyId);
      model.addAttribute("matchingBoardList", matchingBoardList);
        model.addAttribute("pageMaker", new PageDTO(matchingBoardVO, total));
        model.addAttribute("kwd", matchingBoardVO.getKeyword());
        
        return "academy/academyMatchingBoardList"; // 사용자가 작성한 매칭 게시글 목록을 보여주는 페이지로 이동
   }

   /*************************************************************
    * Academy Withdrawal passCheck
    *************************************************************/
   /* 회원탈퇴 하기 전 비밀번호 현재 비밀번호 인증하는 페이지로 이동 */
   @GetMapping("/academyWithdrawal")
   public String academyWithdrawal(
         @SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO, Model model) {
      if (academyLoginVO == null) {
         return "redirect:/";
      }
      return "academy/withdrawalAcademy";
   }
   
   /* 회원탈퇴페이지 POST */
   @ResponseBody
   @PostMapping(value = "/withdrawalAcademy")
   public String withdrawalAcademy(@RequestParam("currentPassword") String currentPassword,
         @SessionAttribute("academyLogin") AcademyLoginVO academyLoginVO, RedirectAttributes ras) {
      AcademyLoginVO curAcademyLogin = new AcademyLoginVO();
      curAcademyLogin.setAcademyId(academyLoginVO.getAcademyId());
      curAcademyLogin.setAcademyPasswd(currentPassword);

      AcademyLoginVO checkPasswd = academyLoginService.loginProcess(curAcademyLogin);

      if (checkPasswd != null) {
         // 현재 비밀번호 일치
         return "TRUE";
      } else {
         // 현재 비밀번호 불일치
         ras.addFlashAttribute("errorMsg", "현재 비밀번호가 일치하지 않습니다.");
         return "FALSE";
      }
   }
}