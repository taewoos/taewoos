package com.spring.CoffeeBean.command;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//자유게시판
public class BoardVO {
	
	private int boardNo;
	private String userId;
	private String boardTitle;
	private String boardContent;
	private Timestamp boardDate;
	private int boardHit;
	private boolean newMark;
	
	//파일 관련 추가
	
	private String fileUploadpath;
	private String fileLoca;
	private String fileName;
	private String fileRealname;
	private Date fileRegdate;
}
