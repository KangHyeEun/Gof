package com.awoo.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.awoo.service.EmployeeInfoService;
import com.awoo.service.MessageService;
import com.awoo.service.OrgChartService;
import com.awoo.service.PersonalInfoService;
import com.awoo.vo.BBSCommentVO;
import com.awoo.vo.InfoVO;
import com.awoo.vo.MessageVO;
import com.awoo.vo.PersonalInfoVO;

@Controller
public class OrgChartController {
	
	private OrgChartService service;
	private MessageService Mservice;
	private EmployeeInfoService Eservice;	
	
		public OrgChartController(OrgChartService service, MessageService mservice, EmployeeInfoService eservice) {
		super();
		this.service = service;
		Mservice = mservice;
		Eservice = eservice;
	}

		// 전체 리스트 + 상세검색 (+페이징)
		@GetMapping("/orgChart")
		public String OrgChart1(Model model,@RequestParam("page") String page,@RequestParam Map<String,String> map) {
			service.selectAllEInfo(model); /*tab2 페이지*/ 
			model.addAttribute("page", page);
			model.addAttribute("map", map);
			service.selectOrgDetail(model,map); /*tab1 페이지*/
			service.checkHoliday(model);
			Eservice.department(model);
			Eservice.position(model);
			return "/orgChart/OrgChart";
		}
		
		// 쪽지 보내기(비동기)
		@ResponseBody
		@PostMapping("/MessageInsert")
		public ResponseEntity<Map<String, String>> insert(@SessionAttribute("personalInfoVO") PersonalInfoVO vo,MessageVO mvo,
				@RequestParam("page") String page,Model model,@RequestBody Map<String, String> map) {
			
			model.addAttribute("page", page);
			
			int mreceiverId = Integer.parseInt((String) map.get("mreceiverId"));
			String mcontent = (String) map.get("mcontent");
			mvo.setMcontent(mcontent);
			mvo.setMreceiverId(mreceiverId);
			mvo.setMownerId(vo.getEmpno());
			
			Mservice.sendMessage(mvo);
			
			ResponseEntity<Map<String, String>> entity = new ResponseEntity<Map<String, String>>(map , HttpStatus.OK);
			return entity;
		}
	
}
