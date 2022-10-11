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

import com.spring.CoffeeBean.command.NoticeVO;
import com.spring.CoffeeBean.notice.service.INoticeService;
import com.spring.CoffeeBean.util.PageCreator;
import com.spring.CoffeeBean.util.PageVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private INoticeService service;
	
	//목록 화면
	@GetMapping("/noticeList")
	public void noticeList(PageVO vo, Model model) {
		
		System.out.println(vo);
				
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));//총 게시물 개수
		
		System.out.println(pc);
		
		model.addAttribute("noticeList", service.getList(vo));//게시물 목록
		model.addAttribute("pc", pc);		
	}
	
	//글 쓰기 화면 처리
	@GetMapping("/noticeRegist")
	public void noticeRegist() {}
	
	//글 등록 처리
	@PostMapping("/registForm")
	public String registForm(NoticeVO vo, RedirectAttributes ra) {
		service.regist(vo);
		ra.addFlashAttribute("msg","정상 등록 처리되었습니다.");
		return "redirect:/notice/noticeList";
	}
	
	//글 상세보기 처리
	@GetMapping("/noticeDetail/{noticeNo}")
	public String noticeDetail(@PathVariable int noticeNo, @ModelAttribute("p") PageVO vo, Model model) {
		service.updatereNoticeHit(noticeNo);
		model.addAttribute("article", service.getContent(noticeNo));
		return "notice/noticeDetail";
	}
	
	//글 수정 화면처리
	@GetMapping("/noticeModify")
	public void noticeModify(int noticeNo, Model model) {
		model.addAttribute("article", service.getContent(noticeNo));
	}
	
	//글 수정 처리
	@PostMapping("/noticeUpdate")
	public String noticeUpdate(NoticeVO vo, RedirectAttributes ra) {
		service.update(vo);
		ra.addFlashAttribute("msg","게시글 수정이 정상 처리되었습니다.");
		return "redirect:/notice/noticeDetail/" + vo.getNoticeNo();
	}
	
	//글 삭제 처리
	@PostMapping("/noticeDelete")
	public String noticeDelete(int noticeNo, RedirectAttributes ra) {
		service.delete(noticeNo);
		ra.addFlashAttribute("msg", "게시글 삭제가 정상 삭제되었습니다.");
		return "redirect:/notice/noticeList";
	}	
	

}
