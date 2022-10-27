package com.awoo.controller;

import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.awoo.service.EmployeeInfoService;
import com.awoo.service.PersonalInfoService;
import com.awoo.service.UploadfilesService;
import com.awoo.vo.EmployeeInfoVO;
import com.awoo.vo.InfoVO;
import com.awoo.vo.PersonalInfoVO;
import com.awoo.vo.UploadfilesVO;

@Controller
public class AdminController {
	
	private PersonalInfoService Pservice;
	private EmployeeInfoService Eservice;
	private UploadfilesService Uservice;

	public AdminController(PersonalInfoService pservice, EmployeeInfoService eservice, UploadfilesService uservice) {
		super();
		Pservice = pservice;
		Eservice = eservice;
		Uservice = uservice;
	}
	
	// admin List
	@GetMapping("/admin")
	public String admin(Model model) {
		model.addAttribute("startPage","0");
		model.addAttribute("endPage","9");
		model.addAttribute("nowPage","1");
		Pservice.AllList(model);	
		return "/admin/admin1";
	}
	@GetMapping("/ex")
	public String ex(Model model) {
		Pservice.AllList(model);
		return "/admin/ex";
	}
	
	// 상세보기
	@GetMapping("/admin/detail/{id}")
	public String detail(@PathVariable("id") int id,Model model,InfoVO vo) {
		vo.setId(id);
		Pservice.selectInfo(vo, model);
		return "/admin/detail";
	}
	
	// 수정하기
		@PostMapping("/admin/updateData/{empno}")
		public String updateDetail(
				@PathVariable("empno") int empno,
				PersonalInfoVO pvo,EmployeeInfoVO evo, 
				HttpServletRequest request,
				@RequestParam("proimg") MultipartFile[] files,
				UploadfilesVO vo)throws IllegalStateException, IOException {
			pvo.setEmpno(empno);
			evo.setEmpno(empno);
			Eservice.updateE(pvo,evo,request);
			
			for (MultipartFile file : files) {
				 if(!file.getOriginalFilename().isEmpty()) {
						vo.setFileName(file.getOriginalFilename());
						vo.setOwnerId(empno);
						Uservice.uplaodFile(vo);
					} else {
						System.out.println("에러가 발생했습니다.");
					}
			 }	
			
			return "redirect:/admin";
		}
		
	
	// 새로운 직원 추가 페이지 이동
	@GetMapping("/admin/newE")
	public String newE(Model model,HttpServletRequest request) {
		Eservice.selectEmpno(model, request);
		return "/admin/admin2";
	}
	
	// 새로운 직원 추가
	@PostMapping("/admin/insertData/{empno}")
	public String insertData(
			@PathVariable("empno") int empno,
			PersonalInfoVO pvo,EmployeeInfoVO evo, 
			HttpServletRequest request,
			@RequestParam("proimg") MultipartFile[] files,
			UploadfilesVO vo)throws IllegalStateException, IOException{
		
		Eservice.insertDataE(pvo,evo,request);

		for (MultipartFile file : files) {
			 if(!file.getOriginalFilename().isEmpty()) {
					vo.setFileName(file.getOriginalFilename());
					vo.setOwnerId(empno);
					Uservice.uplaodFile(vo);
				} else {
					System.out.println("에러가 발생했습니다.");
				}
		 }	
		return "redirect:/admin";
	}
	
	//상세 검색
	@PostMapping("/admin/details")
	public String selectDetail(Model model,InfoVO vo) {
		model.addAttribute("startPage","0");
		model.addAttribute("endPage","9");
		model.addAttribute("nowPage","1");
//		model.addAttribute("count",);
		Pservice.selectDetail(vo, model);
		return "/admin/admin1";
	}
	
	// 페이지 처리
	@GetMapping("/admin/paging/{page}")
	public String paging(@PathVariable("page") int page,Model model) {
		model.addAttribute("nowPage",page);
		model.addAttribute("startPage", 10*(page-1));
		model.addAttribute("endPage", (10*(page-1))+9);			
		Pservice.AllList(model);			
		return "/admin/admin1";
	}
	
	// 파일 처리
	@PostMapping("/admin/file")
	@ResponseBody
	public void multiFileUploadWithAjax(MultipartFile[] uploadFile,UploadfilesVO vo) 
			throws IllegalStateException, IOException {
		for(MultipartFile file : uploadFile) {
			if(!file.getOriginalFilename().isEmpty()) {
				file.transferTo(Paths.get("E:/sample/"+file.getOriginalFilename()));
			}else {
				System.out.println("에러가 발생했습니다.");
			}
		}
	}
}
