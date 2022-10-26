package com.awoo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.MessageVO;

@Mapper
public interface MessageDAO {
	
	public List<MessageVO> selectList();
	
	public MessageVO selectBBS(String id);
	
	public int insertData(MessageVO vo);

	public void deleteData1(MessageVO vo);
	
	public void deleteData2(MessageVO vo);
	


	
}
