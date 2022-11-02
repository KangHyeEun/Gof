package com.awoo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.UploadfilesVO;

@Mapper
public interface UploadfilesDAO {
	
	public List<UploadfilesVO> selectFile(UploadfilesVO vo);

	public void uplaodFile(UploadfilesVO vo);

	public void updateFile(UploadfilesVO vo);
	
}
