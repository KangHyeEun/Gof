package com.awoo.vo;

public class HolidayVO {
	private int id;
	private String huserName;
	private String hwriteDate;
	private String htype;
	private String hstartDate;
	private String hendDate;
	private String hcontent;
	private String halfDay;
	private String approval;
	private String approvalDate;
	private int empno;
	private int totalHoliday;
	private int checkAdmin;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHuserName() {
		return huserName;
	}
	public void setHuserName(String huserName) {
		this.huserName = huserName;
	}
	public String getHwriteDate() {
		return hwriteDate;
	}
	public void setHwriteDate(String hwriteDate) {
		this.hwriteDate = hwriteDate;
	}
	public String getHtype() {
		return htype;
	}
	public void setHtype(String htype) {
		this.htype = htype;
	}
	public String getHstartDate() {
		return hstartDate;
	}
	public void setHstartDate(String hstartDate) {
		this.hstartDate = hstartDate;
	}
	public String getHendDate() {
		return hendDate;
	}
	public void setHendDate(String hendDate) {
		this.hendDate = hendDate;
	}
	public String getHcontent() {
		return hcontent;
	}
	public void setHcontent(String hcontent) {
		this.hcontent = hcontent;
	}
	public String getHalfDay() {
		return halfDay;
	}
	public void setHalfDay(String halfDay) {
		this.halfDay = halfDay;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	public String getApprovalDate() {
		return approvalDate;
	}
	public void setApprovalDate(String approvalDate) {
		this.approvalDate = approvalDate;
	}
	public int getCheckAdmin() {
		return checkAdmin;
	}
	public void setCheckAdmin(int checkAdmin) {
		this.checkAdmin = checkAdmin;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public int getTotalHoliday() {
		return totalHoliday;
	}
	public void setTotalHoliday(int totalHoliday) {
		this.totalHoliday = totalHoliday;
	}
	public int getCheck_admin() {
		return checkAdmin;
	}
	public void setCheck_admin(int check_admin) {
		this.checkAdmin = check_admin;
	}
	@Override
	public String toString() {
		return "HolidayVO [id=" + id + ", huserName=" + huserName + ", hwriteDate=" + hwriteDate + ", htype=" + htype
				+ ", hstartDate=" + hstartDate + ", hendDate=" + hendDate + ", hcontent=" + hcontent + ", halfDay="
				+ halfDay + ", approval=" + approval + ", empno=" + empno + ", totalHoliday=" + totalHoliday
				+ ", check_admin=" + checkAdmin + "]";
	}
	
	
}
