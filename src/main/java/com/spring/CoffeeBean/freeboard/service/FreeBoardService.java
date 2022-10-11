package com.spring.CoffeeBean.freeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.CoffeeBean.command.FreeBoardVO;
import com.spring.CoffeeBean.freeboard.mapper.IFreeBoardMapper;
import com.spring.CoffeeBean.util.PageVO;

@Service
public class FreeBoardService implements IFreeBoardService {

	@Autowired
	private IFreeBoardMapper mapper;

	@Override
	public void regist(FreeBoardVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<FreeBoardVO> getList(PageVO vo) {

		List<FreeBoardVO> list = mapper.getList(vo);

		//new Mark
		for(FreeBoardVO article : list) {
			long now = System.currentTimeMillis();//현재시간
			long regTime = article.getBoardDate().getTime();//등록시간

			if(now - regTime < 60*60*24*1000) { //1일
				article.setNewMark(true);
			}
		}		
		return list;
	}

	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}

	@Override
	public FreeBoardVO getContent(int boardNo) {
		return mapper.getContent(boardNo);
	}

	@Override
	public void update(FreeBoardVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int boardNo) {
		mapper.delete(boardNo);
	}

	@Override
	public void updatereBoardHit(int boardNo) {
		mapper.updatereBoardHit(boardNo);
	}

}
