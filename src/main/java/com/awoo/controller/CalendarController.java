package com.awoo.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CalendarController {

	@GetMapping("/calendar")
	public String calendar() {
		
		return "calendar/calendar";
	}
	
}
