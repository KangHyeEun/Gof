package com.awoo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.CalendarVO;

@Mapper
public interface CalendarDAO {
	public List<CalendarVO> selectSchedule();
	public int insertSchedule(CalendarVO vo);
}
