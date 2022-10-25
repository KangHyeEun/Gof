package com.awoo.controller;

import java.time.LocalDate;

import java.time.LocalTime;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

//	첫 화면 로딩시 calendar 메서드로 들어와서 redirect
	@GetMapping
	public String calendar() {
//		return "calendar/calendar";
		return "redirect:/calendar/selectData";
	}
	
//	extract에서 일정 데이터 가져오는 로직 수행후에 달력 화면으로 이동 
	@GetMapping("/selectData")
	public String selectData(Model model) {

		service.selectDataMethod(model);

//		List<CalendarVO> list = (List<CalendarVO>) model.getAttribute("list");
//		for (int i = 0; i < list.size(); i++) {
//			System.out.println("-------------------------------------------------");
//			System.out.println("고유아이디 : " + list.get(i).getCalId());
//			System.out.println("제목 : " + list.get(i).getCalTitle());
//			System.out.println("장소 : " + list.get(i).getCalPlace());
//			System.out.println("시작일 : " + list.get(i).getCalStart());
//			System.out.println("종료일 " + list.get(i).getCalEnd());
//			System.out.println("종일여부 : " + list.get(i).getCalAllday());
//			System.out.println("공개여부 : " + list.get(i).getCalSelector());
//			System.out.println("공지 : " + list.get(i).getCalCategory());
//			System.out.println("내용 : " + list.get(i).getCalContent());
//			System.out.println("사원번호 : " + list.get(i).getEmpno());
//			System.out.println("관리자여부 : " + list.get(i).getCheckAdmin());
//			System.out.println("승인신청여부 : " + list.get(i).getApproval());
//		}
		return "calendar/calendar";
	}
	
//	일정을 DB에 저장
	@PostMapping("/insertData")
	public String insertData(CalendarVO vo, Model model) {

		System.out.println("--------------");
		System.out.println(vo.getCalTitle());
		System.out.println("--------------");

		service.insertDataMethod(vo, model);

//		return "calendar/calendar";
		return "redirect:/calendar/selectData";
	}
}
