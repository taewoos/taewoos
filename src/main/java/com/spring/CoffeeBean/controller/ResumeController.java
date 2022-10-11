package com.spring.CoffeeBean.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.CoffeeBean.command.ReplyVO;
import com.spring.CoffeeBean.command.ReqStepVO;
import com.spring.CoffeeBean.command.ResCertVO;
import com.spring.CoffeeBean.command.ResCrrVO;
import com.spring.CoffeeBean.command.ResEduVO;
import com.spring.CoffeeBean.command.ResFileVO;
import com.spring.CoffeeBean.command.ResInfoVO;
import com.spring.CoffeeBean.command.UserVO;
import com.spring.CoffeeBean.resume.service.IResumeService;
import com.spring.CoffeeBean.util.PageCreator;
import com.spring.CoffeeBean.util.PageVO;


@Controller
@RequestMapping("/resume")
public class ResumeController {
   
   @Autowired
   private IResumeService service;
   
   //이력서 목록 ()
   @GetMapping("/resumeList")
   public void resumeList(HttpSession session, Model model,@RequestParam(required = false, value= "recNo" , defaultValue= "0" ) int recNo) {
      

      System.out.println(recNo);

      
      String id = ((UserVO)session.getAttribute("login")).getUserId();
      
      model.addAttribute("resumeList", service.getList(id));
      model.addAttribute("recNo", recNo);
         
   }
   
   //이력서 목록 (공고 리스트에서, 지원하기 누를 때, 공고 번호가 넘어올 때)
   @GetMapping("/resumeList/{recNo}")
   public String WriteList(HttpSession session, Model model,@PathVariable int recNo) {
      

      System.out.println(recNo);

      String id = ((UserVO)session.getAttribute("login")).getUserId();
      
      model.addAttribute("resumeList", service.getList(id));
      model.addAttribute("recNo", recNo);
      return "resume/resumeList";
         
   }   
   
   //이력서 등록 화면으로 이동
   @GetMapping("/resumeWrite")
   public void resumeWrite() {}
   
   //이력서 등록 처리
   @PostMapping("/registForm")
   public String registForm(ResInfoVO vo,ResCrrVO vo1,ResEduVO vo3,ResCertVO vo4, MultipartFile file, RedirectAttributes ra) {
                  
      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
      Date date = new Date();
      String fileLoca = sdf.format(date);   
      
      String fileUploadpath = "/var/upload" + fileLoca;
      
      File folder = new File(fileUploadpath);
      if(!folder.exists()) {
         folder.mkdirs(); 
      }
      
      String fileRealname = file.getOriginalFilename();
      
      UUID uuid = UUID.randomUUID();
      String uuids = uuid.toString().replaceAll("-", "");
      
      String fileExtension = fileRealname.substring(fileRealname.indexOf("."), fileRealname.length());
      
      System.out.println("저장할 폴더 경로: " + fileUploadpath);
      System.out.println("실제 파일명: " + fileRealname);
      System.out.println("폴더명: " + fileLoca);
      System.out.println("확장자: " + fileExtension);
      System.out.println("고유랜덤문자: " + uuids);
      
      String fileName = uuids + fileExtension;
      System.out.println("변경해서 저장할 파일명: " + fileName);
      
      File saveFile = new File(fileUploadpath + "/" + fileName);
      try {
         file.transferTo(saveFile);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      
      
      
      System.out.println(vo3.toString());
      
      //DB INSERT
      service.registInfo(vo);
      service.registCrr(vo1);
      service.registEdu(vo3);
      service.registCert(vo4);
      
      // 0 :fileNo, null:fileRegdate, 0:resNo
      ResFileVO vo5 = new ResFileVO(0,fileUploadpath,fileLoca,fileName,fileRealname,null,0);
      service.registFile(vo5);
      ra.addFlashAttribute("msg", "정상 등록 처리되었습니다.");
      return "redirect:/resume/resumeList";
   }
   
   //이력서 사진 미리보기
   @GetMapping("/display")
   public ResponseEntity<byte[]> getFile(String fileLoca, String fileName) {
      
      System.out.println("fileName: " + fileName);
      System.out.println("fileLoca: " + fileLoca);
      
      File file = new File("/var/upload" + fileLoca + "/" + fileName);
      System.out.println(file);
      
      ResponseEntity<byte[]> result = null;
      
      HttpHeaders headers = new HttpHeaders();
   
      try {
         headers.add("Content-Type", Files.probeContentType(file.toPath()));
         headers.add("merong", "hello");
         
         result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
         
      } catch (IOException e) {
         e.printStackTrace();
      }
      
      return result;
   }

   
   //이력서 상세보기 (개인 -> 기업)
   @GetMapping("/resumeUserCheck/{resNo}")
   public String resumeUserCheck(@PathVariable int resNo, 
                     @ModelAttribute("p") PageVO vo,
                     Model model) {
      model.addAttribute("article", service.getContent(resNo));
      System.out.println(model.toString());
      return "resume/resumeUserCheck";
      
   }
   
   //이력서 상세보기 (기업 -> 개인)
   @GetMapping("/resumeComCheck/{resNo}")
   public String resumeComCheck(@PathVariable int resNo, 
                     @ModelAttribute("p") PageVO vo,
                     Model model) {
      model.addAttribute("article", service.ComgetContent(resNo));
      System.out.println(model.toString());
      return "resume/resumeComCheck";
      
   }
   
   
   //이력서 수정화면으로 이동
   @GetMapping("/resumeModify")
   public void modify(int resNo, Model model) {
      
      model.addAttribute("article", service.getContent(resNo));
      
   }
   
   //이력서 수정 처리
   @PostMapping("/resumeUpdate")
   public String resumeUpdate(ResInfoVO vo,ResCrrVO vo1,ResEduVO vo3,ResCertVO vo4, MultipartFile file, RedirectAttributes ra) {
      
      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
      Date date = new Date();
      String fileLoca = sdf.format(date);

      String fileUploadpath = "/var/upload" + fileLoca;

      File folder = new File(fileUploadpath);
      if (!folder.exists()) {
         folder.mkdirs();
      }

      String fileRealname = file.getOriginalFilename();   

      UUID uuid = UUID.randomUUID();
      String uuids = uuid.toString().replaceAll("-", "");

      String fileExtension = fileRealname.substring(fileRealname.indexOf("."), fileRealname.length());

      System.out.println("저장할 폴더 경로: " + fileUploadpath);
      System.out.println("실제 파일명: " + fileRealname);
      System.out.println("폴더명: " + fileLoca);
      System.out.println("확장자: " + fileExtension);
      System.out.println("고유랜덤문자: " + uuids);

      String fileName = uuids + fileExtension;
      System.out.println("변경해서 저장할 파일명: " + fileName);

      File saveFile = new File(fileUploadpath + "/" + fileName);
      try {
         file.transferTo(saveFile);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      
      
      
      
      service.updateInfo(vo);
      service.updateCrr(vo1);
      service.updateEdu(vo3);
      service.updateCert(vo4);
      System.out.println(vo1.toString());
      ResFileVO vo5 = new ResFileVO(0,fileUploadpath,fileLoca,fileName,fileRealname,null,0);
      
      service.updateFile(vo5);
      
      ra.addFlashAttribute("msg", "updateSuccess");
      
      return "redirect:/resume/resumeUserCheck/" + vo.getResNo();
   }
   

   //이력서 삭제 처리
   @PostMapping("/resumeDelete")
   public String resumeDelete(int resNo, RedirectAttributes ra) {
      service.delete(resNo);
      
      ra.addFlashAttribute("msg", "이력서가 정상적으로 삭제되었습니다.");
      return "redirect:/resume/resumeList";
   }
      
   //이력서 지원 처리
   @ResponseBody
   @PostMapping("/resumeApply")
   public String update(@RequestBody ReqStepVO vo) {
      
      System.out.println(vo.toString());
      
      int result = 1;
      
      if(result == 1) {
         service.apply(vo);
         return "applySuccess";
      } else {
         return "Fail";
      }
      
   }
   
   //이력서 중복 지원 방지 처리
   @ResponseBody
   @PostMapping("/avoidDuplication")
   public String avoidDuplication(@RequestBody ReqStepVO vo) {
      
      System.out.println(vo.toString());
      
      int result = service.avoidDuplication(vo);
      
      if(result == 1) {
         return "Duplication";
      } else {
         return "avoidDuplication";
      }
      
   }
   
   
   
   
   
   
   
   
   
   //진행단계 업데이트
   @ResponseBody
   @PostMapping("/reqstepUpdate")
   public String reqstepUpdate(@RequestBody ReqStepVO vo) {
      
      System.out.println(vo.toString());
      
      
      int result = 1;
      
      if(result == 1) {
         service.reqstepUpdate(vo);
         return "UpdateSuccess";
      } else {
         return "Fail";
      }
      
   }   
   

   

   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

   //기업이 개인의 이력서 조회 있어야함 (개인의 이력서 조회에서, 이력서 등록,

   
}