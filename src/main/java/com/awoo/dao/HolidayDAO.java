 package com.awoo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.HolidayVO;

@Mapper
public interface HolidayDAO {
	public List<HolidayVO> selectHoliday(HolidayVO vo);
	public void insertHoliday(HolidayVO vo);
	public List<String> distinctYear(HolidayVO vo);
	
	/*혜은*/
	public List<HolidayVO> selectAdminH();
	public List<HolidayVO> selectH(Map<String, String> map);
	public int selectCount();
	public void updateApproval(HolidayVO vo);
}
