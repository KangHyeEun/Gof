package com.awoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.awoo.service.EmployeeInfoService;
import com.awoo.service.OrgChartService;
import com.awoo.service.PersonalInfoService;
import com.awoo.vo.InfoVO;

@Controller
public class OrgChartController {
	
	private OrgChartService service;
	private PersonalInfoService Pservice;
	private EmployeeInfoService Eservice;

	public OrgChartController(OrgChartService service, PersonalInfoService pservice, EmployeeInfoService eservice) {
		super();
		this.service = service;
		Pservice = pservice;
		Eservice = eservice;
	}

	@GetMapping("/orgChart1")
	public String OrgChart1(Model model) {
		service.selectAllEInfo(model);
		return "/orgChart/OrgChart1";
	}
	
	@GetMapping("/orgChart2")
	public String OrgChart2(Model model,@RequestParam("page") String page) {
		model.addAttribute("page", page);
		service.selectOrg(model);
		return "/orgChart/OrgChart2";
	}
	
	//상세 검색
	@PostMapping("/orgChart/details")
	public String selectDetail(Model model,InfoVO vo,@RequestParam("page") String page) {
		model.addAttribute("page", page);
		service.selectOrgDetail(model,vo);
		return "/orgChart/OrgChart2";
	}
	
}
