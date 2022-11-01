package com.awoo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.awoo.dao.PersonalInfoDAO;
import com.awoo.vo.InfoVO;
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

	/*
	 * public void AllList(Model model){ //
	 * model.addAttribute("count",dao.countInfo());
	 * model.addAttribute("list",dao.selectAllInfo()); }
	 */
	
	public void selectDetail(Model model,Map<String, String> map) {
		model.addAttribute("list",dao.selectDetail(map));
	}
	
	public void insertDataP(HttpServletRequest request,PersonalInfoVO vo) {
			
			String telNumber = "";
			String addr = "";
			String email_id = request.getParameter("email_id");
			String email_domain = request.getParameter("email_domain");
			String phoneNumber = request.getParameter("phoneNumber");		
			int empno = Integer.parseInt(request.getParameter("empno"));		
			
			vo.setEmpno(empno);
			vo.setPhone_number(phoneNumber);
			vo.setEmail(email_id+"@"+email_domain);
			
			if(request.getParameter("postcode") != null) {
				String postcode = request.getParameter("postcode");
				addr += postcode;
				if(request.getParameter("address") != null) {
					String  address = request.getParameter("address");
					addr += (" " + address);
					if(request.getParameter("detailAddress") != null) {
						String  detailAddress = request.getParameter("detailAddress");
						addr += (" " + detailAddress);
					}
					if(request.getParameter("extraAddress") != null) {
						String  extraAddress = request.getParameter("extraAddress");
						addr += (" " + extraAddress);
					}
				}
			}
			vo.setAddress(addr);
			
			
			if(request.getParameter("telNumber") != null && request.getParameter("telNumber") != "") {
				telNumber = request.getParameter("telNumber");
			}	
			vo.setTel_number(telNumber);
			
			dao.insertDataP(vo);
		
	}
	
public void updateP(HttpServletRequest request,PersonalInfoVO vo) {
		
		String telNumber = "";
		String addr = "";
		String email_id = request.getParameter("email_id");
		String email_domain = request.getParameter("email_domain");
		if(request.getParameter("phoneNumber") != null) {
			String phoneNumber = request.getParameter("phoneNumber");						
			vo.setPhone_number(phoneNumber);
		}
		
		vo.setEmail(email_id+"@"+email_domain);
		
		if(request.getParameter("postcode") != null) {
			String postcode = request.getParameter("postcode");
			addr += postcode;
			if(request.getParameter("address") != null) {
				String  address = request.getParameter("address");
				addr += (" " + address);
				if(request.getParameter("detailAddress") != null) {
					String  detailAddress = request.getParameter("detailAddress");
					addr += (" " + detailAddress);
				}
				if(request.getParameter("extraAddress") != null) {
					String  extraAddress = request.getParameter("extraAddress");
					addr += (" " + extraAddress);
				}
			}
		}
		vo.setAddress(addr);
		
		
		if(request.getParameter("telNumber") != null && request.getParameter("telNumber") != "") {
			telNumber = request.getParameter("telNumber");
		}	
		vo.setTel_number(telNumber);
		
		dao.updateP(vo);
	}
	
	public void selectInfo(InfoVO vo,Model model) {
		String[] email = dao.selectInfo(vo).get(0).getEmail().split("@");
		for (int i = 0; i < email.length; i++) {
			model.addAttribute("email_id",email[0]);
			model.addAttribute("email_domain",email[1]);
		}
		model.addAttribute("info",dao.selectInfo(vo));
	}
	
	
}
