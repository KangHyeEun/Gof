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


	@GetMapping("/Commuting")
	public String moveToCommuting(Model model) {
		model.addAttribute("CommutingList", service.selectCommuting(model));
		// 오늘(start_time)이 empno랑 같으면 
		model.addAttribute("startTime", service.getStartDate());
		model.addAttribute("endTime", service.getEndDate());
		model.addAttribute("distinctYear", service.getDistinctYear());
		model.addAttribute("distinctMonth", service.getDistinctMonth());
		model.addAttribute("overTime", service.countOverTime());
		model.addAttribute("absence", service.countAbsence());
		return "commuting/commuting";
	}
	@GetMapping("/CommutingEnter")
	public String enter(Model model) {
		service.insertEnter(model);
		return "redirect:/Commuting";
	}
	@GetMapping("/CommutingLeave")
	public String leave(Model model) {
		service.insertLeave(model);
		return "redirect:/Commuting";
	}
}

