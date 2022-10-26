 package com.awoo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.HolidayVO;

@Mapper
public interface HolidayDAO {
	public List<HolidayVO> selectHoliday(HolidayVO vo);
	public void insertHoliday(HolidayVO vo);
	public List<String> distinctYear(HolidayVO vo);
	
	public HolidayVO getDetailHoliday(HolidayVO vo);
	
	/*혜은*/
	public List<HolidayVO> selectAdminH();
	public int selectCount();
	public void updateApproval(HolidayVO vo);
}
