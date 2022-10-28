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
		List<CalendarVO> selectList = dao.selectSchedule();
		System.out.println(selectList.get(0).getCalStart());
		
		String calStart;
		String calEnd;
		
		String calStartDate;
		String calStartTime;
		String calEndDate;
		String calEndTime;
		
		String calStartYear;
		String calStartMonth;
		String calStartDay;

		String calEndYear;
		String calEndMonth;
		String calEndDay;

		for (int i = 0; i < selectList.size(); i++) {
			calStart = selectList.get(i).getCalStart();
			calEnd = selectList.get(i).getCalEnd();
			
			calStartDate = calStart.split(" ")[0];
			calStartTime = calStart.split(" ")[1];
			calEndDate = calEnd.split(" ")[0];
			calEndTime = calEnd.split(" ")[1];
			
			calStartYear = calStartDate.split("-")[0];
			calStartMonth = calStartDate.split("-")[1];
			calStartDay = calStartDate.split("-")[2];

			calEndYear = calEndDate.split("-")[0];
			calEndMonth = calEndDate.split("-")[1];
			calEndDay = calEndDate.split("-")[2];
			
			if (Integer.parseInt(calStartMonth) < 10) calStartMonth = calStartMonth.split("0")[1];
			if (Integer.parseInt(calStartDay) < 10) calStartDay = calStartDay.split("0")[1];
			if (Integer.parseInt(calEndMonth) < 10) calEndMonth = calEndMonth.split("0")[1];
			if (Integer.parseInt(calEndDay) < 10) calEndDay = calEndDay.split("0")[1];
			
			calStartDate = calStartYear + "-" + calStartMonth + "-" + calStartDay;
			calEndDate = calEndYear + "-" + calEndMonth + "-" + calEndDay;
			
			calStart = "" + calStartDate + " " + calStartTime;
			calEnd = "" + calEndDate + " " +  calEndTime;
			
			selectList.get(i).setCalStart(calStart);
			selectList.get(i).setCalEnd(calEnd);
		}
		
		model.addAttribute("list", selectList);
	}
	
//	비동기로 일자별 일정 출력하기 위한 데이터 추출
	public List<CalendarVO> restDataMethod(Map<String, String> map) {
		String mapStart = map.get("calEnd").split("-")[2];
		int temp = Integer.parseInt(mapStart) + 1;
		
		String strTemp = "";
		strTemp += map.get("calEnd").split("-")[0];
		strTemp += "-" + map.get("calEnd").split("-")[1];
		strTemp += "-" + temp;
		
		map.put("calEnd", strTemp);
		
		
		List<CalendarVO> list = dao.selectRestData(map);
		String calStart;
		String calEnd;
		
		String calStartDate;
		String calStartTime;
		String calEndDate;
		String calEndTime;
		
		String calStartYear;
		String calStartMonth;
		String calStartDay;

		String calEndYear;
		String calEndMonth;
		String calEndDay;

		for (int i = 0; i < list.size(); i++) {
			calStart = list.get(i).getCalStart();
			calEnd = list.get(i).getCalEnd();
			
			calStartDate = calStart.split(" ")[0];
			calStartTime = calStart.split(" ")[1];
			calEndDate = calEnd.split(" ")[0];
			calEndTime = calEnd.split(" ")[1];
			
			calStartYear = calStartDate.split("-")[0];
			calStartMonth = calStartDate.split("-")[1];
			calStartDay = calStartDate.split("-")[2];

			calEndYear = calEndDate.split("-")[0];
			calEndMonth = calEndDate.split("-")[1];
			calEndDay = calEndDate.split("-")[2];
			
			if (Integer.parseInt(calStartMonth) < 10) calStartMonth = calStartMonth.split("0")[1];
			if (Integer.parseInt(calStartDay) < 10) calStartDay = calStartDay.split("0")[1];
			if (Integer.parseInt(calEndMonth) < 10) calEndMonth = calEndMonth.split("0")[1];
			if (Integer.parseInt(calEndDay) < 10) calEndDay = calEndDay.split("0")[1];
			
			calStartDate = calStartYear + "-" + calStartMonth + "-" + calStartDay;
			calEndDate = calEndYear + "-" + calEndMonth + "-" + calEndDay;
			
			calStart = "" + calStartDate + " " + calStartTime;
			calEnd = "" + calEndDate + " " +  calEndTime;
			
			list.get(i).setCalStart(calStart);
			list.get(i).setCalEnd(calEnd);
		}
		return list;
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
