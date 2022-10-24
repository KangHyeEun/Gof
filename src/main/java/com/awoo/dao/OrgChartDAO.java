package com.awoo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.InfoVO;

@Mapper
public interface OrgChartDAO {
	
	public List<InfoVO> selectOrg();

	public List<InfoVO> selectOrgDetail(InfoVO vo);
}
