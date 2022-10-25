package com.awoo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.PersonalInfoVO;

@Mapper
public interface LoginDAO {
	public PersonalInfoVO selectUser(PersonalInfoVO vo);
}
