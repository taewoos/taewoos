package com.spring.CoffeeBean.reply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.CoffeeBean.command.ReplyVO;
import com.spring.CoffeeBean.reply.mapper.IReplyMapper;
import com.spring.CoffeeBean.util.PageVO;

@Service
public class ReplyService implements IReplyService {

	@Autowired
	private IReplyMapper mapper;

	@Override
	public void replyRegist(ReplyVO vo) {
		mapper.replyRegist(vo);
	}

	@Override
	public List<ReplyVO> getList(PageVO vo, int boardNo) {
		Map<String, Object> data = new HashMap<>();
		data.put("paging", vo);
		data.put("boardNo", boardNo);
		
		return mapper.getList(data);
	}

	@Override
	public int getTotal(int boardNo) {
		return mapper.getTotal(boardNo);
	}

	@Override
	public int pwCheck(ReplyVO vo) {
		return mapper.pwCheck(vo);
	}

	@Override
	public void update(ReplyVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int replyNo) {
		mapper.delete(replyNo);
	}


}
