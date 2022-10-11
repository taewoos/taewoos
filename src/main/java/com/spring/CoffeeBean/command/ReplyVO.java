package com.spring.CoffeeBean.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//댓글
public class ReplyVO {
	
	private int replyNo;
	private int boardNo;
	
	private String reply;
	private String userId;
	private String replyPw;
	private Timestamp replyDate;
}
