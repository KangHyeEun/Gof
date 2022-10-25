package com.awoo.vo;

import org.apache.ibatis.type.Alias;

@Alias("MessageVO")
public class MessageVO {
	private int id;
	private String mowner;
	private String mtitle;
	private String mcontent;
	private String createDate;
	private String mreciever;
	
	
	public MessageVO() {
		// TODO Auto-generated constructor stub
	}


	public MessageVO(int id, String mowner, String mtitle, String mcontent, String createDate, String mreciever) {
		super();
		this.id = id;
		this.mowner = mowner;
		this.mtitle = mtitle;
		this.mcontent = mcontent;
		this.createDate = createDate;
		this.mreciever = mreciever;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getMowner() {
		return mowner;
	}


	public void setMowner(String mowner) {
		this.mowner = mowner;
	}


	public String getMtitle() {
		return mtitle;
	}


	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}


	public String getMcontent() {
		return mcontent;
	}


	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}


	public String getCreateDate() {
		return createDate;
	}


	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}


	public String getMreciever() {
		return mreciever;
	}


	public void setMreciever(String mreciever) {
		this.mreciever = mreciever;
	}


	@Override
	public String toString() {
		return "MessageVO [id=" + id + ", mowner=" + mowner + ", mtitle=" + mtitle + ", mcontent=" + mcontent
				+ ", createDate=" + createDate + ", mreciever=" + mreciever + "]";
	}
	
	
	
	
 
	
	
	
	
}
