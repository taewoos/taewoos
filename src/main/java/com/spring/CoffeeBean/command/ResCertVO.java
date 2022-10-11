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

//
//-- 경력사항
//DROP TABLE IF EXISTS `rescrr`;
//CREATE TABLE `rescrr` (
//  `crr_no` int(11) NOT NULL AUTO_INCREMENT,
//  `crr_com` varchar(50) DEFAULT NULL,
//  `crr_dept` varchar(50) DEFAULT NULL,
//  `crr_pos` varchar(50) DEFAULT NULL,
//  `crr_addt` date DEFAULT (curdate()),
//  `crr_grdt` date DEFAULT (curdate()),
//  `res_no` int(11) DEFAULT NULL,
//  PRIMARY KEY (`crr_no`)
//) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

//자격증
public class ResCertVO {

	private int certNo; // 자격증 PK
	private String certName; // 자격증 이름
	private String certOrg; //자격증 발행기관
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date certDate; //자격증 발행일
	private int resNo; //이력서 인적사항 번호 FK
	
	
	// INSERT 변수
	private List<ResCertVO> certList;


}
