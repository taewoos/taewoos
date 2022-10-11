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

import com.spring.CoffeeBean.command.FreeBoardVO;
import com.spring.CoffeeBean.freeboard.service.IFreeBoardService;
import com.spring.CoffeeBean.util.PageCreator;
import com.spring.CoffeeBean.util.PageVO;

@Controller
@RequestMapping("/freeboard")
public class FreeBoardController {
	
	@Autowired
	private IFreeBoardService service;
	
	//목록 화면
	@GetMapping("/freeList")
	public void freeList(PageVO vo, Model model) {
		
		System.out.println(vo);
				
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));//총 게시물 개수
		
		System.out.println(pc);
		
		model.addAttribute("boardList", service.getList(vo));//게시물 목록
		model.addAttribute("pc", pc);		
	}
	
	//글 쓰기 화면 처리
	@GetMapping("/freeRegist")
	public void freeRegist() {}
	
	//글 등록 처리
	@PostMapping("/registForm")
	public String registForm(FreeBoardVO vo, RedirectAttributes ra) {
		service.regist(vo);
		ra.addFlashAttribute("msg","정상 등록 처리되었습니다.");
		return "redirect:/freeboard/freeList";
	}
	
	//글 상세보기 처리
	@GetMapping("/freeDetail/{boardNo}")
	public String freeDetail(@PathVariable int boardNo, @ModelAttribute("p") PageVO vo, Model model) {
		service.updatereBoardHit(boardNo);
		model.addAttribute("article", service.getContent(boardNo));
		return "freeboard/freeDetail"; //void사용 못함 경로에 @PathVariable방식으로 보내기 때문에
	}
	
	//글 수정 화면처리
	@GetMapping("/freeModify")
	public void freeModify(int boardNo, Model model) {
		model.addAttribute("article", service.getContent(boardNo));
	}
	
	//글 수정 처리
	@PostMapping("/freeUpdate")
	public String freeUpdate(FreeBoardVO vo, RedirectAttributes ra) {
		service.update(vo);
		ra.addFlashAttribute("msg","게시글 수정이 정상 처리되었습니다.");
		return "redirect:/freeboard/freeDetail/" + vo.getBoardNo();
	}
	
	//글 삭제 처리
	@PostMapping("/freeDelete")
	public String freeDelete(int boardNo, RedirectAttributes ra) {
		service.delete(boardNo);
		ra.addFlashAttribute("msg", "게시글 삭제가 정상 삭제되었습니다.");
		return "redirect:/freeboard/freeList";
	}	
	

}
