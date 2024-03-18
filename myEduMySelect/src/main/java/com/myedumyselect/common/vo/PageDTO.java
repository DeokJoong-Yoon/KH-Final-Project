package com.myedumyselect.common.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString

//페이지 이동 바 처리
public class PageDTO {
	
	private int startPage;			//페이지 이동 바의 시작 번호
	private int endPage;			//페이지 이동 바의 끝 번호
	private boolean prev, next;		//이전 묶음과 이후 묶음으로 이동한 링크의 표시 여부
	
	private int total;				//전체 레코드 수
	private CommonVO cvo;			//페이지 번호와 한 페이지에 보여줄 레코드 수 
	
	public PageDTO(CommonVO cvo, int total) {		//게시판VO들이 CommonVO를 상속하므로 CommonVO cvo에 게시판VO의 주소값 대입 가능 (다형성)
		this.cvo = cvo;
		this.total = total;
		
		//페이징의 끝 번호(endPage) 구하기
		this.endPage = (int) (Math.ceil(cvo.getPageNum() / 5.0)) * 5;
		
		//페이징의 시작번호(startPage) 구하기
		this.startPage = this.endPage - 4;
		
		//끝 페이지 구하기
		int realEnd = (int) (Math.ceil((total * 1.0) / cvo.getAmount()));
		
		if(realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		//이전 5개 구하기 - 이전의 경우는 시작 번호가 1보다 큰 경우일 때 존재
		this.prev = this.startPage > 1;
		
		//다음 5개 구하기 - 다음은 realEnd가 끝 번호보다 큰 경우에만 존재
		this.next = this.endPage < realEnd;
	}

}

