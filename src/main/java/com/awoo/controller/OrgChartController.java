package com.awoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

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
	public String OrgChart2(Model model) {
		model.addAttribute("startPage","0");
		model.addAttribute("endPage","9");
		model.addAttribute("nowPage","1");
		service.selectOrg(model);
		return "/orgChart/OrgChart2";
	}
	
	//상세 검색
	@PostMapping("/orgChart/details")
	public String selectDetail(Model model,InfoVO vo) {
		model.addAttribute("startPage","0");
		model.addAttribute("endPage","9");
		model.addAttribute("nowPage","1");
//		model.addAttribute("count",);
		service.selectOrgDetail(model,vo);
		return "/orgChart/OrgChart2";
	}
	
	// 페이지 처리
		@GetMapping("/orgChart/paging/{page}")
		public String paging(@PathVariable("page") int page,Model model) {
			model.addAttribute("nowPage",page);
			model.addAttribute("startPage", 10*(page-1));
			model.addAttribute("endPage", (10*(page-1))+9);			
			service.selectOrg(model);			
			return "/orgChart/OrgChart2";
		}
}
