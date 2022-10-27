package com.awoo.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.channels.Channels;
import java.nio.channels.FileChannel;
import java.nio.channels.WritableByteChannel;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.awoo.service.BBSService;
import com.awoo.vo.BBSVO;
import com.awoo.vo.PersonalInfoVO;

@Controller
@RequestMapping("bbsNotice")
public class BBSNoticeController {

	private BBSService service;

	public BBSNoticeController(BBSService service) {
		super();
		this.service = service;
	}

	//게시판 목록
	@GetMapping("/bbs")
	public String getBBSList(Model model, 
						  @RequestParam(value="page", defaultValue = "1") int page,
						  @RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
						  @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) {
		
		service.getBBSListNotice(model, page, searchType, keyword);
		return "bbsPage/bbs_notice";
	}
	
	//게시글 상세 보기
	@GetMapping("/bbs/{id}")
	public String getBBSItem(@SessionAttribute("personalInfoVO") PersonalInfoVO vo, 
							 Model model, @PathVariable("id") String id, 
							 HttpServletResponse response, HttpServletRequest req) {
		if(vo != null ) { 
			Cookie[] cookies = req.getCookies();
	        Cookie viewCookie = null; // 비교하기 위해 새로운 쿠키

	        // 쿠키가 있을 경우 
			if(cookies != null && cookies.length > 0) {
				for (Cookie cookie : cookies) {
					// Cookie의 name이 cookie + id와 일치하는 쿠키를 viewCookie에 넣어줌 
					if(cookie.getName().equals("cookie"+id)) {
	                    viewCookie = cookie;
					}
				}
			}
	        // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
	        if (viewCookie == null) {    
	            Cookie newCookie = new Cookie("cookie"+id, "|" + id + "|"); // 쿠키 생성(이름, 값)
	            response.addCookie(newCookie); // 쿠키 추가
	            service.setViewCountNotice(id); // 쿠키를 추가 시키고 조회수 증가시킴
	        } else {
	            String value = viewCookie.getValue(); // 쿠키 값 받아옴.
	        }
			service.getBBSContentNotice(model, id);
			return "bbsPage/content_notice";
		}else {
			return "redirect:/login/home";			
		}
	}
	
	//글쓰기 선택(select)
	@GetMapping("/wrbtn")
	public String createContent(@ModelAttribute("BBSVO") BBSVO vo2, Model model) {
		service.getCateogryNotice(model);
		return "bbsPage/set_notice";			
	}
	
	//글쓰기(insert)
	@PostMapping("/set")
	public String saveContent(@SessionAttribute("personalInfoVO") PersonalInfoVO vo, BBSVO vo2) {
		if(vo.getEmpno() == 220102) {
			vo2.setOwnerId(Integer.toString(vo.getEmpno()));
			vo2.setOwner(vo.getName());
			if(service.setBBSNotice(vo2)) {			
				return "redirect:/bbsNotice/bbs";
			}else {
				return "bbsPage/set_notice";			
			}
		}else {
			return "글쓰기 권한이 없습니다.";
		}
	}
	
	//수정하기 선택(select)
	@GetMapping("/put/{id}")
	public String setBBS(@PathVariable("id")String id, Model model) {
		service.getBBSContentNotice(model, id);
		service.getCateogryNotice(model);
		return "bbsPage/put_notice";
	}
	
	//수정하기(update)
	@PostMapping("/put")
	public String setBBS(@SessionAttribute("personalInfoVO")PersonalInfoVO vo, @ModelAttribute("bbsVO") BBSVO vo2) {
		vo2.setOwnerId(Integer.toString(vo.getEmpno()));
		vo2.setOwner(vo.getName());
		if(service.putBBSNotice(vo2)) {
			return "redirect:/bbsNotice/bbs";
		}else{
			return "redirect:/bbsNotice/put/"+vo2.getId();
		}
	}
	
	//삭제(delete)
	@GetMapping("/delete/{id}")
	public String deleteList(@SessionAttribute("personalInfoVO")PersonalInfoVO vo, @ModelAttribute("BBSVO") BBSVO vo2,
							 @PathVariable("id") String id) {
		vo2.setOwnerId(Integer.toString(vo.getEmpno()));
		vo2.setOwner(vo.getName());
		if(service.deleteBBSNotice(vo2)) {
			return "redirect:/bbsNotice/bbs";
		}else {
			return "redirect:/bbsNotice/bbs/"+vo2.getId();			
		}
	}
	
	//파일 업로드
	@PostMapping("/fileupload")
	@ResponseBody
	public String multiFileUploadWithAjax(MultipartFile[] uploadFile) throws IllegalStateException, IOException {
		
		for(MultipartFile file : uploadFile) {
			if(!file.getOriginalFilename().isEmpty()) {
				file.transferTo(Paths.get("C:/sample/"+file.getOriginalFilename()));
				System.out.println(file.getOriginalFilename() + "저장완료.");
			}else {
				System.out.println("에러가 발생했습니다.");
			}
		}
		//response body에 문자로 들어감
		return "files recieved";
	}


	//파일 다운로드
	//데이터 전송시에는 반드시 response 객체를 통해 전송을 해야 한다.
	@GetMapping("/download")
	public void download(HttpServletResponse response) throws Exception{
		//path 수정 필요
		String path = "C:/sample/abc.txt";
		
		Path file = Paths.get(path);
		
		//파일 이름 utf-8로 인코딩(파일 이름이 깨지지 않게)
		String filename = URLEncoder.encode(file.getFileName().toString(), "utf-8");
		
		//response 객체의 헤더 세팅
		response.setHeader("Content-Disposition", "attachment;filename="+filename);
		
		//파일 channel 설정(파일 가져오기 위해)
		FileChannel fc = FileChannel.open(file, StandardOpenOption.READ);
		
		//response에서 output스트림 추출 
		// 왜 채널을 바로 받지 않고 스트림을 받음?
		//response에서는 이렇게 두 번(채널-아웃풋스트림 뽑아내고-채널 변환) 해야함. 바로 채널을 뽑아낼 수 없음
		OutputStream out = response.getOutputStream();
		
		//outputStream에서 channel 추출
		WritableByteChannel outputChannel = Channels.newChannel(out);
		
		//response 객체로 파일 전송
		fc.transferTo(0, fc.size(), outputChannel);
		
		//기존에 물리적으로 저정되어있던 파일을 클라이언트의 요청으로 보낼 수 있게 됨
	}
	
	
}
