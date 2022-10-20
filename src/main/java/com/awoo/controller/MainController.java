package com.awoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.awoo.service.CommutingService;
@Controller
public class MainController {
	// 출근 퇴근 값 넣기위한 service 자동주입
		
		private CommutingService service;
		
		public MainController(CommutingService service) {
		super();
		this.service = service;
	}


		@GetMapping("MoveToHome")
		public String MoveToHome(Model model) {
			// 첫 화면 띄울 때 값 가지고 옴
			service.getDefaultData(model);
			return "home/home";
		}
		// 출근 버튼 눌렀을 때
		@GetMapping("/CommutingEnter")
		public String enter(Model model) {
			service.insertEnter(model);
			return "redirect:/MoveToHome";
		}
		// 퇴근 버튼 눌렀을 때
		@GetMapping("/CommutingLeave")
		public String leave(Model model) {
			service.insertLeave(model);
			return "redirect:/MoveToHome";
		}
}
