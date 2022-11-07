package com.awoo.controller;



import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.awoo.service.EmployeeInfoService;
import com.awoo.service.PersonalInfoService;
import com.awoo.service.UploadfilesService;
import com.awoo.service.profileService;
import com.awoo.vo.PersonalInfoVO;
import com.awoo.vo.UploadfilesVO;
import com.awoo.vo.profileVO;


@Controller
public class ProfileController {

	private profileService pservice;
	private UploadfilesService Uservice;
	
	
	public ProfileController(profileService pservice, UploadfilesService uservice) {
		super();
		this.pservice = pservice;
		Uservice = uservice;
	}
	
	
	// 조회 
	@GetMapping("/Profile")
	public String profile(Model model, Model model1, UploadfilesVO uvo, @SessionAttribute("personalInfoVO")PersonalInfoVO pvo ) {
		// 내정보 가져오기
		pservice.selectJY(pvo.getEmpno(),model1);
		//사진가져오기
		uvo.setOwnerId(pvo.getEmpno());
		Uservice.selectFile(uvo, model);
		return "Profile/Profile1";
	}
	
	@PostMapping("/Profile/updateData")
	public String update(@SessionAttribute("personalInfoVO")PersonalInfoVO pvo, profileVO vo) {
		vo.setEmpno(pvo.getEmpno());
		
		pservice.updateJY(vo);
		return "redirect:/Profile";
	}

}
	
