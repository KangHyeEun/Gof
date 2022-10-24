package com.awoo.service;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.awoo.dao.EmployeeInfoDAO;
import com.awoo.vo.EmployeeInfoVO;
import com.awoo.vo.PersonalInfoVO;

@Service
public class EmployeeInfoService {
	
	private EmployeeInfoDAO dao;
	private PersonalInfoService service;
	
	public EmployeeInfoService(EmployeeInfoDAO dao, PersonalInfoService service) {
		super();
		this.dao = dao;
		this.service = service;
	}	
	
	public void selectEmpno(Model model,HttpServletRequest request){
		int j = 1;
		
		DecimalFormat df = new DecimalFormat("00");
		String em = 
				LocalDate.now().format(DateTimeFormatter.ofPattern("yy")) +
				LocalDate.now().format(DateTimeFormatter.ofPattern("MM")) +
				String.valueOf(df.format(j)); 
		
		for (int i = 0; i < dao.selectEmpno().size(); i++) {
			if(Integer.parseInt(em) == dao.selectEmpno().get(i).getEmpno()) {
				j++;
				em = LocalDate.now().format(DateTimeFormatter.ofPattern("yy")) +
					 LocalDate.now().format(DateTimeFormatter.ofPattern("MM")) +
					 String.valueOf(df.format(j)); 
			}
		}
		
		
		model.addAttribute("empno", em);
	};	
	
	public List<EmployeeInfoVO> EList(){
		return dao.selectEmployee();
	};
	
	public void insertDataE(PersonalInfoVO vop,EmployeeInfoVO vo, HttpServletRequest request) {
		
		int empno = Integer.parseInt(request.getParameter("empno"));		
		vo.setEmpno(empno);
		
		dao.insertDataE(vo);
		service.insertDataP(request,vop);
	}
	
}
