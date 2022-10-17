package com.awoo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.awoo.dao.CommutingDAO;
import com.awoo.vo.CommutingVO;

@Service
public class CommutingService {

	private CommutingDAO dao;
	
	public CommutingService(CommutingDAO dao) {
		super();
		this.dao = dao;
	}



	public List<CommutingVO> selectCommuting(){
		return dao.selectCommuting(); 
	} 
}
