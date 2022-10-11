package com.spring.CoffeeBean.reply.service;

import java.util.List;

import com.spring.CoffeeBean.command.ReplyVO;
import com.spring.CoffeeBean.util.PageVO;

public interface IReplyService {
	
	void replyRegist(ReplyVO vo); //댓글 등록
	List<ReplyVO> getList(PageVO vo, int boardNo);  //목록 요청
	int getTotal(int boardNo); //댓글 개수
	
	int pwCheck(ReplyVO vo); //비밀번호 확인
	void update(ReplyVO vo); //댓글 수정
	void delete(int replyNo); //댓글 삭제
}
