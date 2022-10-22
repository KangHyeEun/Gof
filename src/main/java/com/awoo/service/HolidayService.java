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
		HolidayVO vo = new HolidayVO();
		vo.setEmpno(empno);
		List<HolidayVO> dvo = dao.selectHoliday(vo);
		for (HolidayVO holidayVO : dvo) {
			holidayVO.toString();
		}
		model.addAttribute("holidayList", dao.selectHoliday(vo));
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
		vo.setApproval(0);
		vo.setEmpno(empno);
		System.out.println(leaveType);
		System.out.println(leaveStartDate);
		System.out.println(leaveEndDate);
		System.out.println(content);
		System.out.println(halfType);
		System.out.println(userName);
		dao.insertHoliday(vo);
		
	}
}
