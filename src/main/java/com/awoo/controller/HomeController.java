package com.awoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.awoo.service.IdVerificationService;
import com.awoo.service.LoginService;
import com.awoo.vo.PersonalInfoVO;



@Controller
public class HomeController {
	
	private IdVerificationService service;
	
	public HomeController(IdVerificationService service) {
		super();
		this.service = service;
	}




	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String LogIn(PersonalInfoVO vo, Model model) {
		service.getIdVerification(model);
		
		return "LogIn";
	}
	
	
	

}

