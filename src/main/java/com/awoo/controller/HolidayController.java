package com.awoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.awoo.service.HolidayService;

@Controller
public class HolidayController {
	
	private HolidayService service;
	
	public HolidayController(HolidayService service) {
		super();
		this.service = service;
	}


	@GetMapping("Holiday")
	public String moveToHoliday(Model model) {
		model.addAttribute("holidayList", service.selectHoliday());
		return "holiday/holiday";
	}
	
}
