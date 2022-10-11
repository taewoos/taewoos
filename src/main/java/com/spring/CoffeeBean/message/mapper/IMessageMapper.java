package com.spring.CoffeeBean.message.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.CoffeeBean.command.MessageVO;

public interface IMessageMapper {

	void send(MessageVO vo);
	
	//받은 쪽지 목록 보기
	List<MessageVO> getMessage(String id);
	
	//보낸 쪽지 목록
	List<MessageVO> sendMessage(String id);
	
	int getMsgCount(String id);
	int sendMsgCount(String id);
	
	MessageVO viewDetail(int msgNo);
	
	//메세지 삭제
	void delMessage(int msgNo);
	
	//쪽지 페이징
	List<MessageVO> pagingMessage( @Param("id") String id, @Param("no") int no);
}







;