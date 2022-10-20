package com.awoo.controller;

import java.net.http.HttpRequest;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.awoo.service.CommutingService;
import com.awoo.vo.CommutingVO;

@Controller
public class CommutingController {
	@GetMapping("template")
	public String template() {
		return "include/template";
	}
	@GetMapping("bbstemplate")
	public String bbstemplate() {
		return "include/bbs_template";
	}
	
	private CommutingService service;
	
	
	public CommutingController(CommutingService service) {
		super();
		this.service = service;
	}


	@GetMapping("/Commuting")
	public String moveToCommuting(@RequestParam("page") String page,
								  @RequestParam("year") String sortingYear, 
								  @RequestParam("month") String sortingMonth,
								  Model model) {
//		System.out.println(page);
//		System.out.println(sortingYear);
//		System.out.println(sortingMonth);
//		
		model.addAttribute("page", page);
		model.addAttribute("sortingYear", sortingYear);
		model.addAttribute("sortingMonth", sortingMonth);
		service.getDefaultData(model);		
		return "commuting/commuting";
	}
	
}

