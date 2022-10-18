<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 *{
        margin:0;
        padding:0;
    }
    .total{
	    display: flex;
    }
   .container{
    border: 1px solid black;
    display: flex;
    width: 100%;
    max-width: 1400px;
    height: 100vh;
    box-sizing: border-box;
   }
   .left-section{
    border: 1px solid red;
    display:flex;
    flex-direction: column;
    flex:2;
   }

   .right-section{
    border: 1px solid blue;
    flex:2;
   }

   .left-section > .div1, .div2, .div3{
    border:1px solid black;
    display: flex;
    justify-content: center;
    align-items: center;
   }
   .left-section > .div1 {
    flex:1;
   }
   .left-section >.div2{
    flex: 3;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    
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
        justify-content: space-around;
   }
   .left-section > .div2 > .div2-1 > .div2-1-3{
       flex:1;
   }
   .left-section > .div2 > .div2-2{
       display: flex;
       justify-content: space-around;
       flex-direction: row;
       flex:1;
       width: 100%;

   }
   .left-section > .div3{
    flex: 3;
   }
   
    #enterpop, #leavepop{
    width: 100vw;
    height: 100vh;
    position: absolute;
    background-color: rgba(209, 209, 209, 0.787);
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
    
}
    .pop2 {
    width: 200px;
    height: 200px;
    background-color: gray;
    border-radius: 50%;
    overflow:hidden;
   
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
    justify-content: space-evenly;
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
    height: 40px;
    background-color: rgb(181, 181, 249);
   }
   #leavepop .pop4 form button{
    width: 100%;
    height: 40px;
    background-color: rgb(77, 77, 238);
   }
   
   @media ( max-width: 1024px ) {
    .container {
            flex-direction: column;
        }
       
    }
   @media ( max-width: 768px ) {
   
        
    }
    @media ( max-width: 480px ) {
    }
   
</style>
</head>
	
<body>
	<div class="total">
		<jsp:include page="../include/menu.jsp"></jsp:include>	
		<div class="container">
        <section class="left-section">
            <div class="div1">
                <h2>김가빈님</h2><h3>안녕하세요! 오늘도 행복한 하루 보내세요</h3>
            </div>
            <div class="div2">
                <div class="div2-1">    
                    <div class="div2-1-3">
                        <p>오늘 나의 출퇴근</p>
                    </div>
                    <div class="div2-1-1">
                        <div class="div2-1-1-1">
                            <p>여기는 사진</p>
                        </div>
                        <div class="div2-1-1-2">
                            <p>직원 종류</p>
                            <p>출근</p>
                            <p>퇴근</p>
                        </div>
                    </div>
                </div>
                <div class="div2-2">
                     <div id="enter">출근</div>
                    <div id="leave">퇴근</div>
                </div>
            </div>
            <div class="div3">
                <p>div3</p>
            </div>
        </section>

	
	        <section class="right-section">
	            <div class="sorting"></div>
	            <div class="list">
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
	        </section>
	        
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
    
    <script type="text/javascript">
	    document.getElementById("enter").addEventListener("click",function(){
	        document.getElementById("enterpop").style.display = "flex";
	    });
	    document.getElementById("leave").addEventListener("click",function(){
	        document.getElementById("leavepop").style.display = "flex";
	    });
    </script>
</body>
</html>

