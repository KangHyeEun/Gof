package com.awoo.vo;

import org.apache.ibatis.type.Alias;

@Alias("calendarVO")
public class CalendarVO {
	private int calId;
	private String calTitle;
	private String calSelector;
	private String calCategory;
	private String calContent;
	private String calStart;
	private String calEnd;
	private int calAllday;
	private int empno;
	private int checkAdmin;
	private int approval;
	
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
	public String getCalSelector() {
		return calSelector;
	}
	public void setCalSelector(String calSelector) {
		this.calSelector = calSelector;
	}
	public String getCalCategory() {
		return calCategory;
	}
	public void setCalCategory(String calCategory) {
		this.calCategory = calCategory;
	}
	public String getCalContent() {
		return calContent;
	}
	public void setCalContent(String calContent) {
		this.calContent = calContent;
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
	public int getCalAllday() {
		return calAllday;
	}
	public void setCalAllday(int calAllday) {
		this.calAllday = calAllday;
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
