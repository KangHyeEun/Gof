package com.awoo.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.awoo.dao.CalendarDAO;
import com.awoo.vo.CalendarVO;

@Service
public class CalendarService {
	private CalendarDAO dao;
	
	public CalendarService(CalendarDAO dao) {
		super();
		this.dao = dao;
	}
	
//	일정을 DB에서 조회
	public void selectDataMethod(Model model) {
		List<CalendarVO> selectList = dao.selectSchedule();
		dateSetMethod(selectList);
		
		model.addAttribute("list", selectList);
	}
	
//	비동기로 일자별 일정 출력하기 위한 데이터 추출
	public List<CalendarVO> restDataMethod(Map<String, String> map) {
		String mapStartYear = map.get("calEnd").split("-")[0];
		String mapStartMonth = map.get("calEnd").split("-")[1];
		String mapStartDay = map.get("calEnd").split("-")[2];
		int tempDay = Integer.parseInt(mapStartDay) + 1;
		int tempYear = Integer.parseInt(mapStartYear);
		
		if (mapStartMonth.equals("12") && tempDay == 32) {
			System.out.println("실행확인");
			tempYear++;
			mapStartMonth = "1";
			tempDay = 1;
		}
		
		String strTemp = "";
		strTemp += tempYear;
		strTemp += "-" + mapStartMonth;
		strTemp += "-" + tempDay;
		
		map.put("calEnd", strTemp);
		
		List<CalendarVO> list = dao.selectRestData(map);
		dateSetMethod(list);

		return list;
	}
//	일정 수정
	public void updateDateMethod(CalendarVO vo, int id, String range) {
//		제목
		if(vo.getCalTitle() == null || vo.getCalTitle() == "") vo.setCalTitle("제목 없음");
//		종일여부
		if(vo.getCalAllday() == null || vo.getCalAllday() == "") vo.setCalAllday("0");
//		비공개
		if(vo.getCalShow() == null || vo.getCalShow() == "") vo.setCalShow("0");
		else vo.setCalShow("1");
//		공지
		if(vo.getCalNotice() == null || vo.getCalNotice() == "") vo.setCalNotice("0");
		else vo.setCalNotice("1");
		
		vo.setCalId(id);
//		일정이 하루에서 범위로 바뀌거나 범위가 바뀌는 경우에는 모두 삭제 후 다시 저장하는 방식
		deleteDataMethod(vo);
//		삭제 후 재삽입
		insertDataMethod(vo);
		
//		dao.updateSchedule(vo);
	}
//	일정 삭제
	public void deleteDataMethod(CalendarVO vo) {
		int selectRange = dao.selectRange(vo.getCalId());
		
//		selectRange == 0 인 경우는 일정이 범위가 아닐때, selectRange == 1 인 경우는 일정이 범위일때 시작일인 경우
		if (selectRange == 0 || selectRange == 1) {
			dao.deleteSchedule(vo.getCalId());
		}
//		일정이 범위일때 시작일이 아닌 나머지 일자일때
		else {
			dao.deleteSchedule(selectRange);
		}
	}
	

//	일정 생성
	public void insertDataMethod(CalendarVO vo) {
//		제목
		if(vo.getCalTitle() == null || vo.getCalTitle() == "") vo.setCalTitle("제목 없음");
//		종일여부
		if(vo.getCalAllday() == null || vo.getCalAllday() == "") vo.setCalAllday("0");
//		비공개
		if(vo.getCalShow() == null || vo.getCalShow() == "") vo.setCalShow("0");
		else vo.setCalShow("1");
//		공지
		if(vo.getCalNotice() == null || vo.getCalNotice() == "") vo.setCalNotice("0");
		else vo.setCalNotice("1");
		
		String calStart = vo.getCalStart().split("T")[0];
		String calEnd = vo.getCalEnd().split("T")[0];
		
		int calStartYear = Integer.parseInt(calStart.split("-")[0]);
		int calStartMonth = Integer.parseInt(calStart.split("-")[1]);
		int calStartDay = Integer.parseInt(calStart.split("-")[2]);
		
		int calEndYear = Integer.parseInt(calEnd.split("-")[0]);
		int calEndMonth = Integer.parseInt(calEnd.split("-")[1]);
		int calEndDay = Integer.parseInt(calEnd.split("-")[2]);
		
		String calStartTime = vo.getCalStart().split("T")[1];
		String calEndTime = vo.getCalEnd().split("T")[1];
		
		
//		날짜범위여부 : 시작일과 종료일이 같으면 0, 아니면 1
		if ((calStartYear == calEndYear) && (calStartMonth == calEndMonth) && (calStartDay == calEndDay)) {
			vo.setCalRange(0);
		}
		else {
			vo.setCalRange(1);
		}
//		일정이 하루이든 범위이든 시작일 기준으로 하나 등록
		dao.insertSchedule(vo);
		
//		일정이 범위일때 시작일 기준으로 넣었던 일정의 id 값을 나머지 일정에는 cal_range 값으로 등륵한다.
		int cal_range = vo.getCalId();
		
//		위에서 날짜범위 확인후 1을 받았을 경우, 일시가 범위일때
		if (vo.getCalRange() == 1) {
//			일정이 범위일때 시작일을 제외한 나머지 일정을 넣기위한 함수
			insertRangeDateMethod(vo, calStartYear, calStartMonth, calStartDay, calStartTime,
								cal_range, calEndYear, calEndMonth, calEndDay, calEndTime);
		}
	}
	
	
	
	
	public void insertRangeDateMethod(CalendarVO vo, int calStartYear, int calStartMonth, int calStartDay, String calStartTime,
									int cal_range, int calEndYear, int calEndMonth, int calEndDay, String calEndTime) {
		
		
		SimpleDateFormat dateFormat;
		Calendar cal = Calendar.getInstance();
		
		String startTime = "";
		String endTime = "";
		
		dateFormat = new SimpleDateFormat("yyyy-MM-dd"); //년월일 표시
		
		cal.set( calEndYear, (calEndMonth-1), calEndDay ); //종료 날짜 셋팅
		String endDate = dateFormat.format(cal.getTime());
		
		cal.set ( calStartYear, (calStartMonth-1), calStartDay ); //시작 날짜 셋팅
		String startDate = dateFormat.format(cal.getTime());
		
		int i = 0;
		
		while(!startDate.equals(endDate)){ //다르다면 실행, 동일 하다면 빠져나감
			System.out.println("===================================");
			if(i==0) { //최초 실행 출력
				System.out.println(dateFormat.format(cal.getTime()));
			}
			
//			cal.add(Calendar.MONTH, 1); //1달 더해줌
			cal.add(Calendar.DATE, 1); //1일 더해줌
			startDate = dateFormat.format(cal.getTime()); //비교를 위한 값 셋팅
			
			startTime = "" + startDate + " " + calStartTime;
			endTime = "" + startDate + " " + calEndTime;
			
//			시작일을 제외한 나머지의 일정들은 시작일과 종료일을 똑같이 설정한다.
			vo.setCalStart(startTime);
			vo.setCalEnd(endTime);
//			시작일의 id값
			vo.setCalRange(cal_range);
			
			dao.insertSchedule(vo);
			i++;
		}
	}
	
	
//	일정 계산 메서드(DB에서 꺼낸값에서 월과 일자에서 0을 제외시킴, class 이름에는 0이 없음)
	public void dateSetMethod(List<CalendarVO> innerList) {
		String calStart;
		String calEnd;
		
		String calStartDate;
		String calStartTime;
		String calEndDate;
		String calEndTime;
		
		String calStartYear;
		String calStartMonth;
		String calStartDay;

		String calEndYear;
		String calEndMonth;
		String calEndDay;

		for (int i = 0; i < innerList.size(); i++) {
			calStart = innerList.get(i).getCalStart();
			calEnd = innerList.get(i).getCalEnd();
			
			calStartDate = calStart.split(" ")[0];
			calStartTime = calStart.split(" ")[1];
			calEndDate = calEnd.split(" ")[0];
			calEndTime = calEnd.split(" ")[1];
			
			calStartYear = calStartDate.split("-")[0];
			calStartMonth = calStartDate.split("-")[1];
			calStartDay = calStartDate.split("-")[2];

			calEndYear = calEndDate.split("-")[0];
			calEndMonth = calEndDate.split("-")[1];
			calEndDay = calEndDate.split("-")[2];
			
			if (Integer.parseInt(calStartMonth) < 10) calStartMonth = calStartMonth.split("0")[1];
			if (Integer.parseInt(calStartDay) < 10) calStartDay = calStartDay.split("0")[1];
			if (Integer.parseInt(calEndMonth) < 10) calEndMonth = calEndMonth.split("0")[1];
			if (Integer.parseInt(calEndDay) < 10) calEndDay = calEndDay.split("0")[1];
			
			calStartDate = calStartYear + "-" + calStartMonth + "-" + calStartDay;
			calEndDate = calEndYear + "-" + calEndMonth + "-" + calEndDay;
			
			calStart = "" + calStartDate + " " + calStartTime;
			calEnd = "" + calEndDate + " " +  calEndTime;
			
			innerList.get(i).setCalStart(calStart);
			innerList.get(i).setCalEnd(calEnd);
		}
	}
	
	
}























///////////////////////////////////////////////////////////////////

//Date date = new Date();
//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//
//Calendar cal = Calendar.getInstance();
//cal.setTime(date);
//
////# 오늘 날짜
//Date today = dateFormat.parse(dateFormat.format(cal.getTime()));
////# DB에서 가져온 마지막 로그인 일자
//Date  lastLoginDay = dateFormat.parse((String)maㅋp.get("loginDt));"
////	↳이 부분은 각자 다 다르겠죠!
//cal.setTime(loginDay);
//
////# 마지막 로그인 일자로부터 11개월 후
//cal.add(Calendar.MONTH, 11);
////   ↳ 11개월 전 : cal.add(Calendar.MONTH, -11);
//Date mailSendDay = cal.getTime();
//
////# 마지막 로그인 일자로부터 1년 후 
////# 위 순서대로 코딩을 했다면 cal.setTime을 loginDay로 다시 해줘야한다
//cal.setTime(loginDay);
//cal.add(Calendar.YEAR, 1);
//Date deleteDay = cal.getTime();

///////////////////////////////////////////////////////////////////


////시작 , 끝 날짜 임의 세팅
//
//String s1="20080110";
//String s2="20080211";
//
//DateFormat df = new SimpleDateFormat("yyyyMMdd");
//
////Date타입으로 변경
//
//Date d1 = df.parse( s1 );
//Date d2 = df.parse( s2 );
//
//Calendar c1 = Calendar.getInstance();
//Calendar c2 = Calendar.getInstance();
//
////Calendar 타입으로 변경 add()메소드로 1일씩 추가해 주기위해 변경
//c1.setTime( d1 );
//c2.setTime( d2 );
//
////시작날짜와 끝 날짜를 비교해, 시작날짜가 작거나 같은 경우 출력
//
//while( c1.compareTo( c2 ) !=1 ){
//    //출력
//    System.out.printf("%tF\n",c1.getTime());
//
//    //시작날짜 + 1 일
//    c1.add(Calendar.DATE, 1);
//}


//	/////////////////////////////////////////////////////////////////
	