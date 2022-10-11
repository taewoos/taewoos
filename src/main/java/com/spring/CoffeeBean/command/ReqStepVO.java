package com.spring.CoffeeBean.command;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

//-- 진행단계
//DROP TABLE IF EXISTS `reqstep`;
//CREATE TABLE `reqstep` (
//  `vol_no` int(11) NOT NULL AUTO_INCREMENT,
//  `rec_no` varchar(45)  DEFAULT NULL,
//  `user_id` varchar(45)  DEFAULT NULL,
//  `res_no` int(11) DEFAULT NULL,
//  `req_preg` int(11) DEFAULT '5',
//  PRIMARY KEY (`vol_no`)
//) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


//지원 현황
public class ReqStepVO {

	private int volNo; // 지원 현황 PK
	private int recNo; // 공고번호
	private String userId; // 유저 ID
	private int resNo; // 이력서 인적사항 번호 FK
	private int reqPreg; // 진행단계
	
	// 진행단계
	// 5: 심사 대기 (default)
	// 1: 1차 합격
	// 2: 2차 합격
	// 3: 최종 합격
	// 4: 불합격 
	
	
	// 개인 진행단계를 위한 변수 선언
	private String boardTitle;
	private String fileLoca;
	private String fileName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Timestamp boardDate;
	
	//기업 진행단계를 위한 변수 선언
	private String resName;
	
	
}
