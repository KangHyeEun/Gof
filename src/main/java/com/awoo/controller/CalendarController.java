package com.awoo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.awoo.service.CalendarService;
import com.awoo.vo.CalendarVO;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	private CalendarService service;
	
	public CalendarController(CalendarService service) {
		super();
		this.service = service;
	}
	//test Commit//test Commit
//	첫 화면 로딩시 calendar 메서드로 들어와서 redirect
	@GetMapping
	public String calendar() {
		return "redirect:/calendar/selectData/0/0";
	}
	
//	extract에서 일정 데이터 가져오는 로직 수행후에 달력 화면으로 이동 
	@GetMapping("/selectData/{year}/{month}")
	public String selectData(Model model,
			@PathVariable String year, @PathVariable String month) {
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		
		service.selectDataMethod(model);
		return "calendar/calendar";
	}
	
//	비동기로 일자별 일정 출력하기 위한 데이터 추출
	@PostMapping("/restData")
	@ResponseBody
	public List<CalendarVO> restData(@RequestBody Map<String, String> map) {
		return service.restDataMethod(map);
	}
	
//	일정을 DB에 저장
	@PostMapping("/insertData/{year}/{month}")
	public String insertData(CalendarVO vo, Model model,
			@PathVariable String year, @PathVariable String month) {
		
		service.insertDataMethod(vo, model);
//		return "calendar/calendar";
		return "redirect:/calendar/selectData/"+year+"/"+month;
	}
}












