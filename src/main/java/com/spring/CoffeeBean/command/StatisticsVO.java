package com.spring.CoffeeBean.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//공지사항
public class StatisticsVO {
	
	private int statisticsNo;
	private String userId;
	private String statisticsTitle;
	private String statisticsContent;
	private int statisticsHit;
	private Timestamp statisticsDate;
	private String statisticsFile;

	private boolean newMark;
}
