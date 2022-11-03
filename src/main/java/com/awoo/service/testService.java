package com.awoo.service;

import org.springframework.stereotype.Service;

import com.awoo.dao.EmployeeInfoDAO;
import com.awoo.dao.PersonalInfoDAO;

@Service
public class testService {

	private PersonalInfoDAO Pdao;
	private EmployeeInfoDAO Edao;
	
	public testService(PersonalInfoDAO pdao, EmployeeInfoDAO edao) {
		super();
		Pdao = pdao;
		Edao = edao;
	}
	
	
}
