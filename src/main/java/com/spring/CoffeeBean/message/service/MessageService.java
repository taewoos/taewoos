package com.spring.CoffeeBean.message.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.CoffeeBean.command.MessageVO;
import com.spring.CoffeeBean.message.mapper.IMessageMapper;


@Service
public class MessageService implements IMessageService {
	
	@Autowired
	private IMessageMapper mapper;
	
	@Override
	public void send(MessageVO vo) {
		mapper.send(vo);
		
	}
	
	@Override
	public List<MessageVO> getMessage(String id) {
		
		List<MessageVO> list = mapper.getMessage(id);
		
		return list;
		
	}
	
	@Override
	public List<MessageVO> sendMessage(String id) {
		
		List<MessageVO> list = mapper.sendMessage(id);
		
		return list;
		
	}
	
	@Override
	public int getMsgCount(String id) {
		return mapper.getMsgCount(id);
	}
	@Override
	public int sendMsgCount(String id) {
		return mapper.sendMsgCount(id);
	}
	
	@Override
	public MessageVO viewDetail(int msgNo) {
		MessageVO vo = mapper.viewDetail(msgNo);
		return vo;
	}
	
	//메세지 삭제
	@Override
	public void delMessage(int msgNo) {
		mapper.delMessage(msgNo);
	}
	
	//쪽지 페이징 관련	
	@Override
	public List<MessageVO> pagingMessage(String id, int no) {
		
		List<MessageVO> list = mapper.pagingMessage(id, no);
		
		return list;
		
	}
	


}
