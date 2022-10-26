package com.awoo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.awoo.dao.BBSCommentDAO;
import com.awoo.dao.BBSDAO;
import com.awoo.vo.BBSCommentVO;
import com.awoo.vo.BBSVO;
import com.awoo.vo.PageVO;

@Service
public class BBSService {
	
	private BBSDAO bbsDAO;
	private BBSCommentDAO comDAO;
	
	public BBSService(BBSDAO bbsDAO, BBSCommentDAO comDAO) {
		super();
		this.bbsDAO = bbsDAO;
		this.comDAO = comDAO;
	}

	//게시판+페이징
	public void getBBSList(Model model, int page, String searchType, String keyword) {
		PageVO vo = new PageVO();
		vo.setNowPage(page);
		vo.setCntPerPage(8);
		vo.setCntPerBlock(10);
		vo.setSearchType(searchType);
		vo.setKeyword(keyword);
		vo.setTotalRow(bbsDAO.selectBBSCount(vo));
		
		if(!searchType.equals("")) {
			model.addAttribute("searchType", searchType);
			vo.setSearchType(searchType);
		}
		if(!keyword.equals("")) {
			model.addAttribute("keyword", keyword);
			vo.setKeyword(keyword);
		}
		
		vo.process();
		
//		System.out.println(vo);
		
		model.addAttribute("page", vo);
		model.addAttribute("list", bbsDAO.selectBBSList(vo));
	}
	
	//카테고리
	public void getCateogry(Model model) {
		model.addAttribute("categories", bbsDAO.selectCategory());
	}
	
	//게시글 상세 보기
	public void getBBSContent(Model model, String id) {
		model.addAttribute("bbsVO", bbsDAO.selectBBS(id));
	}
	//조회수
	public void setViewCount(String id) {
		bbsDAO.updateViewCount(id);
	}
	
	//게시글 보기
	public boolean setBBS(BBSVO vo2) {
		return(bbsDAO.insertBBS(vo2) > 0)?true:false;
	}
	
	//수정
	public boolean putBBS(BBSVO vo2) {
		return(bbsDAO.updateBBS(vo2) > 0)?true:false;
	}
	
	//삭제
	public boolean deleteBBS(BBSVO vo2) {
		return (bbsDAO.deleteBBS(vo2)>0)?true:false;
	}
	
	//댓글----------------------------------------------
	//댓글 불러오기
	public List<BBSCommentVO> getCommentList(String bbsId) {
		return comDAO.selecCommentAll(bbsId);
	}
	
	//댓글 쓰기
	public int setComment(BBSCommentVO vo) {
		return comDAO.insertComment(vo);
	}
	
}
