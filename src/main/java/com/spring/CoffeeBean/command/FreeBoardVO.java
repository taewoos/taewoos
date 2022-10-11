package com.spring.CoffeeBean.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//자유게시판
public class FreeBoardVO {
	
	private int boardNo;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private Timestamp boardDate;
	private int boardHit;
	private boolean newMark;
}
