package com.awoo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.awoo.service.LoginService;
import com.awoo.vo.PersonalInfoVO;

@Controller
public class LoginController {

	private LoginService service;

	public LoginController(LoginService service) {
		super();
		this.service = service;
	}

	//로그인------------------------------------
	@PostMapping("/home/home")
	public String postLogin(PersonalInfoVO vo, HttpSession session) {
			if(service.isUser(vo, session)) {
				return "home/home";
			}else {
				return "Login";
			}
		}

}
