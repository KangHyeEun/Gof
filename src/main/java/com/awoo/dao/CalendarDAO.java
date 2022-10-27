package com.awoo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.CalendarVO;
//test Commit//test Commit
@Mapper
public interface CalendarDAO {
	public List<CalendarVO> selectSchedule();
	
	public int insertSchedule(CalendarVO vo);
	
	public List<CalendarVO> selectRestData(Map<String, String> map);
}
