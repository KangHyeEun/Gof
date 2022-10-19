package com.awoo.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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

	
	public List<CommutingVO> selectCommuting(Model model){
		LocalDate date = LocalDate.now();
		DateTimeFormatter monthformatter = DateTimeFormatter.ofPattern("MM");
//		DateTimeFormatter dayformatter = DateTimeFormatter.ofPattern("dd");
		
		String todayMonth = date.format(monthformatter);
//		String todayDay = date.format(dayformatter);
		model.addAttribute("todayMonth", todayMonth);
//		model.addAttribute("todayDay", todayDay);
		return dao.selectCommuting(); 
		
	}

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
		vo.setWorkTime(this.getStartDate(), formatedNow);
		vo.setOverTime();
		vo.setWorkday(today);
		dao.insertLeave(vo);
	}
	
	public String getStartDate() {
		LocalDate date = LocalDate.now();
		LocalTime time = LocalTime.now();
		
		DateTimeFormatter timeformatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		DateTimeFormatter dateformatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		String formatedNow = time.format(timeformatter);
		String now = date+" "+formatedNow;
		String today = date.format(dateformatter);
		
		CommutingVO vo = new CommutingVO();
		vo.setWorkday(today);
		vo.setEmpno(123);
		if(dao.getStartTime(vo) != null) {			
			return dao.getStartTime(vo);
		}
		return null;
	}
	public String getEndDate() {
		LocalDate date = LocalDate.now();
		LocalTime time = LocalTime.now();
		
		DateTimeFormatter timeformatter = DateTimeFormatter.ofPattern("HH:mm:ss");
		DateTimeFormatter dateformatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		String formatedNow = time.format(timeformatter);
		String now = date+" "+formatedNow;
		String today = date.format(dateformatter);
		
		CommutingVO vo = new CommutingVO();
		vo.setWorkday(today);
		vo.setEmpno(123);
		if(dao.getEndTime(vo) != null) {
			return dao.getEndTime(vo);
		}
		return null;
	}
	public List<String> getDistinctYear() {
		return dao.getDistinctYear();
	}
	public List<String> getDistinctMonth() {
		return dao.getDistinctMonth();
	}
	public int countOverTime() {
		CommutingVO vo = new CommutingVO();
		vo.setEmpno(123);
		System.out.println(dao.countOverTime(vo)+"여기는 오버타임");
		return dao.countOverTime(vo);
	}
	public int countAbsence() {
		 List<CommutingVO> vo =  dao.selectCommuting();
		 int day = 0;
		 int week = 0;
		 int cnt = 0; 
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ;
		 for (int i = 0; i < vo.size(); i++) {
			 Date nDate = null;
			try {
				nDate = dateFormat.parse(vo.get(i).getWorkday());
			} catch (ParseException e) {
				e.printStackTrace();
			}         
			  Calendar cal = Calendar.getInstance();
			  cal.setTime(nDate);         
			  int dayNum = cal.get(Calendar.DAY_OF_WEEK);                  
			  if(dayNum >= 1) {
				  week +=1;
			  }
			  
			  switch(dayNum){
			      case 1:
			    	  week += 1;
//			          day = "2"; //"일";  
			          break ;
			      case 2:
			          day += 1; //"월";
			          break ;
			      case 3:
			          day += 1; //"화";
			          break ;
			      case 4:
			          day += 1; //"수";
			          break ;
			      case 5:
			          day += 1; //"목";
			          break ;
			      case 6:
			          day += 1; //"금";
			          break ;
			      case 7:
//			          day = "2"; //"토";
			    	  week +=1;
			          break ;
			      
			  	}
		  	        
//			  if(day%7 == 0) {
//				  week += 1;
//			  }
			  System.out.println(day +"여기는 day");
			  System.out.println(week+"여기는 위크");
		  }
		 System.out.println(week);
		   return day;
	}
}

