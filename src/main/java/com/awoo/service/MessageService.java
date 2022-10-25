package com.awoo.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.awoo.dao.MessageDAO;
import com.awoo.vo.MessageVO;


@Service
public class MessageService {
	
	private MessageDAO dao;

	public MessageService(MessageDAO dao) {
		super();
		this.dao = dao;
	}
	
	public void getList(Model model) {
		model.addAttribute("list", dao.selectList());
	}
	
	
	public void setData1(MessageVO vo) {
		dao.insertData(vo);
	}

	public void deleteData1(MessageVO vo) {
	dao.deleteData1(vo);
	}
	
	public void deleteData2(MessageVO vo) {
		dao.deleteData2(vo);
	}
	
	


	
	
}
