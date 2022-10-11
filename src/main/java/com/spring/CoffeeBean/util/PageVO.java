package com.spring.CoffeeBean.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageVO {
	
	//사용자가 선택한 페이지 정보를 담을 변수
	private int pageNum; //현재 페이지 번호
	private int cpp;//한 페이지당 보여줄 게시글의 개수
	
	public int getPageStart() {
		return (this.pageNum-1)*cpp;
	}
	
	//검색에 필요한 데이터를 변수로 선언
	private String keyword;
	private String condition;
	
	public PageVO() {
		this.pageNum = 1;
		this.cpp = 12;
	}
	
	public void setPageNum(int pageNum) {
		if(pageNum <= 0) {
			this.pageNum = 1;
		} else {
			this.pageNum = pageNum;
		}
	}
	
	
}
