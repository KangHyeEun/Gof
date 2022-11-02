package com.awoo.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.awoo.dao.UploadfilesDAO;
import com.awoo.vo.UploadfilesVO;

@Service
public class UploadfilesService {
	
	private UploadfilesDAO dao;

	public UploadfilesService(UploadfilesDAO dao) {
		super();
		this.dao = dao;
	}

	public void selectFile(UploadfilesVO vo,Model model) {
		 model.addAttribute("fileList",dao.selectFile(vo));
	}
	
	public void uplaodFile(UploadfilesVO vo) {
		dao.uplaodFile(vo);
	}

	public void updateFile(UploadfilesVO vo) {
		dao.updateFile(vo);
	}
	
}
