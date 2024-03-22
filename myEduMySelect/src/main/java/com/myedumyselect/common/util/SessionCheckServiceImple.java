package com.myedumyselect.common.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.myedumyselect.academy.dao.AcademyLoginDao;
import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.auth.SessionInfo;
import com.myedumyselect.auth.vo.LoginVo;
import com.myedumyselect.payment.service.PaymentService;
import com.myedumyselect.personal.service.PersonalLoginService;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SessionCheckServiceImple implements SessionCheckService {

	@Setter(onMethod_ = @Autowired)
	private PaymentService paymentService;

	@Autowired
	private AcademyLoginDao academyLoginDao;

	@Setter(onMethod_ = @Autowired)
	private PersonalLoginService personalLoginService;

	@Override
	public String isAcademySessionCheck(HttpSession session, Model model, String alertMsg) {
		LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);
		// 로그인 세션여부 체크
		if (loginVo == null) {
			model.addAttribute("alertMsg", alertMsg);
			return "FALSE";
		} else {
			// 학원회원 체크
			if (loginVo.getMemberTypeId() == 1) {
				model.addAttribute("alertMsg", alertMsg);
				return "FALSE";
			} else {
				String academyId = loginVo.getId(); // 로그인 아이디 가져오기

				// academyId를 이용하여 학원 정보 조회
				AcademyLoginVO academyLoginVo = academyLoginDao.findById(academyId);
				model.addAttribute("alertMsg", alertMsg);
				// 학원 정보가 존재하면
				if (academyLoginVo != null) {
					log.info(academyLoginVo.toString());
					int result = paymentService.paymentCheck(academyLoginVo);
					if (result == 1) {
						model.addAttribute("academyLoginVo", academyLoginVo);
						return "TRUE";
					} else {
						model.addAttribute("alertMsg", alertMsg);
						return "FALSE";
					}
				} else {
					model.addAttribute("alertMsg", alertMsg);
					return "FALSE"; // 학원 정보가 존재하지 않는 경우
				}
			}
		}
	}

	@Override
	public String isPersonalSessionCheck(HttpSession session, Model model, String alertMsg) {
		LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);

		if (loginVo == null) {
			model.addAttribute("alertMsg", alertMsg);
			return "FALSE";
		} else {
			if (loginVo.getMemberTypeId() == 2) {
				model.addAttribute("alertMsg", alertMsg);
				return "FALSE";
			} else {
				log.info("회원 ID : " + loginVo.getId());
				PersonalLoginVO personalLoginVO = personalLoginService.findId(loginVo.getId());
				model.addAttribute("personalLoginVO", personalLoginVO);
				return "TRUE";
			}
		}
	}
}
