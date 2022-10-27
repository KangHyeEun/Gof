package com.awoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.awoo.service.CommutingService;
import com.awoo.vo.PersonalInfoVO;
@Controller
public class MainController {
	// 출근 퇴근 값 넣기위한 service 자동주입
		
		private CommutingService service;
		
		public MainController(CommutingService service) {
		super();
		this.service = service;
	}


		@RequestMapping("MoveToHome")
		public String MoveToHome(@SessionAttribute("personalInfoVO") PersonalInfoVO vo,
								Model model) {
			model.addAttribute("ename", vo.getName());
			model.addAttribute("empno", vo.getEmpno());
			service.getDefaultData(model);
			
			// 홈에 값 가져오는 애들 ---------------------------------------------
			
			service.getDateForHome(model);
			return "home/home";
		}
		// 출근 버튼 눌렀을 때
		@GetMapping("/CommutingEnter")
		public String enter(@SessionAttribute("personalInfoVO") PersonalInfoVO vo,
							Model model) {
			model.addAttribute("empno", vo.getEmpno());
			service.insertEnter(model);
			return "redirect:/MoveToHome";
		}
		// 퇴근 버튼 눌렀을 때
		@GetMapping("/CommutingLeave")
		public String leave(@SessionAttribute("personalInfoVO") PersonalInfoVO vo,
							Model model) {
			model.addAttribute("empno", vo.getEmpno());
			service.insertLeave(model);
			return "redirect:/MoveToHome";
		}
}
