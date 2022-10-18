package com.awoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestCalendarContoller {

	@GetMapping("/calendar/test1")
	public String test1() {
		
		return "calendar/calendar";
	}
	@GetMapping("/menu/test2")
	public String test2() {
		
		return "commuting/commuting";
	}
}
