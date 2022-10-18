package com.awoo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.awoo.dao.HolidayDAO;
import com.awoo.vo.HolidayVO;

@Service
public class HolidayService {
	
	private HolidayDAO dao;

	public HolidayService(HolidayDAO dao) {
		super();
		this.dao = dao;
	}
	
	public List<HolidayVO> selectHoliday(){
		return dao.selectHoliday();
	}
	
}
