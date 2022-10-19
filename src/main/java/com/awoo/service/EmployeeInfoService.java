package com.awoo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.awoo.dao.EmployeeInfoDAO;
import com.awoo.vo.EmployeeInfoVO;

@Service
public class EmployeeInfoService {
	
	private EmployeeInfoDAO dao;

	public EmployeeInfoService(EmployeeInfoDAO dao) {
		super();
		this.dao = dao;
	}
	
	public List<EmployeeInfoVO> EList(){
		return dao.selectEmployee();
	};
	
}
