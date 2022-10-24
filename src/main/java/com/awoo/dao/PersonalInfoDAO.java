    package com.awoo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.PersonalInfoVO;

@Mapper
public interface PersonalInfoDAO {
	
	public List<PersonalInfoVO> selectPersonal();

	public List<PersonalInfoVO> selectAllInfo();
}
