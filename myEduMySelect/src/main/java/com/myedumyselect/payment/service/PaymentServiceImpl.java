package com.myedumyselect.payment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.admin.member.vo.PersonalAdminVO;
import com.myedumyselect.common.file.FileUploadUtil;
import com.myedumyselect.commonboard.notice.vo.NoticeBoardVO;
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

	@Override
	public List<PaymentVO> boardList(PaymentVO paymentVO) {
		List<PaymentVO> list = null;
		list = paymentDAO.boardList(paymentVO);
		return list;
	}

	@Override
	public int boardListCnt(PaymentVO paymentVO) {
		return paymentDAO.boardListCnt(paymentVO);
	}

	@Override
	public PaymentVO boardDetail(PaymentVO paymentVO) {
		PaymentVO detail = paymentDAO.boardDetail(paymentVO);
		return detail;
	}

	@Override
	public int boardDelete(PaymentVO paymentVO) {
		int result = 0;
		result = paymentDAO.boardDelete(paymentVO);
		return result;
	}
}
