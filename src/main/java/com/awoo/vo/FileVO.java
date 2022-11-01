package com.awoo.vo;

import org.apache.ibatis.type.Alias;

@Alias("FileVO")
public class FileVO {
	private int id;
	private String servername;
	private String localname;
	private int bbsId;
	
	public FileVO() {
		// TODO Auto-generated constructor stub
	}

	public FileVO(String servername, String localname) {
		super();
		this.servername = servername;
		this.localname = localname;
	}

	@Override
	public String toString() {
		return "FileVO [id=" + id + ", servername=" + servername + ", localname=" + localname + ", bbsId=" + bbsId
				+ "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getServername() {
		return servername;
	}

	public void setServername(String servername) {
		this.servername = servername;
	}

	public String getLocalname() {
		return localname;
	}

	public void setLocalname(String localname) {
		this.localname = localname;
	}

	public int getBbsId() {
		return bbsId;
	}

	public void setBbsId(int bbsId) {
		this.bbsId = bbsId;
	}
	
	
	
	
}

