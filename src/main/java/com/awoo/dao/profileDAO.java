package com.awoo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.awoo.vo.profileVO;

@Mapper
public interface profileDAO {
	
	public profileVO select(int emp);
	// 조회
	
	public void updateE(profileVO vo);
}


