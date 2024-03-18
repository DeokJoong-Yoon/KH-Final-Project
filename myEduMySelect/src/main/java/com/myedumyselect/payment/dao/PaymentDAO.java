package com.myedumyselect.payment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.payment.vo.PaymentVO;

@Mapper
public interface PaymentDAO {
	public int paymentInsert(PaymentVO pvo);

	public PaymentVO paymentSelect(PaymentVO pvo);

	public List<PaymentVO> boardList(PaymentVO paymentVO);

	public int boardListCnt(PaymentVO paymentVO);
}
