package com.myedumyselect.payment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.payment.dao.PaymentDAO;
import com.myedumyselect.payment.vo.PaymentVO;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	@Override
	public int paymentInsert(PaymentVO pvo) {
		int result = 0;
		
		result = paymentDAO.paymentInsert(pvo);
		return result;
	}

	@Override
	public PaymentVO paymentSelect(PaymentVO pvo) {
		PaymentVO result = null;
		
		result = paymentDAO.paymentSelect(pvo);
		return result;
	}

}
