package com.spring.CoffeeBean.command;



import java.util.Date;

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

//-- 프로필 사진
//DROP TABLE IF EXISTS `resfile`;
//CREATE TABLE `resfile` (
//  `file_no` int(11) NOT NULL AUTO_INCREMENT,
//  `file_uploadpath` varchar(100) NOT NULL,
//  `file_loca` varchar(100) NOT NULL,
//  `file_name` varchar(50) NOT NULL,
//  `file_realname` varchar(50) NOT NULL,
//  `file_regdate` date DEFAULT (curdate()),
//  `res_no` int(11) DEFAULT NULL,
//  PRIMARY KEY (`file_no`)
//) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

//프로필사진
public class ResFileVO {

	private int fileNo; //프로필 PK
	private String fileUploadpath; // 업로드 경로
	private String fileLoca; // 파일 저장 위치
	private String fileName; // 파일 이름(UUID 변환)
	private String fileRealname; // 파일 실제 이름
	private Date fileRegdate; // 파일 등록 일
	private int resNo; //이력서 인적사항 번호 FK
		
}
