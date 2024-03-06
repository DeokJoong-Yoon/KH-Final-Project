package com.myedumyselect.payment;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.myedumyselect.payment.dao.PaymentDAO;
import com.myedumyselect.payment.vo.PaymentVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class PaymentDAOTests {

	@Setter(onMethod_ = @Autowired)
	private PaymentDAO paymentDAO;
	
	@Test
	public void paymentInsert() {
		PaymentVO pvo = new PaymentVO();
		pvo.setPaymentId("paymentID");
		pvo.setPg("setPg");
		pvo.setPayMethod("setPayMethod");
		pvo.setMerchantUid("setMerchantUid");
		pvo.setName("name");
		pvo.setAmount("98000");
		pvo.setAcademyId("academyid");
		pvo.setAcademyNumber("1234512345");
		pvo.setAcademyName("KH");
		pvo.setAcademyManagerName("담당자윤덕중");
		pvo.setAcademyManagerEmail("ykdj92@naver.com");
		pvo.setAcademyManagerPhone("01072098826");

		log.info("insert 결과 : " + paymentDAO.paymentInsert(pvo));
	}
}
