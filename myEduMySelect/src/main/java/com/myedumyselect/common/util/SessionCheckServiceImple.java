package com.myedumyselect.common.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.myedumyselect.academy.dao.AcademyLoginDao;
import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.payment.service.PaymentService;
import com.myedumyselect.personal.service.PersonalLoginService;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import lombok.Setter;
//import lombok.extern.slf4j.Slf4j;
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
	public String isAcademySessionCheck(
			@SessionAttribute(value = "academyLogin", required = false) AcademyLoginVO academyLoginVO, Model model) {

		// 로그인 세션여부 체크
		if (academyLoginVO == null) {
			model.addAttribute("alertMsg", "로그인이 필요한 서비스입니다.");
			return "redirect:/loginselect";
		} else {
			// 학원회원 체크
			if (academyLoginVO.getMemberTypeId() == 1) {
				model.addAttribute("alertMsg", "개인회원은 접근 불가한 서비습니다.");
				return "redirect:/";
			} else {
				String academyId = academyLoginVO.getAcademyId(); // 로그인 아이디 가져오기

				// academyId를 이용하여 학원 정보 조회
				AcademyLoginVO selectedAcademyLoginVO = academyLoginDao.findById(academyId);
//				model.addAttribute("alertMsg", alertMsg);
				// 학원 정보가 존재하면
				if (selectedAcademyLoginVO != null) {
					Integer result = paymentService.paymentCheck(selectedAcademyLoginVO);
					if (result != null && result.intValue() == 1) {
						model.addAttribute("academyLoginVO", selectedAcademyLoginVO);
						return "TRUE";
					} else {
						// not payment
						model.addAttribute("alertMsg", "결제가 필요한 서비스입니다.");
						return "redirect:/payment/payMain";
					}
				} else {
					model.addAttribute("alertMsg", "회원 정보가 존재하지 않습니다.");
					return "redirect:/"; // 학원 정보가 존재하지 않는 경우
				}
			}
		}
	}

	@Override
	public String isPersonalSessionCheck(
			@SessionAttribute(value = "personalLogin", required = false) PersonalLoginVO personalLoginVO, Model model) {

		if (personalLoginVO == null) {
			model.addAttribute("alertMsg", "로그인이 필요합니다.");
			return "redirect:/loginselect";
		} else {
			if (personalLoginVO.getMemberTypeId() == 2) {
				model.addAttribute("alertMsg", "학원회원은 접근 불가한 서비습니다.");
				return "redirect:/";
			} else {
				PersonalLoginVO selectedPersonalLoginVO = personalLoginService.personalMyPage(personalLoginVO);
				model.addAttribute("personalLoginVO", selectedPersonalLoginVO);
				return "TRUE";
			}
		}
	}

}
