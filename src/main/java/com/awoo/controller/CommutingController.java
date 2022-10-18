package com.awoo.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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


	@GetMapping("commuting")
	public String moveToCommuting(Model model) {
		model.addAttribute("CommutingList", service.selectCommuting());
		// 오늘(start_time)이 empno랑 같으면 
		model.addAttribute("startTime", service.getStartDate());
//		model.addAttribute("endTime", service.getEndDate());
		return "commuting/commuting";
	}
	@GetMapping("/commuting/enter")
	public String enter(Model model) {
		service.insertEnter(model);
		return "forward:/commuting";
	}
	@GetMapping("/commuting/leave")
	public String leave(Model model) {
		service.insertLeave(model);
		return "commuting/commuting";
	}
}
