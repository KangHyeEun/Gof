package com.awoo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.awoo.vo.BBSFileVO;
import com.awoo.vo.BBSVO;
import com.awoo.vo.PageVO;

@Mapper
public interface BBSDAO {
	
	public int selectBBSCount(PageVO vo);
	
	public List<BBSVO> selectBBSList(PageVO vo);
	
	public BBSVO selectBBS(BBSVO vo);
	
	public int insertBBS(BBSVO vo);
	
	public int updateBBS(BBSVO vo);
	
	public int deleteBBS(BBSVO vo);

	public List<BBSVO> selectCategory();
	
	public int updateViewCount(String id);
	
	//파일
	public int insertBBSFile(BBSFileVO vo);
	
	public List<BBSFileVO> selectBBSFile(BBSFileVO vo);
	
	public int deleteBBSFile(BBSFileVO vo);
	
	

	//공지사항 게시판-------------------------
	public int selectBBSCountNotice(PageVO vo);
	
	public List<BBSVO> selectBBSListNotice(PageVO vo);
	
	public List<BBSVO> selectCategoryNotice();
	
	public BBSVO selectBBSNotice(String id);
	
	public int insertBBSNotice(BBSVO vo);
	
	public int updateBBSNotice(BBSVO vo);
	
	public int deleteBBSNotice(BBSVO vo);
	
	public int updateViewCountNotice(String id);
	
}
