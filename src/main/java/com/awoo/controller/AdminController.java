package com.awoo.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.channels.Channels;
import java.nio.channels.FileChannel;
import java.nio.channels.WritableByteChannel;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.awoo.service.EmployeeInfoService;
import com.awoo.service.PersonalInfoService;
import com.awoo.service.UploadfilesService;
import com.awoo.vo.EmployeeInfoVO;
import com.awoo.vo.InfoVO;
import com.awoo.vo.PersonalInfoVO;
import com.awoo.vo.PositionDepartmentVO;
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
	
	// 전체 리스트 + 상세검색 (+페이징)
	@GetMapping("/admin")
	public String admin(Model model,@RequestParam("page") String page,@RequestParam Map<String,String> map) {
		model.addAttribute("page", page);
		Pservice.selectDetail(model,map);
		Eservice.department(model);
		Eservice.position(model);
		
		return "/admin/admin1";
	}
	
	
	// 상세보기
	@GetMapping("/admin/detail/{id}")
	public String detail(@PathVariable("id") int id,Model model,InfoVO vo,
			@RequestParam("empno") int empno, HttpServletResponse response) throws IOException {
		vo.setId(id);
		vo.setEmpno(empno);
		Pservice.selectInfo(vo, model);
		Eservice.department(model);
		Eservice.position(model);
		return "/admin/detail";
	}
	
	// 수정하기
		@GetMapping("/admin/updateData")
		public String updateDetail(
				PersonalInfoVO pvo,EmployeeInfoVO evo,@RequestParam("page") String page,
				HttpServletRequest request,Model model) {
//				@RequestParam("proimg") MultipartFile[] files,
//				UploadfilesVO vo)throws IllegalStateException, IOException {
			model.addAttribute("page", page);
			Eservice.updateE(pvo,evo,request);
			
//			for (MultipartFile file : files) {
//				 if(!file.getOriginalFilename().isEmpty()) {
//						vo.setFileName(file.getOriginalFilename());
//						vo.setOwnerId(empno);
//						Uservice.uplaodFile(vo);
//					} else {
//						System.out.println("에러가 발생했습니다.");
//					}
//			 }	
			
			return "redirect:/admin";
		}
		
	
	// 새로운 직원 추가 페이지 이동
	@GetMapping("/admin/newE")
	public String newE(Model model,HttpServletRequest request) {
		Eservice.selectEmpno(model, request);
		Eservice.department(model);
		Eservice.position(model);
		return "/admin/admin2";
	}
	
	// 새로운 직원 추가
	@GetMapping("/admin/insertData")
	public String insertData(
			PersonalInfoVO pvo,EmployeeInfoVO evo,@RequestParam("page") String page,
			HttpServletRequest request,Model model) {
//			,@RequestParam("proimg") MultipartFile[] files,
//			UploadfilesVO vo)throws IllegalStateException, IOException{
		model.addAttribute("page", page);
		Eservice.insertDataE(pvo,evo,request);

		/*
		 * for (MultipartFile file : files) { if(!file.getOriginalFilename().isEmpty())
		 * { vo.setFileName(file.getOriginalFilename()); vo.setOwnerId(evo.getEmpno());
		 * Uservice.uplaodFile(vo); } else { System.out.println("에러가 발생했습니다."); } }
		 */
		return "redirect:/admin";
	}
	
	
	// 선택 직원 정보 수정
		@GetMapping("/admin/updateD")
		public String updateD(@RequestParam("empno") int[] empno,PersonalInfoVO pvo,EmployeeInfoVO evo, 
				HttpServletRequest request,@RequestParam("page") String page,Model model) {
			model.addAttribute("page", page);
			
			for (int i : empno) {
				pvo.setEmpno(i);
				evo.setEmpno(i);
				Eservice.updateE(pvo,evo,request);
			}
			
			return "redirect:/admin";
		}
	
	// 파일 처리
	@PostMapping("/admin/file")
	@ResponseBody
	public void multiFileUploadWithAjax(MultipartFile[] uploadFile,UploadfilesVO vo) 
			throws IllegalStateException, IOException {
		for(MultipartFile file : uploadFile) {
			if(!file.getOriginalFilename().isEmpty()) {
				file.transferTo(Paths.get("C:/sample/"+file.getOriginalFilename()));
			}else {
				System.out.println("에러가 발생했습니다.");
			}
		}
	}
	
	// 이름 검색(선택 직원 정보 수정)
	@ResponseBody   
	@PostMapping("/AssociatedSearch")
	public List<InfoVO> AssociatedSearch(@RequestBody Map<String, String> map,Model model,InfoVO vo) {

		String name = (String)map.get("name");

		model.addAttribute("name", name);

		return Eservice.AssociatedSearch(vo,model);
	}
	
	/*부서관리 ----------------------------------------------------------------------------------------------*/
	
	// 부서 관리 페이지 접근
	@GetMapping("/admin/department")
	public String department(Model model) {
		Eservice.department(model);
		return "/admin/department";
	}
	
	// 부서 등록
	@GetMapping("/admin/insertDepartment")
	public String insertDepartment(PositionDepartmentVO vo) {
		Eservice.insertDepartment(vo);
		return "redirect:/admin/department";
	}
	
	// 부서 업데이트
	@GetMapping("/admin/updateDepartment/{id}")
	public String updateDepartment(PositionDepartmentVO vo,@PathVariable("id") int id) {
		vo.setId(id);
		Eservice.updateDepartment(vo);
		return "redirect:/admin/department";
	}
	
	// 부서 삭제
	@GetMapping("/admin/deleteDepartment")
	public String deleteDepartment(PositionDepartmentVO vo) {
		Eservice.deleteDepartment(vo);
		return "redirect:/admin/department";
	}
	
	/*직책관리 ----------------------------------------------------------------------------------------------*/
	
	// 직책 관리 페이지 접근
	@GetMapping("/admin/position")
	public String position(Model model) {
		Eservice.position(model);
		return "/admin/position";
	}

	// 직책 등록
	@GetMapping("/admin/insertPosition")
	public String insertPosition(PositionDepartmentVO vo) {
		Eservice.insertPosition(vo);
		return "redirect:/admin/position";
	}

	// 직책 업데이트
	@GetMapping("/admin/updatePosition/{id}")
	public String updatePosition(PositionDepartmentVO vo,@PathVariable("id") int id) {
		vo.setId(id);
		Eservice.updatePosition(vo);
		return "redirect:/admin/position";
	}

	// 직책 삭제
	@GetMapping("/admin/deletePosition")
	public String deletePosition(PositionDepartmentVO vo) {
		Eservice.deletePosition(vo);
		return "redirect:/admin/position";
	}
}
