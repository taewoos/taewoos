package com.spring.CoffeeBean.statistics.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.CoffeeBean.command.NoticeVO;
import com.spring.CoffeeBean.command.StatisticsVO;
import com.spring.CoffeeBean.statistics.mapper.IStatisticsMapper;

import com.spring.CoffeeBean.util.PageVO;

@Service
public class StatisticsService implements IStatisticsService {

	@Autowired
	private IStatisticsMapper mapper;

	@Override
	public void regist(StatisticsVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<StatisticsVO> getList(PageVO vo) {
		List<StatisticsVO> list = mapper.getList(vo);
		
		//new Mark
		for(StatisticsVO article : list) {
			long now = System.currentTimeMillis();//현재시간
			long regTime = article.getStatisticsDate().getTime();//등록시간

			if(now - regTime < 60*60*24*1000) { //1일
				article.setNewMark(true);
			}
		}		
		return list;
	}

	@Override
	public List<StatisticsVO> getTitle(PageVO vo) {
		
		List<StatisticsVO> list = mapper.getTitle(vo);
		
		return list;
	}

	
	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);

	}

	@Override
	public StatisticsVO getContent(int statisticsNo) {
		return mapper.getContent(statisticsNo);
	}

	@Override
	public void update(StatisticsVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int statisticsNo) {
		mapper.delete(statisticsNo);
	}

	@Override
	public void updatereStatisticsHit(int statisticsNo) {
		mapper.updatereStatisticsHit(statisticsNo);
	}
}

