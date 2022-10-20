package com.awoo.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;

import com.awoo.dao.CommutingDAO;
import com.awoo.vo.CommutingVO;

@Service
public class CommutingService {

	private CommutingDAO dao;
	
	public CommutingService(CommutingDAO dao) {
		super();
		this.dao = dao;
	}

	public void getDefaultData(Model model) {
		
		// 초과 근무 시간 
		LocalDate date = LocalDate.now();
		LocalTime time = LocalTime.now();
		
		DateTimeFormatter timeformatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		DateTimeFormatter dateformatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		String formatedNow = time.format(timeformatter);
		String now = date+" "+formatedNow;
		String today = date.format(dateformatter);
		
		String dates = date.format(dateformatter);
		String[] splitedForMonth = dates.split("-");
		String onlyMonth = splitedForMonth[1];

		CommutingVO vo1 = new CommutingVO(); 
		vo1.setEmpno(123);
		
		String sortingMonth = (String)model.getAttribute("sortingMonth");
		String sortingYear = (String)model.getAttribute("sortingYear");
		if(sortingMonth != null && sortingYear != null) {
				String sortedDay = sortingYear+"-"+sortingMonth;
				if(sortingMonth.equals("0") || sortingMonth == "0") {
					sortingMonth = null;
				}
				if(sortingYear.equals("0") || sortingYear == "0") {
					sortingYear = null;
				}
				if(sortingMonth != null && sortingMonth.length() == 1) {
					sortingMonth = "0"+sortingMonth;
				}
				vo1.setWorkday(sortedDay);
				// 출퇴근 리스트 나오기
				Map<String,Object>map = new HashMap<String,Object>();
				map.put("empno", 123);
				map.put("year", sortingYear);
				map.put("month", sortingMonth);
				
				model.addAttribute("CommutingList", dao.selectCommuting(map));
			}
		
		CommutingVO vo2 = new CommutingVO();
		vo2.setWorkday(onlyMonth);	//지각이랑 초과근무시간에서 사용 
		vo2.setEmpno(123);
		
//		원래 사용하던 데이터들은 막아둠 필요할 수 있으니 주석은 안지웠습니다
		// 지각 개수
		model.addAttribute("countLate",dao.countLate(vo2));
		// 초과 근무 개수
		model.addAttribute("overTime", dao.countOverTime(vo2));
		// 정렬에 사용할 년도, 월 가저요기
		model.addAttribute("distinctYear", dao.getDistinctYear());
		model.addAttribute("distinctMonth", dao.getDistinctMonth());
		// 오늘의 출근시간 퇴근시간
		model.addAttribute("startTime", this.getStartDate(today));
		model.addAttribute("endTime", this.getEndDate(today));
	}
	
	
	// 출근 시간 저장
	public void insertEnter(Model model) {
		LocalDate date = LocalDate.now();
		LocalTime time = LocalTime.now();
		
		DateTimeFormatter timeformatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		DateTimeFormatter dateformatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		String formatedNow = time.format(timeformatter);
		String now = date+" "+formatedNow;
		String today = date.format(dateformatter);
		
		
		CommutingVO vo = new CommutingVO();
		vo.setStartTime(now);
		vo.setOverTime();
		vo.setEmpno(123);
		dao.insertEnter(vo);
	}
	
	// 퇴근 시간 저장
	public void insertLeave(Model model) {
		LocalDate date = LocalDate.now();
		LocalTime time = LocalTime.now();
		
		DateTimeFormatter timeformatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		DateTimeFormatter dateformatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		String formatedNow = time.format(timeformatter);
		String now = date+" "+formatedNow;
		String today = date.format(dateformatter);
		
		CommutingVO vo = new CommutingVO();
		vo.setEndTime(now);
		vo.setEmpno(123);
		vo.setWorkTime(this.getStartDate(today), formatedNow);
		vo.setOverTime();
		vo.setWorkday(today);
		dao.insertLeave(vo);
	}
	// 오늘의 출근 시간 불러오는 메서드
	public String getStartDate(String today) {
		CommutingVO vo = new CommutingVO();
		vo.setWorkday(today);
		vo.setEmpno(123);
		if(dao.getStartTime(vo) != null) {			
			return dao.getStartTime(vo);
		}		
		return null;
	}
	
	// 오늘의 퇴근 시간 불러오는 메서드
	public String getEndDate(String today) {
		CommutingVO vo = new CommutingVO();
		vo.setWorkday(today);
		vo.setEmpno(123);
		if(dao.getEndTime(vo) != null) {
			return dao.getEndTime(vo);
		}
		return null;
	}
	

	
}

