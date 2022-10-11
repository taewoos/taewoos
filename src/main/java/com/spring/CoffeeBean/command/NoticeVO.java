package com.spring.CoffeeBean.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//공지사항
public class NoticeVO {
	
	private int noticeNo;
	private String userId;
	private String noticeTitle;
	private String noticeContent;
	private int noticeHit;
	private Timestamp noticeDate;
	private String noticeFile;

	private boolean newMark;
}
