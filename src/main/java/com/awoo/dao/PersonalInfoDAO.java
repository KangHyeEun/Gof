    package com.awoo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.InfoVO;
import com.awoo.vo.PersonalInfoVO;

@Mapper
public interface PersonalInfoDAO {
	
	public List<PersonalInfoVO> selectPersonal();

	public List<PersonalInfoVO> selectAllInfo();
	
	public int countInfo();
	
	public void insertDataP(PersonalInfoVO vo);
	
	public void updateP(PersonalInfoVO vo);
	
	public List<InfoVO> selectInfo(InfoVO vo);

	public List<InfoVO> selectDetail(Map<String,String> map);
}
