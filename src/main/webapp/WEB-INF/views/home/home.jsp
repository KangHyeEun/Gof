<%@page import="java.util.List"%>
<%@page import="com.awoo.vo.CommutingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/home/style.css">
<title>Insert title here</title>
  <style>
  /*자바스크립트로 width를 보내기 때문에 얘는 style.css로 옮길 수 없음*/
 	.donut::before {
	    content: attr(data-percent)'%';
	}
  </style>
</head>	
<body>
	<div class="container-wrap">
		<div class="header">
			<img src="${pageContext.request.contextPath}/imges/logo.PNG"/>
            <div class="header-logout">	<a href="${pageContext.request.contextPath}/logout">로그아웃</a> </div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner-bbs">
			<div class="greating"><h2>${ename}님, 안녕하세요! 오늘도 행복한 하루 보내세요</h2></div> 
				<div class="inner-div-bbs">
					<!-- 각자 필요한 부분 넣기 -->
					
					<section class="left-section">
			            <div class="div2">
			                <div class="div2-1">    
			                    <div class="div2-1-3">
			                        <p>오늘 나의 출퇴근</p>
			                    </div>
			                    <div class="div2-1-1">
			                        <div class="div2-1-1-1">
			                            <img src="${pageContext.request.contextPath}/imges/contact.png" alt="">
			                        </div>
			                        <div class="div2-1-1-2">
			                        	<p class="infoEcheckAdmin">
			                        	<img src="${pageContext.request.contextPath}/imges/badge_staff.png"/>
			                        	${employeeInfo.checkAdmin == 1? "관리자" : "일반 직원"}</p>
			                        	<p class="infoEname">${ename} <span>${employeeInfo.eposition}</span>님</p>
			                            <p class="infoEmpno">사원번호 : <span>${employeeInfo.empno}</span></p>
<!-- 			                            <p class="infoEposition"></p> -->
			                            <div class="buttons">
				                            <div id="enter"><p>출근</p></div>
				                    		<div id="leave"><p>퇴근</p></div>
				                    	</div>
			                        </div>
			                    </div>
			                </div>
			                <div class="div2-2">
			                     <div class="showenter">출근 : ${startTime == null? "&nbsp;-&nbsp;" : startTime}</div>
			                    <div class="showleave">퇴근 : ${endTime == null? "&nbsp;-&nbsp;" : endTime}</div>
			                </div>
			            </div>
			            <div class="div3">
<!-- 			                <p class="div3-title">근무 / 휴가 현황</p> -->
<!-- 			                <div class="day-rates"> -->
			                		<div class="donuts">
					                 	<div class="donuts-subtitle">근무현황</div>
						                 <div class="donut-container commuting">
									        <div class="donut"> </div>
									    </div>
								        <div class="donut-info">
								        		<p>월급날까지 <span id="payday"></span>일 남았습니다</p>
												<p>총 ${getWeekDays}일 중 ${countThisMonth}일 째</p>
									        <p>초과 근무 : <span class="work-rates">${overTime}</span></p>
							                <p>지각 : <span class="work-rates">${countLate}</span></p>
							                <p>정상 근무 횟수 : <span class="work-rates">${countNormalCommuting}</span></p>
							            </div>
							         </div>
							         <div class="donuts">   
							     		<div class="donuts-subtitle">휴가현황</div>
								     	<div class="donut-container holiday">
								        	<div class="donut"> </div>
								     	</div>   
							        	<div class="donut-info">
							                <p>총 휴갸 개수: <span class="work-rates">${totalUsedHoliday.totalHoliday}</span></p>
							                <p>남은 휴가 <span class="work-rates">${totalUsedHoliday.totalHoliday-totalUsedHoliday.usedHoliday}</span>개</p>
							                <p>휴가 요청 <span class="work-rates">${countApproval}</span>개</p>
						                </div>
						             </div>   
<!-- 						    	</div> -->
						    	
			                </div>
			            
			        </section>
			
				
				        <section class="right-section">
				        	<div class="div4">
					           	<p class="cal-subtitle">일정 확인</p>
					           	<!-- 캘린더 -->
					           	<div class="cal-container">
					           	 <div class="sec_cal" id="sec_cal">
							        <div class="cal_nav">
							          <a href="javascript:;" class="nav-btn go-prev" id="go-prev">prev</a>
							          <div class="year-month"></div>
							          <a href="javascript:;" class="nav-btn go-next" id="go-next">next</a>
							        </div>
							        <div class="cal_wrap">
							          <div class="days">
							            <div class="day">MON</div>
							            <div class="day">TUE</div>
							            <div class="day">WED</div>
							            <div class="day">THU</div>
							            <div class="day">FRI</div>
							            <div class="day">SAT</div>
							            <div class="day">SUN</div>
							          </div>
							          <div class="dates"></div>
							        </div>
							      </div>
							    
							     <div class="cal-container-right">
							     <c:if test="${todayCalendar.size() > 0}">
							     	<table>
							     		<thead>
							     			<tr>
							     				<th>순서</th>
							     				<th>종료일</th>
							     				<th>종료시간</th>
							     				<th>내용</th>
							     				<th>작성자</th>
							     			</tr>
							     		</thead>
								     	<c:forEach items="${todayCalendar}" var="cal">
								     		<tr>
								     			<td>${cal.calId}</td>
								     			<td>${cal.calEnd.split(" ")[0]}</td>
								     			<td>${cal.calEnd.split(" ")[1]}</td>
								     			<td>${cal.calTitle }</td>
								     			<td>${cal.ename}</td>
								     		</tr>
								     	</c:forEach>
							     	</table>
							     </c:if>
							     <c:if test="${todayCalendar.size() <= 0}">
							     	<div>
							     	하이하이하이하이 일정이 없어요 하하하하
							     	</div>
							     </c:if>
							     </div>
						      </div>
					           	<!-- 캘린더 -->
					           	
							</div>
					        <div class="div1">
				                <p class="bbs-subtitle">사내 공지사항</p>
				                <div class="bbs-container">
									<table class="bbs-table">
										<thead>
											<tr>
												<th>번호</th>
												<th>분류</th>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일</th>
												<th>조회수</th>
												<th>첨부 파일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="vo" items="${noticeListForHome}" varStatus="status">
												<tr>
													<td>${status.index+1}</td>
													<td>${vo.category}</td>
													<td><a href="${pageContext.request.contextPath}/bbsNotice/bbs/${vo.id}">${vo.title}</a></td>
													<td>인사담당자</td>
													<td>${vo.createDate}</td>
													<td>${vo.viewCounts}</td>
													<td>첨부 파일</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="hidden-link-to-bbs">
										<a href="${pageContext.request.contextPath}/bbsPage/bbs">사내 공지사항으로 이동</a>
									</div>
				                </div>
				            </div>
				        </section>
					</div>
				</div>
			<div id="enterpop" style="display:none">
	            <div class="pop-container" >
	                <div class="pop1"><a href="" >✖️</a></div>
	                
	                <div class="pop2"><img src="https://i.pinimg.com/736x/c6/75/37/c67537a607e37016cd65de01fb4bf437.jpg" alt=""></div>
	                <div class="pop3">
	                    <p class="pop-ename"><span>${ename}</span>님</p>
	                    <p class="pop-edepart"><span>${employeeInfo.edepartment}<c:if test="${employeeInfo.edepartment != null}"> / </c:if></span><span>${employeeInfo.eposition}</span></p>
	                    <p class="pop-edepart">사원번호 - <span>${employeeInfo.empno}</span></p>
	                    <p class="pop-date-container">
	                    	<img src="${pageContext.request.contextPath}/imges/cal-icon.png" class="cal-icon"/> 
	                    	<span id="todayEnterDate"></span>
	                    	<img src="${pageContext.request.contextPath}/imges/time-icon.png" class="cal-icon"/>
	                    	<span id="todayEnterTime"></span>
	                    </p>
	                </div>
	                <div class="pop4">
	                    <form action="${pageContext.request.contextPath}/CommutingEnter">
	                        <button>출근하겠습니다</button>
	                    </form>
	                </div>    
	            </div>
	        </div>
	        <div id="leavepop" style="display:none">
	            <div class="pop-container" >
	            <div class="pop1"><a href="" >✖️</a></div>
	                <div class="pop2"><img src="https://i.pinimg.com/736x/c6/75/37/c67537a607e37016cd65de01fb4bf437.jpg" alt=""></div>
	                <div class="pop3">
	                    <p class="pop-ename"><span>${ename}</span>님</p>
	                    <p class="pop-edepart"><span>${employeeInfo.edepartment}<c:if test="${employeeInfo.edepartment != null}"> / </c:if></span><span>${employeeInfo.eposition}</span></p>
	                    <p class="pop-date-container">
	                    	<img src="${pageContext.request.contextPath}/imges/cal-icon.png" class="cal-icon"/>
	                    	<span id="todayLeaveDate"></span>
	                    	<img src="${pageContext.request.contextPath}/imges/time-icon.png" class="cal-icon"/>
	                    	<span id="todayLeaveTime"></span>
	                   </p>
	                </div>
	                <div class="pop4">
	                    <form action="${pageContext.request.contextPath}/CommutingLeave">
	                        <button class="leavebutton">퇴근하겠습니다</button>
	                    </form>
	                </div>    
	            </div>
	        </div>
		</div>
	</div>
    <script type="text/javascript">
	    document.addEventListener("DOMContentLoaded", function(){
		    	 // 근무현황 월급날 (매월1일) 까지 남을 날짜 구하기
		        let now = new Date();
		    	let firstDate, lastDate;
		    	
		    	firstDate = new Date(now.getYear(), now.getMonth(), 1);
		    	lastDate = new Date(now.getYear(), now.getMonth()+1, 0);
		    	
		    	let todayDate = now.getDate();
		    	let endDate = lastDate.getDate();
		    	
		    	let payday = endDate-todayDate+1;
		    	
		    	document.getElementById("payday").innerHTML = payday;
		        
		        
		    	// 퍼센트 구하기
		        const donut = document.getElementsByClassName("donut")[0]
		    	const donut2 = document.getElementsByClassName("donut")[1]
		        
		        const weekDays = ${getWeekDays};
		    	const countWorkDay = ${countThisMonth};
		    	
		    	const usedHoliday = ${totalUsedHoliday.usedHoliday};
		    	const totalHoliday = ${totalUsedHoliday.totalHoliday};
		    	
		    	
		    	// let worked = countWorkDay / weekDays * 100; //원래는 근무한 날짜로 평일에서 뺐는데 수정 
		    	// 지금날짜 / 이번 달 일수 *100 
		        let worked = todayDate / endDate * 100;
		        // 사용한 휴가일 / 총 휴가일 * 100
		        let holidayper = usedHoliday / totalHoliday * 100;
		       
		       
		    	
		    	let totalMinwon = worked, resolveMinwon = 12
		    	let t = 0
		    	
		    	let t4 = 0
		    	const donutAnimation = setInterval(() => {
		    	  donut.dataset.percent = t4
		    	  let graph1 = "conic-gradient(#4F98FF 0 "+t4+"%, #DEDEDE "+t4+"% 100% )";
		    	  donut.style.background = graph1
		    	  t4++ >= totalMinwon && clearInterval(donutAnimation)
		    	}, 10)
		    	
		    	
		    	let totalMinwon2 = holidayper, resolveMinwon2 = 12
		    	let t5 = 0
		    	const donutAnimation2 = setInterval(() => {	
		    	  donut2.dataset.percent = t5
		    	  let graph2 = "conic-gradient(#4F98FF 0 "+t5+"%, #DEDEDE "+t5+"% 100% )";
		    	  donut2.style.background = graph2
		//     	  donut.style.background = "conic-gradient(#4F98FF 0" +t4+"%, #DEDEDE "+t4+" 100% )";
		    	  t5++ >= totalMinwon2 && clearInterval(donutAnimation2)
		    	}, 10)
	    	
	    	
    	
    	
    	
    		// 달력 불러오기
	    	calendarInit();
	    });
	    
    	
    
   
    
	
	
		
    
    	// 출근 ----------------------------------------------------------------------
	    document.getElementById("enter").addEventListener("click",function(){
	    	if(${startTime == null}){
	    		let today = new Date();
	    		let date = today.toLocaleDateString();
	    		
	    		let hours = today.getHours(); // 시
	    		let minutes = today.getMinutes();
	    		let time = hours+"시"+minutes+"분";
	    		
	       		document.getElementById("enterpop").style.display = "flex";
	       		document.getElementById("todayEnterDate").innerHTML = date;
	       		document.getElementById("todayEnterTime").innerHTML = time;
	       		
	    	}else {
	    		alert("이미 출근하셨습니다.");	    		
	    	}
	    });
	 	// 퇴근 ----------------------------------------------------------------------
	    document.getElementById("leave").addEventListener("click",function(){
	    	
	    	if(${endTime == null}){
	    		if(${startTime == null}){
		        	alert("출근 기록이 없습니다.")
		    	}else{
		    		let today = new Date();
		    		let date = today.toLocaleDateString();
// 		    		let time = today.toLocaleTimeString();
		    		let hours = today.getHours(); // 시
		    		let minutes = today.getMinutes();
		    		let time = hours+"시"+minutes+"분";
		    		
	    			document.getElementById("leavepop").style.display = "flex";
	    			document.getElementById("todayLeaveDate").innerHTML = date;
		       		document.getElementById("todayLeaveTime").innerHTML = time;		
		    	}
	    	}else {
	    		alert("이미 퇴근하셨습니다.");	    		
	    	}
	    	
	    });
	    
	   
	    // 달력 호출 함수------------------------------------------------------------------------
	    function calendarInit() {

	        // 날짜 정보 가져오기
	        var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
	        var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
	        var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
	        var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
	      
	        var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
	        // 달력에서 표기하는 날짜 객체
	      
	        
	        var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
	        var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
	        var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

	        // kst 기준 현재시간
	        

	        // 캘린더 렌더링
	        renderCalender(thisMonth);

	        function renderCalender(thisMonth) {

	            // 렌더링을 위한 데이터 정리
	            currentYear = thisMonth.getFullYear();
	            currentMonth = thisMonth.getMonth();
	            currentDate = thisMonth.getDate();

	            // 이전 달의 마지막 날 날짜와 요일 구하기
	            var startDay = new Date(currentYear, currentMonth, 0);
	            var prevDate = startDay.getDate();
	            var prevDay = startDay.getDay();

	            // 이번 달의 마지막날 날짜와 요일 구하기
	            var endDay = new Date(currentYear, currentMonth + 1, 0);
	            var nextDate = endDay.getDate();
	            var nextDay = endDay.getDay();


	            // 현재 월 표기
	            document.getElementsByClassName("year-month")[0].innerText = currentYear + '.' + (currentMonth + 1);

	            // 렌더링 html 요소 생성
	            calendar = document.querySelector('.dates')
	            calendar.innerHTML = '';
	            
	            // 지난달
	            for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
	                calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
	            }
	            // 이번달
	            for (var i = 1; i <= nextDate; i++) {
	                calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>'
	            }
	            // 다음달
	            for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
	                calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
	            }

	            // 오늘 날짜 표기
	            if (today.getMonth() == currentMonth) {
	                todayDate = today.getDate();
	                var currentMonthDate = document.querySelectorAll('.dates .current');
	                currentMonthDate[todayDate -1].classList.add('today');
	            }
	        }

	        // 이전달로 이동
	        document.getElementById("go-prev").addEventListener("click",function(){
	            thisMonth = new Date(currentYear, currentMonth - 1, 1);
	            renderCalender(thisMonth);    
	        })
	        document.getElementById("go-next").addEventListener("click",function(){
	            thisMonth = new Date(currentYear, currentMonth + 1, 1);
	            renderCalender(thisMonth);     
	        })
	    }
	    
	     
	    
    </script>


    
</body>
</html>


