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
			                        	<p class="infoEname">${ename}&nbsp;<span>${employeeInfo.eposition}</span>님</p>
			                            <p class="infoEmpno">사원번호&nbsp;:&nbsp;<span>${employeeInfo.empno}</span></p>
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
			                <p>div3</p>
			                <div class="day-rates">
							 	<p>초과 근무 : <span class="work-rates">${overTime}</span></p>
				                <p>지각 : <span class="work-rates">${countLate}</span></p>
				                <p>정상 근무 횟수 : <span class="work-rates">${countNormalCommuting}</span></p>
				                <p>휴가 요청 개수 : <span class="work-rates">${countApproval}</span></p>
				                <p>총 휴갸 개수: <span class="work-rates">${totalUsedHoliday.totalHoliday}</span></p>
				                <p>사용한 휴가 개수 : <span class="work-rates">${totalUsedHoliday.usedHoliday}</span></p>
			                </div>
			            </div>
			        </section>
			
				
				        <section class="right-section">
				        	<div class="div4">
					           	<p>div4</p>
							</div>
					        <div class="div1">
				                <p>사내 공지사항</p>
				                <div>
									<table>
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
				                </div>
				            </div>
				        </section>
					</div>
				</div>
			<div id="enterpop" style="display:none">
	            <div class="pop-container" >
	                <div class="pop1"><span id="todayEnterDate"></span><a href="" >✖️</a></div>
	                
	                <div class="pop2"><img src="https://i.pinimg.com/736x/c6/75/37/c67537a607e37016cd65de01fb4bf437.jpg" alt=""></div>
	                <div class="pop3">
	                    <p>이름&nbsp;:&nbsp;<span>${ename}</span></p>
<%-- 	                    <p>${employeeInfo.checkAdmin == 1? "관리자" : "직원"}&nbsp;/&nbsp;<span>${employeeInfo.eposition}</span></p> --%>
<%-- 	                    <p>사원번호&nbsp;:&nbsp;<span>${employeeInfo.empno}</span></p> --%>
	                    
	                    <p>현재 시간&nbsp;:&nbsp;<span id="todayEnterTime"></span></p>
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
	            <div class="pop1"><span id="todayLeaveDate"></span><a href="" >✖️</a></div>
	                <div class="pop2"><img src="https://i.pinimg.com/736x/c6/75/37/c67537a607e37016cd65de01fb4bf437.jpg" alt=""></div>
	                <div class="pop3">
	                    <p>이름&nbsp;:&nbsp;<span>${ename}</span></p>
<%-- 	                    <p>${employeeInfo.checkAdmin == 1? "관리자" : "직원"}&nbsp;/&nbsp;<span>${employeeInfo.eposition}</span></p> --%>
<%-- 	                    <p>사원번호&nbsp;:&nbsp;<span>${employeeInfo.empno}</span></p> --%>
	                    <p>현재 시간&nbsp;:&nbsp;<span id="todayLeaveTime"></span></p>
	                </div>
	                <div class="pop4">
	                    <form action="${pageContext.request.contextPath}/CommutingLeave">
	                        <button>퇴근하겠습니다</button>
	                    </form>
	                </div>    
	            </div>
	        </div>
		</div>
	</div>
    <script type="text/javascript">
    	
    
    
	    document.getElementById("enter").addEventListener("click",function(){
	    	if(${startTime == null}){
	    		let today = new Date();
	    		let date = today.toLocaleDateString();
	    		let time = today.toLocaleTimeString();
	       		document.getElementById("enterpop").style.display = "flex";
	       		document.getElementById("todayEnterDate").innerHTML = date;
	       		document.getElementById("todayEnterTime").innerHTML = time;
	       		
	    	}else {
	    		alert("이미 출근하셨습니다.");	    		
	    	}
	    });
	    document.getElementById("leave").addEventListener("click",function(){
	    	
	    	if(${endTime == null}){
	    		if(${startTime == null}){
		        	alert("출근 기록이 없습니다.")
		    	}else{
		    		let today = new Date();
		    		let date = today.toLocaleDateString();
		    		let time = today.toLocaleTimeString();
	    			document.getElementById("leavepop").style.display = "flex";
	    			document.getElementById("todayLeaveDate").innerHTML = date;
		       		document.getElementById("todayLeaveTime").innerHTML = time;		
		    	}
	    	}else {
	    		alert("이미 퇴근하셨습니다.");	    		
	    	}
	    	
	    });
	    
	   

    </script>


    
</body>
</html>


