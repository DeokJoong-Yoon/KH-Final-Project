package com.myedumyselect.auth.controller;

import com.myedumyselect.auth.SessionInfo;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.support.SessionStatus;

@Slf4j
@Controller
public class AuthController {

    @PostMapping("/useraccount/logout")
    public String logout(HttpSession session) {
        log.info("로그아웃 처리");
        session.removeAttribute(SessionInfo.COMMON);
        return "redirect:/";
    }
}
