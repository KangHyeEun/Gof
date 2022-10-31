package com.awoo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.CalendarVO;

@Mapper
public interface CalendarDAO {
	public List<CalendarVO> selectSchedule();
	
	public List<CalendarVO> selectRestData(Map<String, String> map);
	
	public int insertSchedule(CalendarVO vo);
	
	public void deleteSchedule(int id);
}
