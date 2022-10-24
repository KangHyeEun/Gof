package com.awoo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.awoo.dao.HolidayDAO;
import com.awoo.vo.HolidayVO;

@Service
public class HolidayService {
	
	private HolidayDAO dao;

	public HolidayService(HolidayDAO dao) {
		super();
		this.dao = dao;
	}
	
	public void selectHoliday(Model model){
		int empno = (int)model.getAttribute("empno");
		String year = (String)model.getAttribute("year");
		if(year.equals("0") || year == "0") {
			year = null;
		}
		HolidayVO vo = new HolidayVO();
		vo.setEmpno(empno);
		vo.setHwriteDate(year);
		
		model.addAttribute("holidayList", dao.selectHoliday(vo));
		model.addAttribute("distinctYear", dao.distinctYear(vo));
	}
	public void insertHoliday(Model model) {
		String leaveType = (String)model.getAttribute("leaveType");
		String leaveStartDate = (String)model.getAttribute("leaveStartDate");
		String leaveEndDate = (String)model.getAttribute("leaveEndDate");
		String content = (String)model.getAttribute("content");
		String halfType = (String)model.getAttribute("halfType");
		String userName = (String)model.getAttribute("userName");
		int empno = (int)model.getAttribute("empno");
		HolidayVO vo = new HolidayVO();
		vo.setHuserName(userName);
		vo.setHtype(leaveType);
		vo.setHstartDate(leaveStartDate);
		vo.setHendDate(leaveEndDate);
		vo.setHcontent(content);
		vo.setHalfDay(halfType);
		vo.setApproval("요청중");
		vo.setEmpno(empno);
		dao.insertHoliday(vo);
	}
}
