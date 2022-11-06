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
	
	private profileDAO dao;
	private PersonalInfoService service;

	public profileService(profileDAO dao,PersonalInfoService service) {
		super();
		this.dao = dao;
		this.service = service;
	}

	public void mySelectInfo(profileVO vo, Model model) {
		List<profileVO> fvo = dao.selectInfoJY(vo);
		model.addAttribute("myInfo", fvo);
	}
	
//	public void updateProfile(profileVO vo, Model model) {
//		dao.updateProfile(vo);
//	}
	

	

}
