package com.awoo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.EmployeeInfoVO;

@Mapper
public interface EmployeeInfoDAO {
	public List<EmployeeInfoVO> selectEmployee();
}
