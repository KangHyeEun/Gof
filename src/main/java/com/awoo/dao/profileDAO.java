package com.awoo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.awoo.vo.profileVO;

@Mapper
public interface profileDAO {
	
	// 조회
	public List<profileVO> selectInfoJY(profileVO vo);
}
	
	// 수정
//	public void updateProfile(profileVO vo);
	

