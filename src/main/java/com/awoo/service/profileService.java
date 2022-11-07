package com.awoo.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.awoo.dao.profileDAO;
import com.awoo.vo.EmployeeInfoVO;
import com.awoo.vo.PersonalInfoVO;
import com.awoo.vo.profileVO;

@Service
public class profileService {
	
	private profileDAO pdao;

	public profileService(profileDAO pdao) {
		super();
		this.pdao = pdao;
	}

	public void selectJY(int empno, Model model) {
		model.addAttribute("jy", pdao.select(empno));
	}

	public void updateJY(profileVO vo) {
		pdao.updateE(vo);
	}
	

}
