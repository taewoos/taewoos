package com.spring.CoffeeBean.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.CoffeeBean.command.MessageVO;
import com.spring.CoffeeBean.message.service.IMessageService;
import com.spring.CoffeeBean.util.PageCreator;
import com.spring.CoffeeBean.util.PageVO;
import com.spring.CoffeeBean.command.UserVO;

@Controller
@RequestMapping("/message")
public class MessageController {

	@Autowired
	private IMessageService service;

	@GetMapping("/temporaryMypage")
	public void temporaryMypage(HttpSession session, Model model) {
		String id = ((UserVO) session.getAttribute("login")).getUserId();

		model.addAttribute("messageList", service.getMessage(id));
		System.out.println(model.getAttribute("messageList"));
	}

	/*
	 * @GetMapping("/messageList") public void messageList(HttpSession session,
	 * Model model) { String id =
	 * ((UserVO)session.getAttribute("login")).getUserId();
	 * 
	 * model.addAttribute("messageList", service.getMessage(id));
	 * 
	 * }
	 */

	@GetMapping("/messageSender")
	public void messageSender() {
	}

	@PostMapping("/msgSendForm")
	public String msgSendForm(MessageVO vo, RedirectAttributes ra, Model model) {
		service.send(vo);
		ra.addFlashAttribute("msg", "msgSendSuccess");

		return "redirect:/message/temporaryMypage";

	}

	@ResponseBody
	@PostMapping("/readMessage")
	public MessageVO readMessage(@RequestBody Map<String, String> Map) {
		int msgNo = Integer.parseInt((Map.get("msgNo")));
		return service.viewDetail(msgNo);
	}

	@PostMapping("/delMessage")
	public String delMessage(int msgNo, RedirectAttributes ra) {
		System.out.println(msgNo);
		service.delMessage(msgNo);
		ra.addFlashAttribute("msg", "msgDelSuccess");
		return "redirect:/message/temporaryMypage";

	}

	@ResponseBody
	@PostMapping("/msgPaging")
	public List<MessageVO> msgPaging(@RequestBody Map<String, String> Map, HttpSession session, Model model) {
		String id = ((UserVO) session.getAttribute("login")).getUserId();
		
		int no = Integer.parseInt((Map.get("no")))*5-5;
		  
		System.out.println("id: "+id+"/num:"+no); 
		model.addAttribute("pagingMsg", service.pagingMessage(id,no));
		System.out.println(model.getAttribute("pagingMsg"));
				
		return service.pagingMessage(id,no);
	}

}