package com.awoo.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.awoo.dao.EmployeeInfoDAO;
import com.awoo.dao.OrgChartDAO;
import com.awoo.dao.PersonalInfoDAO;
import com.awoo.vo.InfoVO;

@Service
public class OrgChartService {
	
	private EmployeeInfoDAO dao1;
	private PersonalInfoDAO dao;
	private OrgChartDAO odao;

	public OrgChartService(EmployeeInfoDAO dao1, PersonalInfoDAO dao, OrgChartDAO odao) {
		super();
		this.dao1 = dao1;
		this.dao = dao;
		this.odao = odao;
	}

	public void selectAllEInfo(Model model) {
		model.addAttribute("edepartment",dao1.edepartment());
		model.addAttribute("count",dao1.countInfoE());
		model.addAttribute("list",dao1.selectInfo1());
	}
	
	public void selectOrg(Model model) {
		model.addAttribute("list",odao.selectOrg());
		model.addAttribute("count",dao1.countInfoE());
	}

	public void selectOrgDetail(Model model,InfoVO vo) {
		model.addAttribute("list",odao.selectOrgDetail(vo));
		model.addAttribute("count",dao1.countInfoE());
	}
}
