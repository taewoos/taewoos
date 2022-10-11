package com.spring.CoffeeBean.board.service;

import java.util.List;

import com.spring.CoffeeBean.command.BoardVO;
import com.spring.CoffeeBean.util.PageVO;

public interface IBoardService {

	//글 등록
	void regist(BoardVO vo);

	//글 목록
	List<BoardVO> getList(PageVO vo);

	//총 게시물 수
	int getTotal(PageVO vo);

	//상세보기
	BoardVO getContent(int boardNo);

	//글 수정
	void update(BoardVO vo);

	//글 삭제
	void delete(int boardNo);

	//조회수올리기
	void hit(int boardNo);
	
	//메인 페이지에서 채용공고 가져오기
	List<BoardVO> getTitle(PageVO vo);
}
