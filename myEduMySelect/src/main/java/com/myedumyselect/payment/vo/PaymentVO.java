package com.myedumyselect.payment.vo;

import com.myedumyselect.admin.board.free.vo.FreeBoardAdminVO;
import com.myedumyselect.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class PaymentVO extends CommonVO {
	private String paymentId = "";
	private String pg = "";
	private String payMethod = "";
	private String merchantUid = "";
	private String name = "";
	private int aamount = 0;
	private String academyId = "";
	private String academyNumber = "";
	private String academyName = "";
	private String academyManagerName = "";
	private String academyManagerEmail = "";
	private String academyManagerPhone = "";
	private String paymentStatus = "";
	private String paymentDate = "";
}
