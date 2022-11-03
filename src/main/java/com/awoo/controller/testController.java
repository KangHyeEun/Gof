package com.awoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.awoo.service.EmployeeInfoService;
import com.awoo.service.PersonalInfoService;
import com.awoo.vo.EmployeeInfoVO;
import com.awoo.vo.PersonalInfoVO;

@Controller
public class testController {

	private PersonalInfoService Pservice;
	private EmployeeInfoService Eservice;
	private int empno;
	
	public testController(PersonalInfoService pservicePro, EmployeeInfoService eservicePro) {
		super();
		Pservice = pservicePro;
		Eservice = eservicePro;
	}
	
	@GetMapping("/testing")
	public String testing(@SessionAttribute("personalInfoVO") PersonalInfoVO vo,
						Model model) {
		
		empno = vo.getEmpno();
		
		System.out.println(empno);
		
		Eservice.department(model);
		Eservice.position(model);
		
		Eservice.selectPerPro(empno, model);
		Pservice.selectPerPro(empno, model);
		
//		EmployeeInfoVO eVO = (EmployeeInfoVO) model.getAttribute("eVO");
//		PersonalInfoVO pVO = (PersonalInfoVO) model.getAttribute("pVO");
		
		
		
		return "calendar/test";
	}
	
}
