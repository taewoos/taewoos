package com.spring.CoffeeBean;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.CoffeeBean.board.service.IBoardService;
import com.spring.CoffeeBean.notice.service.INoticeService;
import com.spring.CoffeeBean.util.PageCreator;
import com.spring.CoffeeBean.util.PageVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private INoticeService service;
	@Autowired
	private IBoardService Bservice; 
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale,PageVO vo, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		//메인페이지에서 공지사항 가져오기
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));//총 게시물 개수
		
		System.out.println(pc);
		
		model.addAttribute("noticeList", service.getTitle(vo));//게시물 목록
		model.addAttribute("boardList", Bservice.getTitle(vo));
		model.addAttribute("pc", pc);
		
		return "home";
	}
	
}
