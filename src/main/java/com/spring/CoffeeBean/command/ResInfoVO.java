package com.spring.CoffeeBean.command;

import java.util.Date;

import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

//-- 인적사항
//DROP TABLE IF EXISTS `resinfo`;
//CREATE TABLE `resinfo` (
//  `res_no` int(11) NOT NULL AUTO_INCREMENT,
//  `res_name` varchar(50) NOT NULL,
//  `res_birth` varchar(50) NOT NULL,
//  `res_Phone1` varchar(50) NOT NULL,
//  `res_Phone2` varchar(50) NOT NULL,
//  `res_Email` varchar(50) NOT NULL,
//  `res_addrBasic` varchar(300)  DEFAULT NULL,
//  `res_addrDetail` varchar(300)  DEFAULT NULL,
//  `res_addrZipNum` varchar(50)  DEFAULT NULL,
//  `res_regdate` date DEFAULT (curdate()),
//  `user_id` varchar(45) NOT NULL,
//  `res_title` varchar(45) DEFAULT NULL,
//  `res_Phone3` varchar(45) DEFAULT NULL,
//  PRIMARY KEY (`res_no`)
//) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


//인적사항
public class ResInfoVO {
	
	private int resNo; //이력서 인적사항 번호 FK
	private String resTitle;
	private String resName;
	private String resBirth;
	private String resPhone1;
	private String resPhone2;
	private String resPhone3; //추가
	private String resEmail;
	private String resAddrbasic;
	private String resAddrdetail;
	private String resAddrzipnum;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date resRegdate;
	private String userId;
	
	
	//INSERT 변수
	private List<ResCrrVO> resCrr;
	private List<ResCertVO> resCert;
	private List<ResEduVO> resEdu;
	private List<ResFileVO> resFile;
	private List<ReqStepVO> reqStep;
	

	
}
