package com.awoo.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.awoo.dao.CalendarDAO;
import com.awoo.vo.CalendarVO;

@Service
public class CalendarService {
	private CalendarDAO dao;
	
	public CalendarService(CalendarDAO dao) {
		super();
		this.dao = dao;
	}
	
//	일정을 DB에서 조회
	public void selectDataMethod(Model model) {
		model.addAttribute("list", dao.selectSchedule());
	}
	
//	비동기로 일자별 일정 출력하기 위한 데이터 추출
	public List<CalendarVO> restDataMethod(Map<String, String> map) {
		return dao.selectRestData(map);
	}

//	일정을 DB에 저장
	public void insertDataMethod(CalendarVO vo, Model model) {
		
		if(vo.getCalTitle() == null || vo.getCalTitle() == "") {
			vo.setCalTitle("제목 없음");
		}
		if(vo.getCalAllday() == null || vo.getCalAllday() == "") {
			vo.setCalAllday("0");
		}
		if(vo.getCalShow() == null || vo.getCalShow() == "") {
			vo.setCalShow("0");
		}
		if(vo.getCalNotice() == null || vo.getCalNotice() == "") {
			vo.setCalNotice("0");
		}
//		test Commit
		dao.insertSchedule(vo);
	}
}
