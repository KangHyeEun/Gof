package com.awoo.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

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
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
		Date sd = null;
		Date ed = null;
		try {
			sd = dateFormat.parse(startTime);
		    ed = dateFormat.parse(endTime);
		} catch (ParseException e) {
		    e.printStackTrace();
		}   
		// 계산해서 음수를 양수로 변환 *-1
		long diff = sd.getTime() - ed.getTime();
		long diffMinutes = (diff / (60 * 1000)*-1)%60;         
		long diffHours = (diff / (60 * 60 * 1000)*-1);
		this.workTime = diffHours+"시간 "+diffMinutes+"분";
	}
	public String getOverTime() {
		return overTime;
	}
	public void setOverTime() {
		if(this.workTime != null) {
			SimpleDateFormat dateHM = new SimpleDateFormat("HH시간 mm분");
			SimpleDateFormat dateH = new SimpleDateFormat("HH");
			SimpleDateFormat dateM = new SimpleDateFormat("mm");
			Date dHM = null;
			String dH = null;
			String dM = null;
			try {
				dHM = dateHM.parse(this.workTime);
				dH = dateH.format(dHM);
				dM = dateM.format(dHM);
			} catch (ParseException e) {
			    e.printStackTrace();
			}
			int hours = Integer.parseInt(dH);
			int minutes = Integer.parseInt(dM);
			if(hours >= 9) {
				hours = hours-9;
				this.overTime = hours+"시간 "+minutes+"분";
			}
		}else {
			this.overTime = null;	
		}
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	
	
}
