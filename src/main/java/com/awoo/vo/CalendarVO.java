package com.awoo.vo;

import org.apache.ibatis.type.Alias;

@Alias("calendarVO")
public class CalendarVO {
	private int calId;			// 일정 id 값
	private String calTitle;	// 일정 제목
	private String calPlace;	// 장소
	private String calStart;	// 시작일
	private String calEnd;		// 종료일
	private String calAllday;	// 종일여부
	private String calShow;		// 공개,비공개
	private String calNotice;	// 개인,공지
	private String calContent;	// 내용
	private int empno;			// 사원번호
	private int checkAdmin;		// 관리자여부
	private int approval;		// 승인신청여부
	
	public int getCalId() {
		return calId;
	}
	public void setCalId(int calId) {
		this.calId = calId;
	}
	public String getCalTitle() {
		return calTitle;
	}
	public void setCalTitle(String calTitle) {
		this.calTitle = calTitle;
	}
	public String getCalPlace() {
		return calPlace;
	}
	public void setCalPlace(String calPlace) {
		this.calPlace = calPlace;
	}
	public String getCalStart() {
		return calStart;
	}
	public void setCalStart(String calStart) {
		this.calStart = calStart;
	}
	public String getCalEnd() {
		return calEnd;
	}
	public void setCalEnd(String calEnd) {
		this.calEnd = calEnd;
	}
	public String getCalAllday() {
		return calAllday;
	}
	public void setCalAllday(String calAllday) {
		this.calAllday = calAllday;
	}
	public String getCalShow() {
		return calShow;
	}
	public void setCalShow(String calShow) {
		this.calShow = calShow;
	}
	public String getCalNotice() {
		return calNotice;
	}
	public void setCalNotice(String calNotice) {
		this.calNotice = calNotice;
	}
	public String getCalContent() {
		return calContent;
	}
	public void setCalContent(String calContent) {
		this.calContent = calContent;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getCheckAdmin() {
		return checkAdmin;
	}
	public void setCheckAdmin(int checkAdmin) {
		this.checkAdmin = checkAdmin;
	}
	public int getApproval() {
		return approval;
	}
	public void setApproval(int approval) {
		this.approval = approval;
	}
}
