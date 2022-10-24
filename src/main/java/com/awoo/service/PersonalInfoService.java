package com.awoo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.awoo.dao.PersonalInfoDAO;
import com.awoo.vo.PersonalInfoVO;

@Service
public class PersonalInfoService {
	
	private PersonalInfoDAO dao;

	public PersonalInfoService(PersonalInfoDAO dao) {
		super();
		this.dao = dao;
	}
	
	public List<PersonalInfoVO> PList(){
		return dao.selectPersonal();
	}

	public void AllList(Model model){
		model.addAttribute("list",dao.selectAllInfo());
	}
	
}
