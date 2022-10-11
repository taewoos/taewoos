package com.spring.CoffeeBean.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.CoffeeBean.command.NoticeVO;
import com.spring.CoffeeBean.notice.mapper.INoticeMapper;
import com.spring.CoffeeBean.util.PageVO;

@Service
public class NoticeService implements INoticeService {

	@Autowired
	private INoticeMapper mapper;

	@Override
	public void regist(NoticeVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<NoticeVO> getList(PageVO vo) {
		
		List<NoticeVO> list = mapper.getList(vo);

		//new Mark
		for(NoticeVO article : list) {
			long now = System.currentTimeMillis();//현재시간
			long regTime = article.getNoticeDate().getTime();//등록시간

			if(now - regTime < 60*60*24*1000) { //1일
				article.setNewMark(true);
			}
		}		
		return list;
	}
	
	@Override
	public List<NoticeVO> getTitle(PageVO vo) {
		
		List<NoticeVO> list = mapper.getTitle(vo);
		
		return list;
	}

	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}

	@Override
	public NoticeVO getContent(int noticeNo) {
		return mapper.getContent(noticeNo);
	}

	@Override
	public void update(NoticeVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int noticeNo) {
		mapper.delete(noticeNo);
	}
	
	@Override
	public void updatereNoticeHit(int noticeNo) {		
		mapper.updatereNoticeHit(noticeNo);
	}
}
