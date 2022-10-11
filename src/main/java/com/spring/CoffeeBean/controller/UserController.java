package com.spring.CoffeeBean.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.spring.CoffeeBean.command.UserVO;
import com.spring.CoffeeBean.user.service.IUserService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/user")
public class UserController {

   @Autowired
   private IUserService service;

   // 회원가입 페이지로 이동
   @GetMapping("/userJoin")
   public void userJoin() {
   }

   // 아이디 중복 확인 (비동기)
   @ResponseBody // Rest Controller가 아닌 경우에는 아노테이션을 붙여야 비동기 통신이 가능하다.
   @PostMapping("/idCheck")
   public String idCheck(@RequestBody String userId) {
      int result = service.idCheck(userId);
      if (result == 1) {
         return "duplicated";
      } else {
         return "ok";
      }
   }

   @PostMapping("/phoneCheck")
   @ResponseBody
   public String sendSMS(@RequestBody String userPhoneNumber) { // 휴대폰 문자보내기
      int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);// 난수 생성

      service.certifiedPhoneNumber(userPhoneNumber, randomNumber);
      System.out.println(userPhoneNumber);

      return Integer.toString(randomNumber);
   }

   // 회원 가입 처리
   @PostMapping("/join")
   public String join(UserVO vo, RedirectAttributes ra) {
      System.out.println("param: " + vo);
      service.join(vo);
      ra.addFlashAttribute("msg", "joinSuccess");
      return "redirect:/user/userLogin";
   }

//   @PostMapping("/join2")
//   public String join2(UserVO vo, RedirectAttributes ra) {
//      System.out.println("param: " + vo);
//      service.join2(vo);
//      ra.addFlashAttribute("msg", "joinSuccess");
//      return "redirect:/user/userLogin";
//   }
   
   
   @PostMapping("/join2")
   public String join2(UserVO vo, RedirectAttributes ra,MultipartFile file) {
      
      //현재 날짜 생성
      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
      Date date = new Date();
      //만든 오늘 날짜를 파일 저장 위치로 활용(fileLoca)
      String fileLoca = sdf.format(date);   
      //파일 업로드 경로
//      String fileUploadpath = "C:\\java_web\\spring_work\\CoffeeBean\\src\\main\\webapp\\resources\\img\\cor_img\\" + fileLoca;   
      String fileUploadpath = "/var/upload" + fileLoca;   
      //파일 업로드 경로가 없다면 만들기
      File folder = new File(fileUploadpath);
      if(!folder.exists()) {
         folder.mkdirs(); }   
      //파일 실제 이름
      String fileRealname = file.getOriginalFilename();
      //랜덤 아이디 생성 후  "-" 를 " " 로 교체
      UUID uuid = UUID.randomUUID();
      String uuids = uuid.toString().replaceAll("-", "");   
      //확장자 추출 "." 까지 잘라내기
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
         
         // MultipartFile가 JSP에서 요청한 파일(바이너리 파일)을 받아주고 ( enctype="multipart/form-data" 추가했음!)
         // MultipartFile 가 제공하는 여러가지로 풀어 헤치고!
         // transferTo 메소드로 서버에 바이너리 파일(원본)로 저장
         file.transferTo(saveFile);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      
         // MultipartFile 가 제공하는 여러가지로 풀어 헤친 파일 관련 정보를 텍스트 파일 로 DB에 넣기 위해 SET!
         // UserVO에 추가하고, DB 컬럼도 추가했어요!
         vo.setFileLoca(fileLoca);
         vo.setFileName(fileName);
         vo.setFileRealname(fileRealname);
         vo.setFileUploadpath(fileUploadpath);
         
   
      System.out.println("param: " + vo);
      service.join2(vo);
      ra.addFlashAttribute("msg", "joinSuccess");
      return "redirect:/user/userLogin";
   }


   // 로그인 페이지로 이동 요청
   @GetMapping("/userLogin")
   public void userLogin() {
   }

   // 로그인 요청
   @PostMapping("/login")
   public String login(String userId, String userPw, String idntNo, Model model) {
      model.addAttribute("user", service.login(userId, userPw, idntNo));
      return "/user/userLogin";
   }

   // 아이디 찾기 결과
   @PostMapping("/findUserResult")
   public String findUserResult(UserVO vo, Model model) {
      model.addAttribute("userFind", service.userFind(vo));
      if(model.getAttribute("userFind")==null) return "/user/notUser";
      else return "/user/userResult";
   }
   // 비밀번호 찾기 결과
   @PostMapping("/findPwResult")
   public String findPwResult(UserVO vo, Model model) {
      model.addAttribute("userFind", service.pwFind(vo));
      if(model.getAttribute("userFind")==null) return "/user/notUserPw";
      else return "/user/updatePw";
   }
   //비밀번호 변경
   @PostMapping("/pwUpdate")
   public String pwUpdate(UserVO vo) {
      System.out.println("컨트롤러vo"+ vo);
      service.pwUpdate(vo);
      return "redirect:/user/pwUpdateResult";
   }
   
   // 비밀번호 변경 완료
   @GetMapping("/pwUpdateResult")
   public void pwUpdateResult() {
   }

   // 유저 정보 수정 페이지 이동 요청
   @GetMapping("/userInfoModify")
   public void userMypage(HttpSession session,Model model) {
	   String id = ((UserVO)session.getAttribute("login")).getUserId();
	   
	   model.addAttribute("getInfo", service.getInfo(id));
	   System.out.println("getInfo"+ model.getAttribute("getInfo"));
   }

   // 수정 로직
   @PostMapping("/userUpdate")
   public String userUpdate(UserVO vo, RedirectAttributes ra) {
      System.out.println("param: " + vo);
          
      service.updateUser(vo);

      ra.addFlashAttribute("msg", "수정이 완료되었습니다.");
      return "redirect:/user/userInfoModify";
   }

   @PostMapping("/userUpdate2")
   public String userUpdate2(UserVO vo, RedirectAttributes ra) {
      System.out.println("param: " + vo);
      service.updateUser2(vo);

      ra.addFlashAttribute("msg", "수정이 완료되었습니다.");
      return "redirect:/user/userInfoModify";
   }

   // 로그아웃 처리
   @GetMapping("/userLogout")
   public ModelAndView logout(HttpSession session, RedirectAttributes ra) {

      session.removeAttribute("login");

      ra.addFlashAttribute("msg", "logout");

      return new ModelAndView("redirect:/");
   }

   // 아이디, 비밀번호 찾기 페이지로 이동
   @GetMapping("/findUser")
   public void findUser() {
   }
   @GetMapping("/findPw")
   public void findPw() {
   }

}