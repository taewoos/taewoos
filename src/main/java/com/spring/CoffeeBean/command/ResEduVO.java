package com.spring.CoffeeBean.command;




import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString

//-- 학력사항
//DROP TABLE IF EXISTS `resedu`;
//CREATE TABLE `resedu` (
//  `edu_no` int(11) NOT NULL AUTO_INCREMENT,
//  `edu_org` varchar(50) DEFAULT NULL,
//  `edu_mjr` varchar(50) DEFAULT NULL,
//  `edu_addt` date DEFAULT (curdate()),
//  `edu_grdt` date DEFAULT (curdate()),
//  `edu_state` varchar(50) DEFAULT NULL,
//  `res_no` int(11) DEFAULT NULL,
//  PRIMARY KEY (`edu_no`)
//) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


//학력
public class ResEduVO {
	
	private int eduNo; //학력사항 PK
	private String eduOrg; //학력사항 기관
	private String eduMjr; //학력사항 전공
	private String eduState; //학력사항 상태(재학,졸업,졸업예정)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date eduAddt; //학력사항 입학일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date eduGrdt; //학력사항 졸업일
	private int resNo; //이력서 인적사항 번호 FK
	

	// INSERT 변수
	private List<ResEduVO> eduList;




}
