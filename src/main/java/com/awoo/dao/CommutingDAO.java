package com.awoo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.awoo.vo.CommutingVO;

@Mapper
public interface CommutingDAO {
	public List<CommutingVO> selectCommuting();
	public int insertEnter(CommutingVO vo);
	public void insertLeave(CommutingVO vo);
	public String getStartTime(CommutingVO vo);
	public String getEndTime(CommutingVO vo);
	public List<String> getDistinctYear();
	public List<String> getDistinctMonth();
	public int countOverTime(CommutingVO vo);
}


