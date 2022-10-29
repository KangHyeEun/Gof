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
	.container {
	height: auto;
	}
	.container-inner-bbs {
	height: auto;
	}

	.inner-div-bbs {
/* 	    height: auto; */
	}
	.outer-div-bbs{
	width: 90%;
    height: 420px;
    display: flex;
    justify-content:space-between;
    align-items: center;
	}
	.outersection{
/* 	width: 48%; */
    height: 90%;
    background-color: white;
	}
	.left-outersection{
	width: 41%;
    padding: 2%;
    background-color: white;
    border-radius: 7px;
    box-sizing: border-box;
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: 1px 1px 8px #c1c1c1;
    
	}
	.right-outersection{
	width: 57%;
	padding: 2%;
    background-color: white;
    border-radius: 7px;
    box-sizing: border-box;
	box-shadow: 1px 1px 8px #c1c1c1;
	
	}
	
	/*날씨*/
.wrapper{
  width: 400px;
  background: #fff;
  border-radius: 7px;
  overflow: hidden;
  height: 230px;
}
.wrapper header{
  display: flex;
  font-size: 21px;
  font-weight: 500;
  color: #43AFFC;
  padding: 16px 15px;
  align-items: center;
  border-bottom: 1px solid #ccc;
}
header i{
  font-size: 0em;
  cursor: pointer;
  margin-right: 8px;
}
.wrapper.active header i{
  margin-left: 5px;
  font-size: 30px;
}
.wrapper .input-part{
  margin: 20px 25px 30px;
}
.wrapper.active .input-part{
  display: none;
}
.input-part .info-txt{
  display: none;
  font-size: 17px;
  text-align: center;
  padding: 12px 10px;
  border-radius: 7px;
  margin-bottom: 15px;
}
.input-part .info-txt.error{
  color: #721c24;
  display: block;
  background: #f8d7da;
  border: 1px solid #f5c6cb;
}
.input-part .info-txt.pending{
  color: #0c5460;
  display: block;
  background: #d1ecf1;
  border: 1px solid #bee5eb;
}
.input-part :where(input, button){
  width: 100%;
  height: 55px;
  border: none;
  outline: none;
  font-size: 18px;
  border-radius: 7px;
}
.input-part input{
  text-align: center;
  padding: 0 15px;
  border: 1px solid #ccc;
}
.input-part input:is(:focus, :valid){
  border: 2px solid #43AFFC;
}
.input-part input::placeholder{
  color: #bfbfbf;
}
.input-part .separator{
  height: 1px;
  width: 100%;
  margin: 25px 0;
  background: #ccc;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
}
.separator::before{
  content: "or";
  color: #b3b3b3;
  font-size: 19px;
  padding: 0 15px;
  background: #fff;
}
.input-part button{
  color: #fff;
  cursor: pointer;
  background: #43AFFC;
  transition: 0.3s ease;
}
.input-part button:hover{
  background: #1d9ffc;
}

.wrapper .weather-part{
  display: flex; 
  visibility : hidden; 
/*   margin: 30px 0 0; */
  align-items: center;
  justify-content: center;
  flex-direction: column;
  height:100%;
}
.wrapper.active .weather-part{
  display: flex;
}
.weather-part img{
  width:50px;
}
.weather-part .temp{
  display: flex;
  font-weight: 500;
  font-size: 50px;
  justify-content:center;
}
.weather-part .temp .numb{
  font-weight: 600;
}
.weather-part .temp .deg{
  font-size: 40px;
  display: block;
  margin: 10px 5px 0 0;
}
.weather-part .weather{
  font-size: 17px;
  text-align: center;
}
.weather-part .location{
  display: flex;
  font-size: 19px;
  padding: 0 20px;
  text-align: center;
  margin-bottom: 30px;
  align-items: flex-start;
}
.location i{
  font-size: 22px;
  margin: 4px 5px 0 0;
}
.weather-part .bottom-details{
  display: flex;
  width: 100%;
  justify-content: space-between;
  border-top: 1px solid #ccc;
}
.bottom-details .column{
  display: flex;
  width: 100%;
  padding: 15px 0;
  align-items: center;
  justify-content: center;
}
.column i{
  color: #5DBBFF;
  font-size: 40px;
}
.column.humidity{
  border-left: 1px solid #ccc;
}
.column .details{
  margin-left: 3px;
}
.details .temp, .humidity span{
  font-size: 18px;
  font-weight: 500;
  margin-top: -3px;
}
.details .temp .deg{
  margin: 0;
  font-size: 17px;
  padding: 0 2px 0 1px;
}
.column .details p{
  font-size: 14px;
  margin-top: -6px;
}
.humidity i{
  font-size: 37px;
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
							            </div>
							         </div>
							         <div class="donuts">   
							     		<div class="donuts-subtitle">휴가현황</div>
								     	<div class="donut-container holiday">
								        	<div class="donut"> </div>
								     	</div>   
							        	<div class="donut-info">
							                <p>남은 휴가 <span class="work-rates">${totalUsedHoliday.totalHoliday-totalUsedHoliday.usedHoliday}</span>개</p>
							                <p>휴가 요청 <span class="work-rates">${countApproval}</span>개</p>
						                </div>
						             </div>
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
				                
				            </div>
				        </section>
					</div>
					<div class="outer-div-bbs">
						<div class="outersection left-outersection">
							 <div class="wrapper">
						      <!-- <header><i class='bx bx-left-arrow-alt'></i>Weather App</header>
						      <section class="input-part">
						        <p class="info-txt"></p>
						        <div class="content">
						          <input type="text" spellcheck="false" placeholder="Enter city name" required>
						          <div class="separator"></div>
						          <button>Get Device Location</button>
						        </div>
						      </section> -->
						      <section class="weather-part">
						        <div class="temp">
						        <img src="" alt="Weather Icon">
						          <span class="numb">_</span>
						          <span class="deg">°</span>C
						        </div>
						        <div class="weather">_ _</div>
						        <div class="location">
						          <i class='bx bx-map'></i>
						          <span>_, _</span>
						        </div>
						        <div class="bottom-details">
						          <div class="column feels">
						            <i class='bx bxs-thermometer'></i>
						            <div class="details">
						              <div class="temp">
						                <span class="numb-2">_</span>
						                <span class="deg">°</span>C
						              </div>
						              <p>체감온도</p>
						            </div>
						          </div>
						          <div class="column humidity">
						            <i class='bx bxs-droplet-half'></i>
						            <div class="details">
						              <span>_</span>
						              <p>습도</p>
						            </div>
						          </div>
						        </div>
						      </section>
						    </div>
							
						</div>
						
						<div class="div1 outersection right-outersection" >
							
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
	    
	     
	    //-------------------------날씨 api----------------------
	     

		
const wrapper = document.querySelector(".wrapper"),
inputPart = document.querySelector(".input-part"),
// infoTxt = inputPart.querySelector(".info-txt"),
// inputField = inputPart.querySelector("input"),
// locationBtn = inputPart.querySelector("button"),
weatherPart = wrapper.querySelector(".weather-part"),
wIcon = weatherPart.querySelector("img"),
arrowBack = wrapper.querySelector("header i");

let api;
// const apiKey = "9eb8e475f8d3ed2e2c8f27492634087e";

// window.addEventListener("load", e =>{
//     if(e.key == "Enter" && inputField.value != ""){
//         console.log("여기로 넘어가는데..")
//         requestApi('korea');
//     }
// });




window.addEventListener("load", () =>{
    if(navigator.geolocation){
        navigator.geolocation.getCurrentPosition(onSuccess, onError);
    }else{
        alert("Your browser not support geolocation api");
    }
});

function requestApi(city){
    console.log("여긴는 요청")
	console.log(city);
    api = "https://api.openweathermap.org/data/2.5/weather?q="+city+"&units=metric&appid=9eb8e475f8d3ed2e2c8f27492634087e";
    fetchData();
}

function onSuccess({coords}){
	
	document.getElementById("")
    console.log("여긴는 성공")
    
    const latitude = coords.latitude;
    const longitude = coords.longitude;
    api = "https://api.openweathermap.org/data/2.5/weather?lat="+latitude+"&lon="+longitude+"&units=metric&appid=9eb8e475f8d3ed2e2c8f27492634087e";
    fetchData();
}

// function onSuccess(position){
//     console.log("여긴는 성공")
//     console.log(position);
//     const {latitude, longitude} = position.coords;
//     api = "https://api.openweathermap.org/data/2.5/weather?lat="+latitude+"&lon="+longitude+"&units=metric&appid=9eb8e475f8d3ed2e2c8f27492634087e";
//     fetchData();
// }

function onError(error){
//     infoTxt.innerText = error.message;
//     infoTxt.classList.add("error");
	console.log("onerror 에러");
}

function fetchData(){
    // infoTxt.innerText = "Getting weather details...";
    // infoTxt.classList.add("pending");
    // console.log(api);
    fetch(api).then(res => res.json()).then(result => weatherDetails(result)).catch(() =>{
    	console.log("패치 오류")
//         infoTxt.innerText = "Something went wrong";
//         infoTxt.classList.replace("pending", "error");
    });
}

function weatherDetails(info){
    console.log(info);
    if(info.cod == "404"){
//         infoTxt.classList.replace("pending", "error");
//         infoTxt.innerText = `${inputField.value} isn't a valid city name`;
    }else{
        const city = info.name;
        const country = info.sys.country;
        const {description, id} = info.weather[0];
        const {temp, feels_like, humidity} = info.main;

        if(id == 800){
            wIcon.src = "${pageContext.request.contextPath}/imges/weather-icons/clear.svg";
        }else if(id >= 200 && id <= 232){
            wIcon.src = "${pageContext.request.contextPath}/imges/weather-icons/storm.svg";  
        }else if(id >= 600 && id <= 622){
            wIcon.src = "${pageContext.request.contextPath}/imges/weather-icons/snow.svg";
        }else if(id >= 701 && id <= 781){
            wIcon.src = "${pageContext.request.contextPath}/imges/weather-icons/haze.svg";
        }else if(id >= 801 && id <= 804){
            wIcon.src = "${pageContext.request.contextPath}/imges/weather-icons/cloud.svg";
        }else if((id >= 500 && id <= 531) || (id >= 300 && id <= 321)){
            wIcon.src = "${pageContext.request.contextPath}/imges/weather-icons/rain.svg";
        }
        
        weatherPart.style.visibility = "visible";
        weatherPart.querySelector(".temp .numb").innerText = Math.floor(temp);
        weatherPart.querySelector(".weather").innerText = description;
        weatherPart.querySelector(".location span").innerText = city+" , "+country;
        weatherPart.querySelector(".temp .numb-2").innerText = Math.floor(feels_like);
        weatherPart.querySelector(".humidity span").innerText = humidity+"%";
        infoTxt.classList.remove("pending", "error");
        infoTxt.innerText = "";
        inputField.value = "";
        wrapper.classList.add("active");
    }
}


    
    </script>


    
</body>
</html>


