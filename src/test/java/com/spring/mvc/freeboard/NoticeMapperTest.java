package com.spring.mvc.freeboard;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.CoffeeBean.command.NoticeVO;
import com.spring.CoffeeBean.notice.mapper.INoticeMapper;
import com.spring.CoffeeBean.util.PageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/db-config.xml")
public class NoticeMapperTest {

	@Autowired
	private INoticeMapper mapper;

	@Test
	public void registTest() {
		for(int i=1; i<=70; i++) {
			NoticeVO vo = new NoticeVO();
			vo.setUserId("userId" + i);
			vo.setNoticeTitle("test" + i);
			vo.setNoticeContent("테스트 글쓰기" + i);
			mapper.regist(vo);
		}
	}

	//게시글 전체조회 단위 테스트
//	@Test
//	public void getListTest() {
//		List<NoticeVO> list = mapper.getList();
//		System.out.println("게시물의 개수: " + list.size());
//		for(NoticeVO vo : list) {
//			System.out.println(vo);
//		}
//	}

	//게시글 단일 조회 테스트
	@Test
	public void getContentTest() {
		NoticeVO vo = mapper.getContent(3);
		System.out.println(vo);
	}

	//게시글 수정 테스트
//	@Test
//	public void updateTest() {
//		NoticeVO vo = new NoticeVO();
//		vo.setBoardNo(1);
//		vo.setBTitle("수정");
//		vo.setBContent("수정된 내용");
//		mapper.update(vo);
//		System.out.println("수정 후 정보: " + mapper.getContent(1));
//	}

	//게시글 삭제 테스트
	@Test
	public void deleteTest() {
		for(int i=1; i<=30; i++) {
			mapper.delete(i);
			if(mapper.getContent(i) == null) {
				System.out.println("삭제 성공! 게시글 없음!");
			} else {
				System.out.println("삭제 실패 ㅜㅜ");
			}
		}
	}
}
