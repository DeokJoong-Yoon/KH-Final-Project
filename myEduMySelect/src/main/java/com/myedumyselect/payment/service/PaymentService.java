package com.myedumyselect.payment.service;

import java.util.List;

import com.myedumyselect.payment.vo.PaymentVO;

public interface PaymentService {

	public int paymentInsert(PaymentVO pvo);

	public PaymentVO paymentSelect(PaymentVO pvo);

	public List<PaymentVO> boardList(PaymentVO paymentVO);

	public int boardListCnt(PaymentVO paymentVO);

}
