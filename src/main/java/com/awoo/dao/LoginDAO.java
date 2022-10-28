package com.awoo.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.PersonalInfoVO;

@Mapper
public interface LoginDAO {
	public PersonalInfoVO selectUser(PersonalInfoVO vo);
	
	public int updatePassword(Map<String, String> map);

}
