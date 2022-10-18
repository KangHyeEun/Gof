package com.awoo.vo;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.apache.ibatis.type.Alias;

@Alias("CommutingVO")
public class CommutingVO {
	
	private int id;
	private String workday;
	private String startTime;
	private String endTime;
	private String workTime;
	private String overTime;
	private int empno;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWorkday() {
		return workday;
	}
	public void setWorkday(String workday) {
		this.workday = workday;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getWorkTime() {
		return workTime;
	}
	public void setWorkTime(String startTime, String endTime) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		System.out.println(format.format(new java.util.Date()));
		String date = format.format(startTime);
		System.out.println(date +"나와라아아아");
		System.out.println(startTime);
		System.out.println(endTime);
		Date sd = null;
		Date ed = null;
		try {
			sd = (Date) format.parse(startTime);
		    ed = (Date)format.parse(endTime);
		    System.out.println("여기까지는 오니? 좋아");
		} catch (ParseException e) {
			System.out.println("여기까지는 오니?");
		    e.printStackTrace();
		}   
		long diff = sd.getTime() - ed.getTime();
		long diffSeconds = diff / 1000;         
		long diffMinutes = diff / (60 * 1000);         
		long diffHours = diff / (60 * 60 * 1000);                      
		System.out.println("Time in seconds: " + diffSeconds + " seconds.");         
		System.out.println("Time in minutes: " + diffMinutes + " minutes.");         
		System.out.println("Time in hours: " + diffHours + " hours.");
		
		this.workTime = diffHours+":"+diffMinutes+":"+diffSeconds;
	}
	public String getOverTime() {
		return overTime;
	}
	public void setOverTime() {
		if(this.workTime != null) {
			
		}
		this.overTime = "test";
		
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	
	
}
