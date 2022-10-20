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
            <div class="header-logout">로그아웃 버튼</div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner-bbs">
			<div class="greating"><h2>김루피님, 안녕하세요! 오늘도 행복한 하루 보내세요</h2></div> 
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
			                        	<p>김루피님</p>
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
			            </div>
			        </section>
			
				
				        <section class="right-section">
				        	<div class="div4">
					           	<p>div4</p>
							</div>
					        <div class="div1">
				                <p>div1</p>
				            </div>
				        </section>
					</div>
				</div>
			<div id="enterpop" style="display:none">
	            <div class="pop-container" >
	                <div class="pop1"><a href="" >✖️</a></div>
	                <div class="pop2"><img src="https://i.pinimg.com/736x/c6/75/37/c67537a607e37016cd65de01fb4bf437.jpg" alt=""></div>
	                <div class="pop3">
	                    <p>김루피님</p>
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
	    	alert("하이");
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
	    
	   

    </script>


    
</body>
</html>


