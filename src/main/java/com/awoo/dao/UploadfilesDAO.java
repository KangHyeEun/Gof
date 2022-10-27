package com.awoo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.UploadfilesVO;

@Mapper
public interface UploadfilesDAO {
	
	public void uplaodFile(UploadfilesVO vo);
	
	public String selectFile(int empno);
}
