package com.awoo.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.awoo.dao.BBSCommentDAO;
import com.awoo.dao.BBSDAO;
import com.awoo.vo.BBSCommentVO;
import com.awoo.vo.BBSFileVO;
import com.awoo.vo.BBSVO;
import com.awoo.vo.PageVO;
import com.google.gson.Gson;

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
	public void selectBBSList(Model model, int page, String searchType, String keyword) {
		PageVO vo = new PageVO();
		vo.setNowPage(page);
		vo.setCntPerPage(10);
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
	
	//게시글 상세 보기
	public void selectBBS(Model model, String id) {
		BBSVO vo = new BBSVO();
		vo.setId(Integer.parseInt(id));
		model.addAttribute("bbsVO", bbsDAO.selectBBS(vo));
		
		BBSFileVO fvo = new BBSFileVO();
		fvo.setBbsId(vo.getId());

		List<BBSFileVO> filelist = bbsDAO.selectBBSFile(fvo);
		model.addAttribute("filelist", filelist);
	}
	
	//추가(트랜젝션 달기)
	public void insertBBS(BBSVO vo) {
		Gson gson = new Gson();
		
		BBSFileVO[] fileArray = gson.fromJson(vo.getFilelist(), BBSFileVO[].class);
		List<BBSFileVO> fileList = Arrays.asList(fileArray);
		
		bbsDAO.insertBBS(vo);
				
		for (BBSFileVO fileVO : fileList) {
			fileVO.setBbsId(vo.getId());
			bbsDAO.insertBBSFile(fileVO);
		}
	}
	
	//삭제
	public void deleteBBS(BBSVO vo2) {
		bbsDAO.deleteBBS(vo2);
	}
	
	//수정
	public void updateBBS(BBSVO vo) {
		Gson gson = new Gson();

		BBSFileVO[] fileArray = gson.fromJson(vo.getFilelist(), BBSFileVO[].class);

		bbsDAO.updateBBS(vo);
		
		if(fileArray != null) {
			List<BBSFileVO> fileList = Arrays.asList(fileArray);
		
			for (BBSFileVO fileVO : fileList) {
				fileVO.setBbsId(vo.getId());
				bbsDAO.insertBBSFile(fileVO);
			}
		}
	}
	
	//카테고리
	public void selectCategory(Model model) {
		model.addAttribute("categories", bbsDAO.selectCategory());
	}
	//조회수
	public void updateViewCount(String id) {
		bbsDAO.updateViewCount(id);
	}
	
	//댓글 불러오기
	public List<BBSCommentVO> getCommentList(BBSCommentVO cvo) {
		return comDAO.selectCommentList(cvo);
	}
	
	//댓글 쓰기
	public int setComment(BBSCommentVO cvo) {
		return comDAO.insertComment(cvo);
	}
	
	//댓글 수정
	public void updateComment(BBSCommentVO cvo) {
		comDAO.updateComment(cvo);
	}
	
	//댓글 삭제
	public void deleteComment(BBSCommentVO cvo) {
		comDAO.deleteComment(cvo);
	}

	//파일 삭제
	public void deleteBBSFileAll(BBSFileVO fvo) {
		bbsDAO.deleteBBSFile(fvo);
	}
	//파일 삭제(트랜젝션 달기)
	public void deleteBBSFile(BBSFileVO[] fvos) {
		for (BBSFileVO fvo : fvos) {
			bbsDAO.deleteBBSFile(fvo);
		}
	}
	
	//공지사항 게시판----------------------------------------
	//게시판+페이징
	public void getBBSListNotice(Model model, int page, String searchType, String keyword) {
		PageVO vo = new PageVO();
		vo.setNowPage(page);
		vo.setCntPerPage(10);
		vo.setCntPerBlock(10);
		vo.setSearchType(searchType);
		vo.setKeyword(keyword);
		vo.setTotalRow(bbsDAO.selectBBSCountNotice(vo));
		
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
		model.addAttribute("list", bbsDAO.selectBBSListNotice(vo));
	}
	
	//카테고리
	public void getCateogryNotice(Model model) {
		model.addAttribute("categories", bbsDAO.selectCategoryNotice());
	}
	
	//게시글 상세 보기
	public void getBBSContentNotice(Model model, String id) {
		model.addAttribute("bbsVO", bbsDAO.selectBBSNotice(id));
	}
	//조회수
	public void setViewCountNotice(String id) {
		bbsDAO.updateViewCountNotice(id);
	}
	
	//게시글 보기
	public boolean setBBSNotice(BBSVO vo2) {
		return(bbsDAO.insertBBSNotice(vo2) > 0)?true:false;
	}
	
	//수정
	public boolean putBBSNotice(BBSVO vo2) {
		return(bbsDAO.updateBBSNotice(vo2) > 0)?true:false;
	}
	
	//삭제
	public boolean deleteBBSNotice(BBSVO vo2) {
		return (bbsDAO.deleteBBSNotice(vo2)>0)?true:false;
	}
	
}
