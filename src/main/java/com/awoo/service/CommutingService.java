package com.awoo.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
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


	
	
	public List<CommutingVO> selectCommuting(){
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
		vo.setWorkTime(this.getStartDate(), now);
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
}
