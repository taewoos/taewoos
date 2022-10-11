package com.spring.CoffeeBean.notice.mapper;

import java.util.List;

import com.spring.CoffeeBean.command.FreeBoardVO;
import com.spring.CoffeeBean.command.NoticeVO;
import com.spring.CoffeeBean.util.PageVO;

public interface INoticeMapper {

	//글 등록
	void regist(NoticeVO vo);

	//글 목록
	List<NoticeVO> getList(PageVO vo);

	//총 게시물 수
	int getTotal(PageVO vo);

	//상세보기
	NoticeVO getContent(int noticeNo);

	//글 수정
	void update(NoticeVO vo);

	//글 삭제
	void delete(int noticeNo);
	
	//조회수올리기
	void updatereNoticeHit(int noticeNo);
	
	//메인 페이지에서 공지사항 가져오기
	List<NoticeVO> getTitle(PageVO vo);
}
