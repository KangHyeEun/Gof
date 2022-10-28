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
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String admin(Model model,@RequestParam("page") String page) {
		model.addAttribute("page", page);
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
	public String detail(@PathVariable("id") int id,Model model,InfoVO vo,
			@RequestParam("empno") int empno, HttpServletResponse response) throws IOException {
		vo.setId(id);
		Pservice.selectInfo(vo, model);
		String path = "C:/sample/"+Uservice.selectFile(empno);
//		
//		// 다운로드 받고자 하는 파일에 대한 Path 지정
		Path file = Paths.get(path);
//
//		// 파일이름 utf-8로 인코딩 : 파일 이름이 깨지지 않도록 설정하기 위함 
		String filename = URLEncoder.encode(file.getFileName().toString(),"UTF-8");
//
//		// response 객체의 해더 새팅
		response.setHeader("Content-Disposition", "attachment;filename="+filename);
//
//		// 파일 channel 설정
		FileChannel fc = FileChannel.open(file, StandardOpenOption.READ);
		System.out.println(fc);
//		// response에서 output스트림 추출 
//		OutputStream out = response.getOutputStream();  // getOutputStream는 파일IO에서 가져온 단방향 스트림임.
//		// response에서는 channel형태로 가져올 수 없고 getOutputStream의 형태로 가져올 수 밖에 없다. => 따라서 두번을 나눠서 가져와야 함.
//
//		// outputStream에서 Channel추출
//		WritableByteChannel outputChannel = Channels.newChannel(out);  // 뽑아온 OutputStream을 넣어서 채널을 추출함.
//		
//		System.out.println(outputChannel);
		
		// response 객체로 파일 전송
//		fc.transferTo(0, fc.size(), outputChannel);
//		
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
	public String selectDetail(Model model,InfoVO vo,@RequestParam("page") String page) {
		model.addAttribute("page", page);
		Pservice.selectDetail(vo, model);
		return "/admin/admin1";
	}
	
	// 선택 직원 정보 수정
		@PostMapping("/admin/updateD")
		public String updateD(@RequestParam("empno") int[] empno,PersonalInfoVO pvo,EmployeeInfoVO evo, HttpServletRequest request) {
			
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
	

}
