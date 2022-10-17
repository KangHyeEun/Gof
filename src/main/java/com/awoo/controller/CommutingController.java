package com.awoo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.awoo.service.CommutingService;
import com.awoo.vo.CommutingVO;

@Controller
public class CommutingController {
	
	private CommutingService service;
	
	
	public CommutingController(CommutingService service) {
		super();
		this.service = service;
	}


	@GetMapping("commuting")
	public String moveToCommuting(Model model) {
		model.addAttribute("CommutingList", service.selectCommuting());
		return "commuting/commuting";
	}
	@GetMapping("enterpopup")
	public String enterpopup() {
		return "commuting/test";
	}
}
