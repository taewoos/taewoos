package com.spring.CoffeeBean.message.service;

import java.util.List;

import com.spring.CoffeeBean.command.MessageVO;

public interface IMessageService {

	//글 등록
	void send(MessageVO vo);
	
	//받은 쪽지 목록
	List<MessageVO> getMessage(String id);
	
	//보낸 쪽지 목록
	List<MessageVO> sendMessage(String id);
	
	int getMsgCount(String id);
	int sendMsgCount(String id);
	
	MessageVO viewDetail(int msgNo);
	
	//메세지 삭제
	void delMessage(int msgNo);
	
	//쪽지 페이징
	List<MessageVO> pagingMessage(String id, int no);
}
