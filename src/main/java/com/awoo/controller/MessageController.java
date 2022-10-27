package com.awoo.controller;



import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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


//
//	//보낸쪽지함 아이디 입력 버전 삭제(성공)
//	@GetMapping("result8")
//	public String result8(MessageVO vo) {
//		service.deleteData2(vo);
//		return "redirect:/message";
//	}
//

	//내용 쪽지함에서 원래 메세지함으로 이동
	@GetMapping("/message1")
	public String message(Model model) {
		service.getList(model);
		return "message/message1";
	}

	//상세 게시판 보기 - 받은 쪽지함1
	@GetMapping("/messageValue/{id}")
	public String getBBSItem(MessageVO vo, Model model, @PathVariable("id")String id) {
		//		System.out.println("여기오니");
		//		오류시 콘솔 찍는 법		
		//		System.out.println(vo.getId());
		if(vo != null ) {
			service.MessageContent(model, id);
			return "message/content";
		}else {
			return "redirect:/message/message1";		
		}
	}

	//상세 게시판 보기 - 받은 쪽지함2
	@GetMapping("/messageValue2/{id}")
	public String getBBSItem2(MessageVO vo, Model model, @PathVariable("id")String id) {
		if(vo != null ) {
			service.MessageContent(model, id);
			return "message/content2";
		}else {
			return "redirect:/message/message2";		
		}
	}

	//체크박스 삭제
	@PostMapping("/delete")
	@ResponseBody
	public ResponseEntity<String> deleteItems(@RequestBody int[] ids){
		
//		for (String string : idArr) {
//			System.out.println(string);
//		}
		ResponseEntity<String> response = null;
		
		if(service.deleteData1(ids)) {
			response = new ResponseEntity<String>("ok", HttpStatus.OK);
		}else {
			response = new ResponseEntity<String>("err", HttpStatus.NOT_FOUND);
		}
		
		return response;
		
	}
	
}





