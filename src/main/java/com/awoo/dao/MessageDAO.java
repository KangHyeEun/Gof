package com.awoo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.awoo.vo.MessageVO;

@Mapper
public interface MessageDAO {
	
	public List<MessageVO> selectList();
	
	public MessageVO selectBBS(String id);
	
	public void insertData(MessageVO vo);
	
	//체크박스삭제 - 받은 메세지함
	public int deleteData1(@Param("ids") int[] ids);
	
	//체크박스삭제 - 보낸 메세지함
	public int deleteData2(@Param("idss") int[] idss);
	
	//쪽지 보내기 추가
	public int insertmessage(MessageVO vo);

	
}
