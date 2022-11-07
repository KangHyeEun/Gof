package com.awoo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.PersonalInfoVO;

@Mapper
public interface IdVerificationDAO {

	/*가빈 로그인 검사*/
	public List<PersonalInfoVO> getVerification();
}
