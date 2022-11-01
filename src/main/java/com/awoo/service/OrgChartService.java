package com.awoo.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.awoo.dao.EmployeeInfoDAO;
import com.awoo.dao.OrgChartDAO;
import com.awoo.vo.HolidayVO;
import com.awoo.vo.InfoVO;

@Service
public class OrgChartService {
	
	private EmployeeInfoDAO dao;
	private OrgChartDAO odao;

	public OrgChartService(EmployeeInfoDAO dao,OrgChartDAO odao) {
		super();
		this.dao = dao;
		this.odao = odao;
	}
	/*tab2*/
	public void selectAllEInfo(Model model) {
		model.addAttribute("edepartment",dao.edepartment());
		model.addAttribute("list1",dao.selectInfo1());
//		model.addAttribute("holiday",odao.holidayOrg());
	}
	
	/*tab1*/
	public void selectOrgDetail(Model model,Map<String, String> map) {
		model.addAttribute("list",odao.selectOrgDetail(map));
	}
	
//	public List<HolidayVO> holidayOrg(){
//		return odao.holidayOrg();
//	}
	
	/*휴가 체크*/
	public void checkHoliday(Model model){
		model.addAttribute("checkH",odao.checkHoliday());
	}
}


