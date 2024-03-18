package com.myedumyselect.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//한 페이지 내 몇 개의 게시글이 보여질지 처리
@ToString
@Setter
@Getter
public class CommonVO {
	
	//페이징 처리를 위해 필요한 필드
	private int pageNum = 0;		//페이지 번호
	private int amount = 0;			//한 페이지에 보여줄 데이터 수

	//날짜 검색 시 사용할 필드 (시작일, 종료일)
	private String startDate = "";
	private String endDate = "";
	
	public CommonVO() {
		this(1, 12);
	}
	
	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	//자유게시판 검색 기능을 위한 필드
	private String search = "";
	private String keyword = "";

}
