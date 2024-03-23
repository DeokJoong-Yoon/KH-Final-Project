package com.myedumyselect.payment.service;

import java.util.List;

import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.payment.vo.PaymentVO;

public interface PaymentService {

	public int paymentInsert(PaymentVO pvo);

	public PaymentVO paymentSelect(PaymentVO pvo);

	public List<PaymentVO> boardList(PaymentVO paymentVO);

	public int boardListCnt(PaymentVO paymentVO);

	public PaymentVO boardDetail(PaymentVO paymentVO);

	public int boardDelete(PaymentVO paymentVO);

	public Integer paymentCheck(AcademyLoginVO academyLoginVo);

}
