package com.awoo.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.awoo.dao.LoginDAO;
import com.awoo.vo.PersonalInfoVO;

@Service
public class LoginService {
	
	LoginDAO loginDao;
	
	public LoginService(LoginDAO loginDao) {
		super();
		this.loginDao = loginDao;
	}

	//로그인
	public boolean isUser(PersonalInfoVO vo, HttpSession session) {
		if(loginDao.selectUser(vo) != null) {
			session.setAttribute("personalInfoVO", loginDao.selectUser(vo));
			return true;
		}else {
			return false;
		}
	}
}
