package com.awoo.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	//메인페이지 이동  데이터 불러오는 것 때문에 MoveToHome으로 변경했습니다!!!
	@GetMapping("/login/home")
	public String postLogin() {
		return "redirect:/MoveToHome";
	}
	
	//로그아웃(세션 초기화)
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";	
	}
	
	//신입사원 초기 비밀번호 변경
	@PostMapping("/resetPassword")
	public String resetPW(@RequestParam Map<String, String> map) {
		service.resetPassword(map);
		return "redirect:/";
	}

}
