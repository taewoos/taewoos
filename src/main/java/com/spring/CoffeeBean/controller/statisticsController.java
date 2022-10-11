package com.spring.CoffeeBean.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.CoffeeBean.command.StatisticsVO;
import com.spring.CoffeeBean.statistics.service.IStatisticsService;
import com.spring.CoffeeBean.util.PageCreator;
import com.spring.CoffeeBean.util.PageVO;

@Controller
@RequestMapping("/statistics")
public class statisticsController {
	
	@Autowired
	private IStatisticsService service;
	
	//목록 화면
	@GetMapping("/statisticsList")
	public void statisticsList(PageVO vo, Model model) {
		
		System.out.println(vo);
				
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));//총 게시물 개수
		
		System.out.println(pc);
		
		model.addAttribute("statisticsList", service.getList(vo));//게시물 목록
		model.addAttribute("pc", pc);		
	}
	
	//글 쓰기 화면 처리
	@GetMapping("/statisticsRegist")
	public void statisticsRegist() {}
	
	//글 등록 처리
	@PostMapping("/registForm")
	public String registForm(StatisticsVO vo, RedirectAttributes ra) {
		service.regist(vo);
		ra.addFlashAttribute("msg","정상 등록 처리되었습니다.");
		return "redirect:/statistics/statisticsList";
	}
	
	//글 상세보기 처리
	@GetMapping("/statisticsDetail/{statisticsNo}")
	public String statisticsDetail(@PathVariable int statisticsNo, @ModelAttribute("p") PageVO vo, Model model) {
		service.updatereStatisticsHit(statisticsNo);
		model.addAttribute("article", service.getContent(statisticsNo));
		return "statistics/statisticsDetail";
	}
	
	//글 수정 화면처리
	@GetMapping("/statisticsModify")
	public void statisticsModify(int statisticsNo, Model model) {
		model.addAttribute("article", service.getContent(statisticsNo));
	}
	
	//글 수정 처리
	@PostMapping("/statisticsUpdate")
	public String statisticsUpdate(StatisticsVO vo, RedirectAttributes ra) {
		service.update(vo);
		ra.addFlashAttribute("msg","게시글 수정이 정상 처리되었습니다.");
		return "redirect:/statistics/statisticsDetail/" + vo.getStatisticsNo();
	}
	
	//글 삭제 처리
	@PostMapping("/statisticsDelete")
	public String statisticsDelete(int statisticsNo, RedirectAttributes ra) {
		service.delete(statisticsNo);
		ra.addFlashAttribute("msg", "게시글 삭제가 정상 삭제되었습니다.");
		return "redirect:/statistics/statisticsList";
	}	
	

}
