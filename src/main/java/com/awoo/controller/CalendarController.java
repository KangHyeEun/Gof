package com.awoo.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.awoo.vo.CalendarVO;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

	@GetMapping
	public String calendar() {
		
		return "calendar/calendar";
	}
	
//	첫 화면 로딩시 calendar 메서드로 들어와서 redirect 한 뒤,
//	extract에서 데이터를 가져오는 로직 수행후에 달력 화면으로 이동 
	@GetMapping("/selectData")
	public String selectData() {
		
		return "calendar/calendar";
	}
	
	@GetMapping("/insertData")
	public void insertData(CalendarVO vo) {
		System.out.println(vo.getCalTitle());
		System.out.println(vo.getCalPlace());
		System.out.println(vo.getCalStart());
		System.out.println(vo.getCalEnd());
		System.out.println(vo.getCalAllday());
		System.out.println(vo.getCalSelector());
//		System.out.println(vo.getCal());
		
	}
}
