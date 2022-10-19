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
<link rel="stylesheet" href="${pageContext.request.contextPath}/commuting/style.css">
<title>Insert title here</title>

</head>	
<body>
	<div class="container-wrap">
		<div class="header">
			<img src="${pageContext.request.contextPath}/imges/logo.PNG"/>
            <div class="header-logout">로그아웃 버튼</div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner-bbs">
			<div class="greating"><h2>김가빈님, 안녕하세요! 오늘도 행복한 하루 보내세요</h2></div> 
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
			                            <img src="https://i.pinimg.com/736x/c6/75/37/c67537a607e37016cd65de01fb4bf437.jpg" alt="">
			                        </div>
			                        <div class="div2-1-1-2">
			                        	<p>직원 / 관리자</p>
			                        	<p>김가빈님</p>
			                            <p><span>직원 종류</span></p>
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
			                <p>휴가신청 : </p>
			                <p>휴가신청 승인 : </p>
			            </div>
			        </section>
			
				
				        <section class="right-section">
				        	<div class="div4">
					           	<div class="sorting">
									<p>출퇴근 관리</p>
									<div>
										<select name="sorting-year" id="sorting-year" onchange="OnChange();">
											<c:forEach items="${distinctYear}" var="year">
												<option value="${year}">${year}</option>
											</c:forEach>
										</select>
										<span>년</span>
										<select name="sorting-month" id="sorting-month"  onchange="OnChange();">
											<c:forEach items="${distinctMonth}" var="month">
												<option value="${month}" <c:if test ="${month eq todayMonth}">selected="selected"</c:if>>${month}</option>
											</c:forEach>
										</select>
										<span>월</span>
									</div>
								</div>
					            <div class="list">
					            	<table class="list-table" border="1" >
					            		<thead class="table-head">
						            		<tr>
						            			<th>ID</th>
						            			<th>근무일</th>
						            			<th>출근시간</th>
						            			<th>퇴근시간</th>
						            			<th>근무시간</th>
						            			<th>연장근무시간</th>
						            		</tr>
					            		</thead>
					            		<tbody class="table-body" id="table-body">
							            	<c:forEach items="${CommutingList}" var="cl">
							            		<tr>
								            		<td>${cl.id}</td>
								            		<td>${cl.workday}</td>
								            		<td>${cl.startTime}</td>
								            		<td>${cl.endTime != null? cl.endTime : "-"}</td>
								            		<td>${cl.workTime != null? cl.workTime : "-"}</td>
								            		<td>${cl.overTime != null? cl.overTime : "-"}</td>
							            		</tr>	
							            	</c:forEach>
						            	</tbody>
					            	</table>
					            </div>
					         </div>
					        <div class="div1">
				                <p>초과근무시간 : ${overTime}</p>
				            </div>
				        </section>
					</div>
				</div>
			<div id="enterpop" style="display:none">
	            <div class="pop-container" >
	                <div class="pop1"><a href="" >✖️</a></div>
	                <div class="pop2"><img src="https://i.pinimg.com/736x/c6/75/37/c67537a607e37016cd65de01fb4bf437.jpg" alt=""></div>
	                <div class="pop3">
	                    <p>김사원님</p>
	                    <p>정보/사원</p>
	                    <p>이메일</p>
	                    <p>오늘날짜 시간</p>
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
	                    <p>김사원님</p>
	                    <p>정보/사원</p>
	                    <p>이메일</p>
	                    <p>오늘날짜 시간</p>
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
	       		document.getElementById("enterpop").style.display = "flex";
	    	}else {
	    		alert("이미 출근하셨습니다.");	    		
	    	}
	    });
	    document.getElementById("leave").addEventListener("click",function(){
	    	
	    	if(${endTime == null}){
	    		if(${startTime == null}){
		        	alert("출근 기록이 없습니다.")
		    	}else{
	    			document.getElementById("leavepop").style.display = "flex";	    		
		    	}
	    	}else {
	    		alert("이미 퇴근하셨습니다.");	    		
	    	}
	    	
	    });
	    
	    function OnChange(){    
	    	let year = document.getElementById("sorting-year").value;
	    	let month = document.getElementById("sorting-month").value;
// 	    	alert(year);
// 	    	alert(month);
	    	let child = document.getElementById("table-body").children;
	    	
	    	// 정렬 테이블 초기화
	    	for (let i = 0; i < child.length; i++) {
			   	child[i].style.display = "";
			}
	    	
	    	for (let i = 0; i < child.length; i++) {
	    	let date = child[i].children[1].innerHTML;
	    	let spliteddate = date.split("-");
		    	if(month == spliteddate[1] && year == spliteddate[0]){
		    		child[i].style.display = "";
		    		
		    	}else {
		    		child[i].style.display = "none";
		    	}
			}
	    	
	    };
	    
	    document.addEventListener("DOMContentLoaded", function(){
	    	let year = document.getElementById("sorting-year").value;
	    	let month = document.getElementById("sorting-month").value;
// 	    	alert(year);
// 	    	alert(month);
	    	let child = document.getElementById("table-body").children;
	    	
	    	for (let i = 0; i < child.length; i++) {
				
// 	    	console.log(child[i].children[1].innerHTML);
	    	let date = child[i].children[1].innerHTML;
	    	let spliteddate = date.split("-");
	    	console.log(spliteddate[0]);
	    	
		    	if(month == spliteddate[1] && year == spliteddate[0]){
		    		child[i].style.display = "";
		    		
		    	}else {
		    		child[i].style.display = "none";
		    	}
			}
	    	
	    	

	    });
    </script>


    
</body>
</html>


