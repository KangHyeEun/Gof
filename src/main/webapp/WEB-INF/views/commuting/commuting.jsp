<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
<title>Insert title here</title>
<style type="text/css">
/*  *{ */
/*         margin:0; */
/*         padding:0; */
/*     } */
/*     .total{ */
/* 	    display: flex; */
/*     } */
/*    .container{ */
/*     border: 1px solid black; */
/*     display: flex; */
/*     width: 100%; */
/*     max-width: 1400px; */
/*     height: 100vh; */
/*     box-sizing: border-box; */
/*    } */
   .left-section{
    display:flex;
    flex-direction: column;
    flex:1;
    height: 100%;
    justify-content: space-between;
   }

   .right-section{
    border-radius: 7px;
    flex:1.4;
    height: 100%;
    display: flex;
    flex-direction: column;
    height: 100%;
    justify-content: space-between;
    align-items: end;
   }

   .left-section > .div1, .div2, .div3{
    display: flex;
    justify-content: center;
    align-items: center;
   }
   .left-section > .div1 {
    flex:1;
   }
   .left-section >.div2{
/*     flex: 3; */
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
   	height: 48%;
    width: 98%;
    background-color: white;
    border-radius: 7px;
    box-shadow: 1px 1px 8px #c1c1c1;
   }
   .left-section > .div2 .div2-1-1-1{
   	width: 35%;
    border: 1px solid black;
    border-radius: 56%;
    overflow: hidden;
   }
   
   .left-section > .div2 .div2-1-1-1 img {
	    object-fit: cover;
	    width: 100%;
	    height: 100%;
    }
   .left-section >.div2 > .div2-1,.div2-2,.div2-3{
    flex:1;
    display: flex;
    flex-direction: column;
    align-items: center;
   }
   .left-section > .div2 > .div2-1{
       display: flex;
       justify-content: center;
       align-items: center;
       flex:2;
       width: 100%;
   }
   
   .left-section > .div2 > .div2-1 > .div2-1-1, .div2-1-2,  .div2-1-3{
       display: flex;
       flex:2;
       align-items: center;
       width:100%;
       justify-content: space-evenly;
   }
   .left-section > .div2 > .div2-1 > .div2-1-3{
       flex:1;
       justify-content: start;
       font-weight: bold;
       margin-left: 60px;
   }
   .left-section > .div2 > .div2-2{
       display: flex;
       justify-content: center;
       flex-direction: row;
       flex: 0.8;
       width: 80%;


   }
   .left-section > .div3{
/*     flex: 3; */
    height: 48%;
    width: 98%;
    background-color: white;  
    border-radius: 7px; 
    box-shadow: 1px 1px 8px #c1c1c1;
    
   }
   
    #enterpop, #leavepop{
    width: 100vw;
    height: calc(100% - 60px);
    position: absolute;
    background-color: #fdfcfc94;;
    display: flex;
    justify-content: center;
    align-items: center;
   }
   .pop-container{
    background-color: white;
    width: 500px;
    height:500px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    padding: 1%;
    box-sizing: border-box;
    box-shadow: 0 17px 20px -18px rgba(0, 0, 0, 1);  
    border: 1px solid #bbb9b9;
    border-radius: 7px;
    
}
    .pop2 {
    width: 200px;
    height: 200px;
    background-color: gray;
    border-radius: 50%;
    overflow:hidden;
    box-shadow: 0px 0px 20px 1px #9997bb;
   
   }
   .pop2 img{
    object-fit: cover;
    width: 100%;
    height: 100%;
   }
   .pop1 {
    width: 100%;
    display: flex;
    justify-content: end;
   }
   .pop1 a {
    text-decoration: none;
    padding: 20px;
   }
   .pop3 {
    display: flex;
    height: 30%;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    color: #424242;
    font-weight: bold;
    }

   .pop4 {
    display: flex;
    justify-content: center;
    width:100%;
    height:15%;
   }
   .pop4 form{
    width: 50%;
   }
   #enterpop .pop4 form button{
    width: 100%;
    height: 45px;
    background-color: #3fb4d0;
    color: white;
    border: none;
    border-radius: 10px;
    font-weight: bold;
    font-size: 15px;
   }
   #enterpop .pop4 form button:hover{
   background-color: #3091a9;
   }
   
   #leavepop .pop4 form button{
    width: 100%;
    height: 45px;
    background-color: #272454;
    color: white;
    border: none;
    border-radius: 10px;
    font-weight: bold;
    font-size: 15px;
   }
   #leavepop .pop4 form button:hover{
   background-color: #464093;
   }
   
   @media ( max-width: 1024px ) {
    }
   @media ( max-width: 768px ) {
   
        
    }
    @media ( max-width: 480px ) {
    }
    
    .container-inner-bbs{
    	flex-direction: column;
    	justify-content: center;
    }
    .inner-div-bbs{
    	flex-direction: row;
    	height: 85%;
    	padding: 0;
    	background: #f0f5fa;
    }
    .greating{
    	display:flex;
    	width: 90%;
    	font-size : 14px;
    	padding: 15px;
    	box-sizing: border-box;
    }
    .div4{
    height: 48%;
    width: 98%;
    background-color: white;
    border-radius: 7px;
    box-shadow: 1px 1px 8px #c1c1c1;
    }
    
    .div1{
    height: 48%;
    width: 98%;
    background-color: white;
    border-radius: 7px;
    box-shadow: 1px 1px 8px #c1c1c1;
    }
    .div2-1-1-2 {
    width: 28%;
    display: flex;
    flex-direction: column;
    height: 100%;
    /* border: 1px solid black; */
    justify-content: space-evenly;
    
    }
   	.div2-1-1-2 > .buttons{
    display: flex;
    height: 25%;
    width: 110%;
    justify-content: space-between;
   	}
   	
   	#enter {
	width: 44%;
    background-color: #272454;
    color: white;
    font-weight: bold;
    padding: 8%;
    box-sizing: border-box;
    border-radius: 7px;
    display: flex;
    justify-content: center;
    align-items: center;
    }
    
    #leave {
    width: 44%;
    /* height: 90%; */
    /* border: 1px solid #272454; */
    background-color: #9190a4;
    color: white;
    font-weight: bold;
    padding: 8%;
    box-sizing: border-box;
    border-radius: 7px;
    display: flex;
    justify-content: center;
    align-items: center;
    }
    
    .showenter, .showleave{
   	border: 1px solid #9190a4;
    width: 45%;
    height: 40%;
    font-size: 17px;
    display: flex;
    justify-content: center;
    align-items: center;
    }
    
    .showenter{
   	border-radius: 10px 0 0 10px;
    }
    .showleave{
   	border-radius: 0 10px 10px 0;
    }
</style>
</head>
	
<body>
<!-- 	<div class="total"> -->
<%-- 		<jsp:include page="../include/menu.jsp"></jsp:include>	 --%>
<!-- 		<div class="container"> -->

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
<!-- 			            <div class="div1"> -->
<!-- 			                <h2>김가빈님</h2><h3>안녕하세요! 오늘도 행복한 하루 보내세요</h3> -->
<!-- 			            </div> -->
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
			                     <div class="showenter">출근 : </div>
			                    <div class="showleave">퇴근 : </div>
			                </div>
			            </div>
			            <div class="div3">
			                <p>div3</p>
			            </div>
			        </section>
			
				
				        <section class="right-section">
				        	<div class="div4">
					            <div class="list">
					            	<div class="sorting">정렬 버튼 위치 확인</div>
					            	<table border="1">
					            		<tr>
					            			<th>ID</th>
					            			<th>근무일</th>
					            			<th>출근시간</th>
					            			<th>퇴근시간</th>
					            			<th>근무시간</th>
					            			<th>연장근무시간</th>
					            		</tr>
						            	<c:forEach items="${CommutingList}" var="cl">
						            		<tr>
							            		<td>${cl.id}</td>
							            		<td>${cl.workday}</td>
							            		<td>${cl.startTime}</td>
							            		<td>${cl.endTime}</td>
							            		<td>${cl.workTime}</td>
							            		<td>${cl.overTime}</td>
						            		</tr>	
						            	</c:forEach>
					            	</table>
					            </div>
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
			                    <p>김사원님</p>
			                    <p>정보/사원</p>
			                    <p>이메일</p>
			                    <p>오늘날짜 시간</p>
			                </div>
			                <div class="pop4">
			                    <form action="${pageContext.request.contextPath}/commuting/enter">
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
			                    <form action="${pageContext.request.contextPath}/commuting/leave">
			                        <button>퇴근하겠습니다</button>
			                    </form>
			                </div>    
			            </div>
			        </div>
		</div>
	</div>
    <script type="text/javascript">
	    document.getElementById("enter").addEventListener("click",function(){
	        document.getElementById("enterpop").style.display = "flex";
	    });
	    document.getElementById("leave").addEventListener("click",function(){
	        document.getElementById("leavepop").style.display = "flex";
	    });
    </script>




        
	        
<!-- 	    </div> -->
	    
<!--     </div> -->
    
</body>
</html>

