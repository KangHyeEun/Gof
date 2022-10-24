package com.awoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.awoo.service.EmployeeInfoService;
import com.awoo.service.PersonalInfoService;

@Controller
public class AdminController {
	
	private PersonalInfoService Pservice;
	private EmployeeInfoService Eservice;
	
	public AdminController(PersonalInfoService pservice, EmployeeInfoService eservice) {
		super();
		Pservice = pservice;
		Eservice = eservice;
	}

	// admin List
	@GetMapping("/admin")
	public String admin(Model model) {
		
		Pservice.AllList(model);
		return "/admin/admin1";
	}
	
	// 상세보기
	@PostMapping("/detail/{id}")
	public String detail(@PathVariable("id") int id) {
		
		return "/admin/detail";
	}
	
	// 새로운 직원 추가 페이지 이동
	@GetMapping("/newE")
	public String newE() {
		
		return "/admin/admin2";
	}
}
