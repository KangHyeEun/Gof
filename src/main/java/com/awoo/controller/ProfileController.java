package com.awoo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.awoo.service.PersonalInfoService;
import com.awoo.vo.InfoVO;


@Controller
public class ProfileController {

	private PersonalInfoService service;
	
	public ProfileController(PersonalInfoService service) {
		super();
		this.service = service;
	}

	@GetMapping("/Profile")
	public String Profile(InfoVO vo, Model model) {
		service.mySelectInfo(vo, model);	
		return "/Profile/Profile1";
	}
	
}
