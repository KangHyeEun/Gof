package com.awoo.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.awoo.dao.IdVerificationDAO;
import com.awoo.dao.LoginDAO;

@Service
public class IdVerificationService {
	
	private IdVerificationDAO dao;
	

	public IdVerificationService(IdVerificationDAO dao) {
		super();
		this.dao = dao;
	}


	public void getIdVerification(Model model) {
		model.addAttribute("verificationData", dao.getVerification());
	}
}
