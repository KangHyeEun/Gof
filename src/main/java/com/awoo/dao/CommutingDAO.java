package com.awoo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.awoo.vo.CommutingVO;

@Mapper
public interface CommutingDAO {
//	public List<CommutingVO> selectCommuting(CommutingVO vo);
	public List<CommutingVO> selectCommuting(Map<String, Object> map);
//	public List<CommutingVO> selectCommuting();
	public int insertEnter(CommutingVO vo);
	public void insertLeave(CommutingVO vo);
	public String getStartTime(CommutingVO vo);
	public String getEndTime(CommutingVO vo);
	public List<String> getDistinctYear();
	public List<String> getDistinctMonth();
	public int countOverTime(CommutingVO vo);
	public int countLate(CommutingVO vo);
}


