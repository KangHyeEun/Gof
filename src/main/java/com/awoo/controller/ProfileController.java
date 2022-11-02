package com.awoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProfileController {

	@GetMapping("/Profile")
	public String Profile() {
		return "/Profile/Profile1";
	}
	
}
