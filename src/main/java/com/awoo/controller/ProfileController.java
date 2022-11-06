package com.awoo.controller;



import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestParam;


import com.awoo.service.EmployeeInfoService;
import com.awoo.service.PersonalInfoService;
import com.awoo.service.UploadfilesService;
import com.awoo.service.profileService;

import com.awoo.vo.UploadfilesVO;
import com.awoo.vo.profileVO;


@Controller
public class ProfileController {

	private profileService service;
	private PersonalInfoService Pservice;
	private EmployeeInfoService Eservice;
	private UploadfilesService Uservice;
	
	public ProfileController(PersonalInfoService pservice, EmployeeInfoService eservice, UploadfilesService uservice, profileService service) {
		super();
		this.service = service;
		Pservice = pservice;
		Eservice = eservice;
		Uservice = uservice;
	}
	
//	// 조회
//	@GetMapping("/Profile")
//	public String Profile(profileVO vo, Model model) {
//		service.mySelectInfo(vo, model);	
//		return "/Profile/Profile1";
//	}
	
//	// 수정
//	@RequestMapping("/Profile/updateData")
//	public String updateProfile(profileVO vo, Model model) {
//		service.updateProfile(vo, model);
//		return "redirect:/Profile/Profile1";
//	}
//	
//	
	// 조회
	@GetMapping("/Profile")
	public String Profile(profileVO vo, Model model,HttpServletResponse response,UploadfilesVO uvo,@RequestParam("empno") int empno) {
		service.mySelectInfo(vo, model);
		uvo.setOwnerId(empno);
		Uservice.selectFile(uvo, model);
		return "/Profile/Profile1";
	}
	
// 수정 데이터 오는지 찍어본거
//	@PostMapping("/Profile/updateData")
//	   public ResponseEntity<String> Profile(profileVO profileVO){
//	      System.out.println("profileVO : " + profileVO);
//	      return null;
//	   }
//	
//	
	

}
	
