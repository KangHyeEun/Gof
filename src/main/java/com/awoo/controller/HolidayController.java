package com.awoo.controller;

import java.text.ParseException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.awoo.service.EmployeeInfoService;
import com.awoo.service.HolidayService;
import com.awoo.vo.HolidayVO;
import com.awoo.vo.PersonalInfoVO;

@Controller
public class HolidayController {
	
	private HolidayService service;
	private EmployeeInfoService Eservice;
	
	public HolidayController(HolidayService service, EmployeeInfoService eservice) {
		super();
		this.service = service;
		Eservice = eservice;
	}
	
	@GetMapping("Holiday")
	public String moveToHoliday(@RequestParam("page") String page,
								@RequestParam("year") String year,
								@SessionAttribute("personalInfoVO") PersonalInfoVO vo,
								Model model) {
		model.addAttribute("page", page);
		//임시empno
		model.addAttribute("empno", vo.getEmpno());
		model.addAttribute("year", year);
		service.selectHoliday(model);
		return "holiday/holiday";
	}
	@PostMapping("ApplyHoliday")
	public String ApplyHoliday(
							   @RequestParam("leaveType") String leaveType,	
							   @RequestParam("leaveStartDate") String leaveStartDate,
							   @RequestParam("leaveEndDate") String leaveEndDate,
							   @RequestParam("content") String content,
							   @RequestParam("halfType") String halfType,
							   @SessionAttribute("personalInfoVO") PersonalInfoVO vo,
							   Model model) {
		if(leaveType.equals("연차")) {
			halfType = null;
		}
		
		model.addAttribute("leaveType", leaveType);
		model.addAttribute("leaveStartDate", leaveStartDate);
		model.addAttribute("leaveEndDate", leaveEndDate);
		model.addAttribute("content", content);
		model.addAttribute("userName", vo.getName());
		model.addAttribute("halfType", halfType);
		//임시empno
		model.addAttribute("empno", vo.getEmpno());
		
		try {
			service.insertHoliday(model);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "redirect:/Holiday?page=1&&year=0";
	}
	
	// 휴가 상세보기
	@ResponseBody   
	@PostMapping("/holiday/detail")
	public HolidayVO holidaydetail(@RequestBody Map<String, String> map,
			 								@SessionAttribute("personalInfoVO") PersonalInfoVO vo,
											Model model) {
		
		int id = Integer.parseInt((String)map.get("id"));
		model.addAttribute("empno", vo.getEmpno());
		model.addAttribute("id", id);
		service.getDetailHoliday(model);
		
		return service.getDetailHoliday(model);
	}
	
	
	
/*혜은---------------------------------------------------------------------*/
	
	@GetMapping("/holidayAdmin")
	public String holidayAdmin(Model model) {
		model.addAttribute("startPage","0");
		model.addAttribute("endPage","9");
		model.addAttribute("nowPage","1");
		service.selectAdminH(model);
		return "/admin/holidayAdmin";
	}
	
	// 페이지 처리
		@GetMapping("/holiday/paging/{page}")
		public String paging(@PathVariable("page") int page,Model model) {
			model.addAttribute("nowPage",page);
			model.addAttribute("startPage", 10*(page-1));
			model.addAttribute("endPage", (10*(page-1))+9);			
			service.selectAdminH(model);			
			return "/admin/holidayAdmin";
		}
		
	// 승인
		@GetMapping("holiday/Ok/{id}")
		public String holidayOk(HolidayVO vo,@PathVariable("id") int id,HttpServletRequest request) {
			int empno = Integer.parseInt(request.getParameter("empno"));
			String countDate = request.getParameter("countDate");
			vo.setApproval("승인");
			vo.setId(id);
			vo.setEmpno(empno);
			vo.setCountDate(empno);
			Eservice.updateUsedHoliday(vo);
			service.updateApproval(vo);
			return "redirect:/holidayAdmin";
		}
		
	// 반려
		@GetMapping("holiday/No/{empno}")
		public String holidayNo() {
			return "/admin/holidayAdmin";
		}
}
