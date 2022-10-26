<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
// 	String formatDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
// 	String formatTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm"));
	
// 	formatDate += "T" + formatTime;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/calendar/cal-style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
</head>
<body>
	<div class="container-wrap">
		<div class="header">
			<div class="navbar__toogleBtn" id="mobile-btn">☰</div>
			<img src="${pageContext.request.contextPath}/imges/logo.PNG"/>
            <div class="header-logout">로그아웃 버튼</div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner">
			    <!-- right-content -->
                <div class="calendar">
                    <div class="month">
	                    <div class="btnMove">
	                    	<i class="fas fa-angles-left prevs btnColor"></i>
	                        <i class="fas fa-angle-left prev btnColor"></i>
	                        <i class="fas fa-angle-right next btnColor"></i>
	                        <i class="fas fa-angles-right nexts btnColor"></i>
                        </div>
                        <div class="date">
                            <!-- month 객체로 월 동적 생성되는 부분 -->
                            <h1></h1>
                            <!-- 현재 시간을 기준으로 날짜가 동적 생성되는 부분 -->
                            <p class="todayMove"></p>
                        </div>
		               	<div class="btnDiv">
		               		<p id="btnMonth" class="btnClick">월</p>
		               		<p id="btnWeek" class="btnColor">주</p>
		               		<p id="btnDay" class="btnColor">일</p>
		               	</div>
                    </div>
                    <div class="weekdays">
                        <div><span>일</span></div>
                        <div><span>월</span></div>
                        <div><span>화</span></div>
                        <div><span>수</span></div>
                        <div><span>목</span></div>
                        <div><span>금</span></div>
                        <div><span>토</span></div>
                    </div>
                    <div class="days">

                    </div>
                </div>
			</div>
			<div class="schedule-wrap">
				<div class="schedule slideTop">
					<div>
						<p>일정 등록</p>
						<a href="">
							<img src="${pageContext.request.contextPath}/imges/close.png" alt="" />
						</a>
					</div>
					<div>
						<form action="${pageContext.request.contextPath}/calendar/insertData" method="post">
							<div>
							    <label for="calTitle">제목</label><br>
							    <input type="text" name="calTitle" id="calTitle">
						    </div>
						    <div>
							    <label for="calPlace">장소</label><br>
							    <input type="text" name="calPlace" id="calPlace">
						    </div>
						    <div>
							    <label for="calStart">일시</label><br>
							    <input type="datetime-local" name="calStart" id="calStart">
							    <label for="calEnd"> ~ </label>
							    <input type="datetime-local" name="calEnd" id="calEnd">
						    </div>
						    <div>
							    <label for="calAllday">종일</label>
							    <input type="checkbox" name="calAllday" id="calAllday" value="1">
							    <label for="calShow">비공개</label>
							    <input type="checkbox" name="calShow" id="calShow" value="1">
							    <label for="calNotice">공지</label>
							    <input type="checkbox" name="calNotice" id="calNotice" value="1">
						    </div>
						    <div>
							    <label for="calContent">설명</label><br>
							    <textarea name="calContent" id="calContent" cols="70" rows="5" placeholder="일정에 필요한 설명을 남기세요."></textarea>
						    </div>
						    <div class="btn">
						    	<button id="btn">전송</button>
						    </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
// 		.js 파일에서 contextPath 사용을 위해 session에 저장
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
	</script>
	

    <script src="${pageContext.request.contextPath}/calendar/cal-script.js"></script>
<!--     위의 .js 에서 EL태그 사용이 불가해서 대신 사용 -->
<%--     <jsp:include page="../include/menu.jsp"></jsp:include> --%>
    
    <script type="text/javascript">

// 	const daysEle = document.querySelectorAll(".days > div");
// 		document.addEventListener("DOMContentLoaded", function(e){
// 			console.log("-----------------");
// 			console.log(daysEle.length);
			
// 			console.log(daysEle.item(0).classList[0]);
// 			console.log(daysEle.item(daysEle.length-1).classList[0]);
			
// 			let dateRange = {calStart:daysEle.item(0).classList[0],
// 							calEnd:daysEle.item(daysEle.length-1).classList[0]};
// 			console.log(dateRange);
			
// 			console.log("-----------------");
// 			fetch("${pageContext.request.contextPath}/calendar/restData",{
// 				method : "POST",
// 				headers : { "Content-type" : "application/json"},
// 				body : JSON.stringify(dateRange)
// 			}).then(response => response.json(), e => console.log("error!!!"))
// 			.then(data => {
// 				console.log("성공");
// 			});
// 		});
    </script>
    
    
    <script type="text/javascript">
//     	날짜로 클래스이름 지정했는데 이런 형식이 querySelector에서는 .붙여서 제대로 작동을 안함
//     	document.querySelector(".2022-10-5").addEventListener("click", function(){
// 		그래서 상위 태그에서 child로 이용함 / 첫 번째에 있는 날짜형식의 className 추출
// 		const days = document.querySelector(".days").children.item(26).classList.item(0);
// 		console.log("1");
// 		console.log(days);
// 		const dates = new Date();
// 		console.log("2");
// 		console.log(dates);
// 		console.log(dates.toLocaleDateString());
// 		console.log(dates.toLocaleString());
// 		console.log(dates.toLocaleTimeString());
// 		console.log(dates.getFullYear());
// 		console.log(dates.getMonth());
// 		console.log(dates.getDate());
// 		console.log("3");
// 		console.log(dates.getFullYear()+"-"+(dates.getMonth()+1)+"-"+dates.getDate());
// 		const test = dates.getFullYear()+"-"+(dates.getMonth()+1)+"-"+dates.getDate();
// 		console.log(typeof(days));
// 		console.log(typeof(test));
// 		console.log("4");
// 		console.log(days.toString());
// 		console.log("5");
// 		console.log(test.toString());
// 		if(days.toString() == test.toString()) {
// 			console.log("확인");
// 		}
// 		else console.log("미확인");
		
//     	document.getElementsByClassName("2022-10-5")[0].addEventListener("click", function(){
//     		document.querySelector(".container").style.display = "none";
// 			console.log("확인");
//     	});
    </script>
</body>
</html>