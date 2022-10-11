package com.spring.CoffeeBean.command;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class UserVO {

	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userPhone1;
	private String userPhone2;
	private String userPhone3;
	private int idntNo;
	private String addrBasic;
	private String addrZipNum;
	private String addrDetail;
	private Timestamp regDate;
	private String businessNum;
	private String compName;
	private String comAddrBasic;
	private String comAddrDetail;
	private String comAddrZipNum;
	private String ceo;
	private String userBirthYear;
	private String userBirthMonth;
	private String userBirthDay;
	private String gender;
	private String corType;
	
	   //파일 관련 추가   
	   private String fileUploadpath;
	   private String fileLoca;
	   private String fileName;
	   private String fileRealname;
	   private Date fileRegdate;

	
		
}














