package com.awoo.controller;

import java.security.Provider.Service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.awoo.service.MessageService;
import com.awoo.vo.MessageVO;




@Controller
@RequestMapping("/message")
public class MessageController {
	
	private MessageService service;
	
	public MessageController(MessageService service) {
		super();
		this.service = service;
	}

	@GetMapping
	public String index(Model model) {
		service.getList(model);
		return "message/message1";
	}
	
	

	//게시판 출력
	@GetMapping("result1")
	public String result1(MessageVO vo) {
		service.setData1(vo);
		return "redirect:/message";
	}
	
	//쪽지 보내기 페이지로 이동
	@GetMapping("result2")
	public String result(Model model) {
		service.getList(model);
		return "/message/result2";
	}
	
	//보낸 쪽지함 페이지로 이동
		@GetMapping("message2")
		public String message2(Model model) {
			service.getList(model);
			return "/message/message2";
		}
	
	//쪽지 보내기 내용
	@PostMapping("result2")
	public String result2(MessageVO vo) {
		service.setData1(vo);
		return "redirect:/message";
	}
	
	//받은 쪽지함 아이디 입력 버전 삭제(성공)
//	@PostMapping("/message/result7")
//	public String result7(MessageVO vo) {
//		System.out.println("!!!");
//		service.deleteData1(vo);
//		return "redirect:/message";
//	}
	
//    @RequestMapping(value="message/result7", method=RequestMethod.POST)	
//    public String result7(@RequestBody MessageVO MessageVO) throws Exception { 	
//    	System.out.println("!!!");
//    	service.deleteData1(MessageVO); 		
//    	return "message/result7";	}
//
//	
	//보낸쪽지함 아이디 입력 버전 삭제(성공)
	@GetMapping("result8")
	public String result8(MessageVO vo) {
		service.deleteData2(vo);
		return "redirect:/message";
	}
	
	
	
	//내용클릭시 쪽지 확인 이동
	@GetMapping("content")
	public String content(Model model) {
		service.getList(model);
		return "message/content";
	}
	
	

	//내용 쪽지함에서 원래 메세지함으로 이동
	@GetMapping("message1")
	public String message(Model model) {
		service.getList(model);
		return "message/message1";
	}
	

	//---------------------Test
	

	
	
//	@GetMapping("message/content/{id}")
//	public String getBBSItem(@SessionAttribute("MessageVO")MessageVO vo, Model model, @PathVariable("id")String id) {
//		if(vo != null ) {
//			service.getBBSContent(model, id);
//			return "message/content";
//		}else {
//			return "message/message1";			
//		}
//	}
	
	

	
}
	
	
	


