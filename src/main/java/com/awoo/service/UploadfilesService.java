package com.awoo.service;

import org.springframework.stereotype.Service;

import com.awoo.dao.UploadfilesDAO;
import com.awoo.vo.UploadfilesVO;

@Service
public class UploadfilesService {
	
	private UploadfilesDAO dao;

	public UploadfilesService(UploadfilesDAO dao) {
		super();
		this.dao = dao;
	}
	
	public void uplaodFile(UploadfilesVO vo) {
		dao.uplaodFile(vo);
	}
}
