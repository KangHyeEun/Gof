package com.awoo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.awoo.service.EmployeeInfoService;
import com.awoo.service.PersonalInfoService;
import com.awoo.vo.EmployeeInfoVO;
import com.awoo.vo.InfoVO;
import com.awoo.vo.PersonalInfoVO;

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
		model.addAttribute("startPage","0");
		model.addAttribute("endPage","9");
		model.addAttribute("nowPage","1");
		Pservice.AllList(model);	
		return "/admin/admin1";
	}
	@GetMapping("/ex")
	public String ex(Model model) {
		Pservice.AllList(model);
		return "/admin/ex";
	}
	
	// 상세보기
	@GetMapping("/admin/detail/{id}")
	public String detail(@PathVariable("id") int id,Model model,InfoVO vo) {
		vo.setId(id);
		Pservice.selectInfo(vo, model);
		return "/admin/detail";
	}
	
	// 새로운 직원 추가 페이지 이동
	@GetMapping("/admin/newE")
	public String newE(Model model,HttpServletRequest request) {
		Eservice.selectEmpno(model, request);
		return "/admin/admin2";
	}
	
	// 새로운 직원 추가
	@PostMapping("/admin/insertData")
	public String insertData(PersonalInfoVO pvo,EmployeeInfoVO evo, HttpServletRequest request) {
		Eservice.insertDataE(pvo,evo,request);
		return "redirect:/admin";
	}
	
	//상세 검색
	@PostMapping("/admin/details")
	public String selectDetail(Model model,InfoVO vo) {
		model.addAttribute("startPage","0");
		model.addAttribute("endPage","9");
		model.addAttribute("nowPage","1");
//		model.addAttribute("count",);
		Pservice.selectDetail(vo, model);
		return "/admin/admin1";
	}
	
	// 페이지 처리
	@GetMapping("/admin/paging/{page}")
	public String paging(@PathVariable("page") int page,Model model) {
		model.addAttribute("nowPage",page);
		model.addAttribute("startPage", 10*(page-1));
		model.addAttribute("endPage", (10*(page-1))+9);			
		Pservice.AllList(model);			
		return "/admin/admin1";
	}
}
