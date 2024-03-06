package com.myedumyselect.payment.vo;

import lombok.Data;

@Data
public class PaymentVO {
	private String paymentId;
	private String pg;
	private String payMethod;
	private String merchantUid;
	private String name;
	private String amount;
	private String academyId;
	private String academyNumber;
	private String academyName;
	private String academyManagerName;
	private String academyManagerEmail;
	private String academyManagerPhone;
	private String paymentDate;
}
