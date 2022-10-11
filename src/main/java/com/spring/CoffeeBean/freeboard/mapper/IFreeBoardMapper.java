package com.spring.CoffeeBean.freeboard.mapper;

import java.util.List;

import com.spring.CoffeeBean.command.FreeBoardVO;
import com.spring.CoffeeBean.util.PageVO;

public interface IFreeBoardMapper {
	
	//글 등록
	void regist(FreeBoardVO vo);
	
	//글 목록
	List<FreeBoardVO> getList(PageVO vo);
	
	//총 게시물 수
	int getTotal(PageVO vo);
	
	//상세보기
	FreeBoardVO getContent(int boardNo);
	
	//글 수정
	void update(FreeBoardVO vo);
	
	//글 삭제
	void delete(int boardNo);
	
	//조회수올리기
	void updatereBoardHit(int boardNo);
}
