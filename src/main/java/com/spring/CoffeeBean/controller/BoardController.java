package com.spring.CoffeeBean.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.CoffeeBean.board.service.IBoardService;
import com.spring.CoffeeBean.command.BoardVO;
import com.spring.CoffeeBean.command.ResFileVO;
import com.spring.CoffeeBean.util.PageCreator;
import com.spring.CoffeeBean.util.PageVO;

@Controller
@RequestMapping("/recruitment")
public class BoardController {
	
	@Autowired
	private IBoardService service;
	
	//목록 화면
	@GetMapping("/list")
	public void freeList(PageVO vo, Model model) {
		
		System.out.println(vo);
				
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));//총 게시물 개수
		
		System.out.println(pc);
		
		
	//	List<BoardVO> list2 = service.getList(vo);
	//	model.addAttribute("article", service.getContent(0));//게시물 목록
	//	System.out.println(list2.get(0));
		
		
		
		model.addAttribute("boardList", service.getList(vo));//게시물 목록
	
		
		model.addAttribute("pc", pc);		
			
			
	}
	
	//글 쓰기 화면 처리
	@GetMapping("/writer")
	public void freeRegist() {}
	
	//글 등록 처리
	@PostMapping("/registForm")
	public String registForm(BoardVO vo, MultipartFile file, RedirectAttributes ra) {
		
		//날짜별로 폴더를 생성해서 파일을 관리
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		String fileLoca = sdf.format(date);
		
		//저장할 폴더 경로
		String fileUploadpath = "C:\\upload" + fileLoca;
		
		File folder = new File(fileUploadpath);
		if(!folder.exists()) {
			folder.mkdirs(); //폴더가 존재하지 않는다면 생성하라.
		}
		
		//원본 파일명.
		String fileRealname = file.getOriginalFilename();
		
		//파일명을 고유한 랜덤 문자로 생성.
		UUID uuid = UUID.randomUUID();
		String uuids = uuid.toString().replaceAll("-", "");
		
		//확장자를 추출합니다.
		String fileExtension = fileRealname.substring(fileRealname.indexOf("."), fileRealname.length());
		
		System.out.println("저장할 폴더 경로: " + fileUploadpath);
		System.out.println("실제 파일명: " + fileRealname);
		System.out.println("폴더명: " + fileLoca);
		System.out.println("확장자: " + fileExtension);
		System.out.println("고유랜덤문자: " + uuids);
		
		String fileName = uuids + fileExtension;
		System.out.println("변경해서 저장할 파일명: " + fileName);
		
		//업로드한 파일을 서버 컴퓨터 내의 지정한 경로에 실제로 저장.
		File saveFile = new File(fileUploadpath + "\\" + fileName);
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		vo.setFileLoca(fileLoca);
		vo.setFileName(fileName);
		vo.setFileRealname(fileRealname);
		vo.setFileUploadpath(fileUploadpath);
		
		service.regist(vo);
		
		ra.addFlashAttribute("msg","정상 등록 처리되었습니다.");
		return "redirect:/recruitment/list";
		
		
	}
	
	//글 상세보기 처리
	@GetMapping("/view/{boardNo}")
	public String freeDetail(@PathVariable int boardNo, @ModelAttribute("p") PageVO vo, Model model) {
		service.hit(boardNo);
		model.addAttribute("article", service.getContent(boardNo));
		return "recruitment/view"; //void사용 못함 경로에 @PathVariable방식으로 보내기 때문에
	}
	
	//글 수정 화면처리
	@GetMapping("/edit")
	public void freeModify(int boardNo, Model model) {
		model.addAttribute("article", service.getContent(boardNo));
	}
	
	//글 수정 처리
	@PostMapping("/Update")
	public String Update(BoardVO vo, RedirectAttributes ra) {
		service.update(vo);
		ra.addFlashAttribute("msg","게시글 수정이 정상 처리되었습니다.");
		return "redirect:/recruitment/view/" + vo.getBoardNo();
	}
	
	//글 삭제 처리
	@PostMapping("/Delete")
	public String Delete(int boardNo, RedirectAttributes ra) {
		service.delete(boardNo);
		ra.addFlashAttribute("msg", "게시글 삭제가 정상 삭제되었습니다.");
		return "redirect:/recruitment/list";
	}	
	
	@GetMapping("/chlist")
	public void chList(PageVO vo, Model model) {
		
		System.out.println(vo);
				
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));//총 게시물 개수
		
		System.out.println(pc);
		
		model.addAttribute("boardList", service.getList(vo));//게시물 목록
		model.addAttribute("pc", pc);		
	}
	


@GetMapping("/display")
public ResponseEntity<byte[]> getFile(String fileLoca, String fileName) {
	
	System.out.println("fileName: " + fileName);
	System.out.println("fileLoca: " + fileLoca);
	
	File file = new File("C:\\upload" + fileLoca + "\\" + fileName);
	System.out.println(file);
	
	ResponseEntity<byte[]> result = null;
	
	HttpHeaders headers = new HttpHeaders();
	//응답 헤더 파일에 여러가지 정보를 담아서 전송하는 것이 가능합니다.
	try {
		//probeContentType: 파라미터로 전달받은 파일의 타입을 문자열로 변환해 주는 메서드.
		//사용자에게 보여주고자 하는 데이터가 어떤 파일인지를 검사해서 응답상태 코드를 다르게 리턴할 수도 있다.
		headers.add("Content-Type", Files.probeContentType(file.toPath()));
		headers.add("merong", "hello");
		
		//ResponseEntity<>(응답 객체에 담을 내용, 헤더에 담을 내용, 상태 메세지)
		//FileCopyUtils: 파일 및 스트림 데이터 복사를 위한 간단한 유틸리티 메서드의 집합체.
		//file 객체 안에 있는 내용을 복사해서 byte 배열로 변환해서 바디에 담아 화면에 전달.
		result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		
	} catch (IOException e) {
		e.printStackTrace();
	}
	
	return result;
}




}




