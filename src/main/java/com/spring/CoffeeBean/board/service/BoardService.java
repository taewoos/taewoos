package com.spring.CoffeeBean.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.CoffeeBean.board.mapper.IBoardMapper;
import com.spring.CoffeeBean.command.BoardVO;
import com.spring.CoffeeBean.command.NoticeVO;
import com.spring.CoffeeBean.util.PageVO;

@Service
public class BoardService implements IBoardService {

	@Autowired
	private IBoardMapper mapper;

	@Override
	public void regist(BoardVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<BoardVO> getList(PageVO vo) {

		List<BoardVO> list = mapper.getList(vo);

	
		return list;
	}

	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}

	@Override
	public BoardVO getContent(int boardNo) {
		return mapper.getContent(boardNo);
	}

	@Override
	public void update(BoardVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int boardNo) {
		mapper.delete(boardNo);
	}

	@Override
	public void hit(int boardNo) {
		mapper.hit(boardNo);
	}
	
	@Override
	public List<BoardVO> getTitle(PageVO vo) {
		
		List<BoardVO> list = mapper.getTitle(vo);
		
		return list;
	}

}
