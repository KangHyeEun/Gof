package com.awoo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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

	//로그인(세션 저장)
	@PostMapping("/login")
	public String login(PersonalInfoVO vo, HttpSession session, HttpServletRequest request) {
		return service.isUser(vo, session, request);
	}	
	
	//메인페이지 이동
	@GetMapping("/login/home")
	public String postLogin() {
		return "home/home";
	}
	
	//로그아웃(세션 초기화)
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";	
	}

}
