package com.spring.CoffeeBean.statistics.mapper;

import java.util.List;


import com.spring.CoffeeBean.command.StatisticsVO;

import com.spring.CoffeeBean.util.PageVO;

public interface IStatisticsMapper {

	//글 등록
	void regist(StatisticsVO vo);

	//글 목록
	List<StatisticsVO> getList(PageVO vo);

	//총 게시물 수
	int getTotal(PageVO vo);

	//상세보기
	StatisticsVO getContent(int statisticsNo);

	//글 수정
	void update(StatisticsVO vo);

	//글 삭제
	void delete(int statisticsNo);
	
	//조회수올리기
	void updatereStatisticsHit(int statisticsNo);
	
	//메인 페이지에서 공지사항 가져오기
	List<StatisticsVO> getTitle(PageVO vo);
}
