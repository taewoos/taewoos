package com.spring.CoffeeBean.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.CoffeeBean.command.MessageVO;
import com.spring.CoffeeBean.command.ReqStepVO;
import com.spring.CoffeeBean.command.UserVO;
import com.spring.CoffeeBean.message.service.IMessageService;
import com.spring.CoffeeBean.mypage.service.IMypageService;

@Controller
@RequestMapping("/mypage")
public class MypageContorller {

   @Autowired
   IMypageService service;
   
   @Autowired
   private IMessageService mservice;
   
   
   
   
   
   @GetMapping("/userMypage")
   public void userMypage(HttpSession session,Model model) {
      

      
      String id = ((UserVO)session.getAttribute("login")).getUserId();
      
      
      
      int ResCount = service.getResAll(id);
      
      int msgCount = service.getMsgAll(id);
      
      
      
      
      model.addAttribute("ResCount", ResCount);
      
      model.addAttribute("MsgCount", msgCount);
      
      model.addAttribute("article", service.getResStep(id));
      
      model.addAttribute("getMsgList", mservice.getMessage(id));
      model.addAttribute("sendMsgList", mservice.sendMessage(id));

      System.out.println(model.toString());
   }
   


   @GetMapping("/compMypage")
   public void compMypage(HttpSession session,Model model) {
      
      String id = ((UserVO)session.getAttribute("login")).getUserId();
      
      int msgCount = service.getMsgAll(id);
      
      int RecCount = service.getRecAll(id);
      
      model.addAttribute("RecCount", RecCount);
      
      model.addAttribute("MsgCount", msgCount);
      
      model.addAttribute("article", service.getRecStep(id));
      
      System.out.println(model.toString());
      
   }
   

   @GetMapping("/adminMypage")
   public void adminMypage(HttpSession session,Model model) {
      
      
      String id = ((UserVO)session.getAttribute("login")).getUserId();
      
      
      int msgCount = service.getMsgAll(id);
      
      int userCount = service.getUserAll(id);
      
      model.addAttribute("MsgCount", msgCount);
      
      model.addAttribute("UserCount", userCount);
      
      int ComCount = service.getComAll();
      
      model.addAttribute("ComCount", ComCount);
      
      model.addAttribute("article", service.getStatistics(id));
      
      System.out.println(model.toString());
   }
   
   
   @GetMapping("/comlist")
   public void comlist(Model model) {
      
      //기업 깔아놓기
      model.addAttribute("article", service.waitingJoin());
      System.out.println(model.toString());
   }
   
   @GetMapping("/chlist")
   public void chlist(Model model) {
      
      //기업 깔아놓기
      model.addAttribute("article", service.waitingJoin());
      System.out.println(model.toString());
   }
   
   
   @GetMapping("/userlist")
   public void userlist(Model model) {
      
      //유저 깔아 놓기
      model.addAttribute("article", service.user());
      System.out.println(model.toString());
   }
   
   
   @GetMapping("/getComDetail/{id}")
   @ResponseBody
   public UserVO getComDetail(@PathVariable String id) {
      return service.getComDetail(id);
      
   }
   
   @GetMapping("/getUserDetail/{id}")
   @ResponseBody
   public UserVO getUserDetail(@PathVariable String id) {
      return service.getUserDetail(id);
      
   }
   
   
   
   @ResponseBody
   @PostMapping("/idntNoUpdate")
   public String update(@RequestBody Map<String,String> Map) {
      
      
      System.out.println((Map.get("id")));
      
      int result = 1;
      
      if(result == 1) {
         service.idntNoUpdate(Map.get("id"));
         
         return "Success";
      } else {
         return "Fail";
      }
      
   }




	@ResponseBody
	@PostMapping("/useridntNoUpdate")
	public String userupdate(@RequestBody Map<String,String> Map) {
	   
	   
	   System.out.println((Map.get("id")));
	   
	   int result = 1;
	   
	   if(result == 1) {
	      service.useridntNoUpdate(Map.get("id"));
	      
	      return "Success";
	   } else {
	      return "Close";
	   }
	   
	}
	
	@PostMapping("/msgSendForm")
	public String msgSendForm(HttpSession session, MessageVO vo, RedirectAttributes ra, Model model) {
	   mservice.send(vo);
	   ra.addFlashAttribute("msg", "msgSendSuccess");
	   
	   int idntN = ((UserVO)session.getAttribute("login")).getIdntNo();
	   
	   if(idntN == 1) return "redirect:/mypage/userMypage";
	   else if(idntN == 2) return "redirect:/mypage/compMypage";
	   else return "redirect:/mypage/adminMypage";
	
	   
	}
	
	@ResponseBody
	@PostMapping("/readMessage")
	public MessageVO readMessage(@RequestBody Map<String,String> Map) {
	   int msgNo = Integer.parseInt((Map.get("msgNo")));
	   return mservice.viewDetail(msgNo);
	}
	
	
	@PostMapping("/delMessage")
	public String delMessage(HttpSession session, int msgNo, RedirectAttributes ra) {
	   System.out.println(msgNo);
	   mservice.delMessage(msgNo);
	   ra.addFlashAttribute("msg", "msgDelSuccess");

	   int idntN = ((UserVO)session.getAttribute("login")).getIdntNo();
	   
	   if(idntN == 1) return "redirect:/mypage/userMypage";
	   else if(idntN == 2) return "redirect:/mypage/compMypage";
	   else return "redirect:/mypage/adminMypage";
		   
	}




}



















