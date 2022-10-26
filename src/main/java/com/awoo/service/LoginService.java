package com.awoo.service;

import javax.servlet.http.HttpServletRequest;
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
	public String isUser(PersonalInfoVO vo, HttpSession session, HttpServletRequest request) {
		String path = "";
		if(loginDao.selectUser(vo) != null) {
			//유저 정보를 세션에 넣기 전 세션 초기화
			session.invalidate();
			//초기화한 후애 다시 세션 불러와야 함
			session = request.getSession();
			//세션에 담기
			session.setAttribute("personalInfoVO", loginDao.selectUser(vo));
//			path ="redirect:/login/home";
			path ="redirect:/MoveToHome";
		}else {
			//세션을 초기화하고 로그인 창으로 돌려보냄
			session.invalidate();
			path = "LogIn";
		}
		return path;
	}
}
