package com.awoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.awoo.service.HolidayService;
import com.awoo.vo.PersonalInfoVO;

@Controller
public class HolidayController {
	
	private HolidayService service;
	
	public HolidayController(HolidayService service) {
		super();
		this.service = service;
	}


	@GetMapping("Holiday")
	public String moveToHoliday(@RequestParam("page") String page,
								@RequestParam("year") String year,
								@SessionAttribute("personalInfoVO") PersonalInfoVO vo,
								Model model) {
		model.addAttribute("page", page);
		//임시empno
		model.addAttribute("empno", vo.getEmpno());
		model.addAttribute("year", year);
		service.selectHoliday(model);
		return "holiday/holiday";
	}
	@GetMapping("ApplyHoliday")
	public String ApplyHoliday(
							   @RequestParam("leaveType") String leaveType,	
							   @RequestParam("leaveStartDate") String leaveStartDate,
							   @RequestParam("leaveEndDate") String leaveEndDate,
							   @RequestParam("content") String content,
							   @RequestParam("halfType") String halfType,
							   @SessionAttribute("personalInfoVO") PersonalInfoVO vo,
							   Model model) {		
		model.addAttribute("leaveType", leaveType);
		model.addAttribute("leaveStartDate", leaveStartDate);
		model.addAttribute("leaveEndDate", leaveEndDate);
		model.addAttribute("content", content);
		model.addAttribute("userName", "김가빈");
		model.addAttribute("halfType", halfType);
		//임시empno
		model.addAttribute("empno", vo.getEmpno());
		
		service.insertHoliday(model);
		return "redirect:/Holiday?page=1&&year=0";
	}
	
	
}
