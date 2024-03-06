package com.myedumyselect.payment.dao;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.payment.vo.PaymentVO;

@Mapper
public interface PaymentDAO {
	public int paymentInsert(PaymentVO pvo);
}
