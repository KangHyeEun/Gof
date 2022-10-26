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

	//쪽지 게시판 출력
	public void getList(Model model) {
		model.addAttribute("list", dao.selectList());
	}

	//데이터 추가
	public void setData1(MessageVO vo) {
		dao.insertData(vo);
	}

//	//받은 쪽지함 삭제
//	public void deleteData1(MessageVO vo) {
//		dao.deleteData1(vo);
//	}

	//보낸 쪽지함 삭제
	public void deleteData2(MessageVO vo) {
		dao.deleteData2(vo);
	}

	//게시글 상세 보기
	public void MessageContent(Model model, String id) {
		model.addAttribute("messageVO",dao.selectBBS(id));
	}




	



}
