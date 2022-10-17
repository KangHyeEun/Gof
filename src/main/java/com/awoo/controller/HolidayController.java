package com.awoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HolidayController {
	
	@GetMapping("holiday")
	public String moveToHoliday() {
		return "holiday/holiday";
	}
}
