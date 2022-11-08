package com.awoo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {

	@GetMapping("/chat")
	public String chat (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		return "chat/chat";
	}
	
}
