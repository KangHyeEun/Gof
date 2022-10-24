<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main.css">
<title>Insert title here</title>
</head>
<style>
/*  	*{ */
/*         margin:0; */
/*         padding:0; */
/*     } */
/*     .total{ */
/* 	    display: flex; */
/*     } */
/*    .container{ */
/*     border: 1px solid black; */
/*     display: flex; */
/*     align-items:center; */
/*     justify-content:center; */
/*     width: 100%; */
/*     max-width: 1400px; */
/*     height: 100vh; */
/*     box-sizing: border-box; */
/*    } */
/* 	.container-inner { */
/* 	display:flex; */
/* 	justify-content:center; */
/* 	align-items:center; */

/* 	} */
/*    .inner-div{ */
/*     background-color:white; */
/*     width: 90%; */
/*     height: 90%; */
/*     display: flex; */
/*     flex-direction: column; */
/*     align-items: center; */
/*     padding: 3%; */
/*     box-sizing: border-box; */
/*    } */
.div1 {
	display: flex;
 	justify-content: space-between; 
	width: 100%;
    height: 10%;
    align-items: center;
}
.div1-1{
	display: flex;
    justify-content: space-between;
    width: 20%;
}

.div2{
	width: 100%;
/* 	height: 89.9%; */
	padding-top: 2%;
	display: flex;
	
}
.sub-title{ 
    width: 50%;
 } 
#sortingYear{
	width:50%;
}
.holiday-list{
    width: 100%;
    border-collapse:collapse;
     
}
.thead{
	border: none;
	border-bottom : 1px solid black;|
}
.tbody{
	border: none;
	border-bottom : 1px solid black;
}
#apply-holiday{
    border: 1px solid black;
    width: 15%;
    height: 65%;
    background-color: #272454;
    color: white;
    font-weight: bold;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 0.4rem;
}
#applypop {
	width: 100vw;
	height: calc(100% - 60px);
	position: absolute;
	background-color: rgba(209, 209, 209, 0.787);
	display: flex;
	justify-content: center;
	align-items: center;
}

.pop-container {
	background-color: white;
	width: 550px;
    height: 600px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
	padding: 2%;
	box-sizing: border-box;
	box-shadow: 0 17px 20px -18px rgba(0, 0, 0, 1);
	z-index: 1;
	border-radius: 5px;
}
.pop-titleContainer{
	display: flex;
    width: 43%;
    flex-direction: row;
    justify-content: space-between;
    align-content: baseline;
}


.pop1 {
	width: 100%;
    height: 10%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 1px solid black;
}
.pop1-1{
	width: 100%;
    height: 89.99%;
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    align-items: flex-start;
}
.pop-title{
	font-weight: bold;
    font-size: 1.2em;
}
.count-nums{
    height: 10%;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1em;
    font-weight: bold;
}
.pop1 a {
	text-decoration: none;
/* 	padding: 20px; */
}
.pop2 {
	height: 12%;
	width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    justify-content: space-between;
}
.pop2 > select{
	width:50%;
	height: 60%;
	padding: 0 2%;
}
.pop2-1{
	width:100%;
	height: 12%;

}
.pop2-3{
	width:100%;
	height: 30%;
}
.pop3 {
	display: flex;
	height: 100%;
	flex-direction: column;
	justify-content: space-between;
}

.pop4 {
    display: flex;
    width: 100%;
    flex-direction: column;
    justify-content: space-between;
    height: 100%;
}
.pop4 p{
	height: 13%;
}
.pop4 input{
	width: 100%;
    height: 80%;
}
.pop5 {
	display: flex;
	justify-content: center;
	width: 100%;
	height: 9%;
	
}

.pop5 form {
	width: 100%;
	height: 100%;
}
.pop-container>form{
	width: 100%;
	height: 100%;
}

#applypop .pop5 button {
	background-color: rgb(39 36 84);
    color: white;
    width: 100%;
    height: 100%;
    font-weight: bold;
    border-radius: 4px;

}
#morning-off,#afternoon-off{
	border: 1px solid black;
    width: 48%;
    height: 100%;
    border-radius: 3px;
    display: flex;
    justify-content: center;
    align-items: center;
}
/* #morning-off{ */
/* 	background-color:#272454; */
/* 	color: white; */
/* }  */
.halfType{
    height: 12%;
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    justify-content: space-between;
    display:none;
}
.select-halfType{
	display: flex;
    height: 58%;
    width: 50%;
    justify-content: space-between;
}
.date-div{
	display: flex;
    justify-content: space-between;
    width: 70%;
    height:55%;
}
.date-div input{
    width: 45%;
    height: 100%;
}
	
.p{
	font-size:13px;
}
.important{
	color: #ff6a53;
}
input[type=radio]{
	display: none;
}
#input1:checked ~ #morning-off{
	background-color: red;
}

#input2:checked ~ #afternoon-off{
	background-color: yellow;
}
</style> 
<body>


	<div class="container-wrap">
		<div class="header">
			<div class="navbar__toogleBtn" id="mobile-btn">☰</div>
			<img src="${pageContext.request.contextPath}/imges/logo.PNG" />
			<div class="header-logout">로그아웃 버튼</div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner-bbs">


				<div class="inner-div-bbs">
					<div class="div1">
						<div class="div1-1">
							<h3 class="sub-title">휴가 관리</h3> 
							<select name="sortingYear" id="sortingYear" onchange="OnChange();">
								<option value="0">전체년도</option>
								<c:forEach items="${distinctYear}" var="dy">
									<option value="${dy}" <c:if test ="${dy eq param.year}">selected="selected"</c:if>>${dy}</option>
								</c:forEach>
							</select>
						</div>
						<div id="apply-holiday"><span>휴가 신청하기</span></div>
					</div>
					<div class="div2">
						<table border="1" class="holiday-list">
							<thead class="thead">
								<tr>
									<th>id</th>
									<th>휴가 신청일</th>
									<th>종류</th>
									<th>시작일</th>
									<th>종료일</th>
									<th>내용</th>
									<th>허가여부</th>
									<th>totalHoliday</th>
								</tr>
							</thead>
							<tbody class="tbody">
								<c:forEach items="${holidayList}" var="hl">
									<tr>
										<th>${hl.id}</th>
										<th>${hl.hwriteDate}</th>
										<th>${hl.htype}</th>
										<th>${hl.hstartDate}</th>
										<th>${hl.hendDate}</th>
										<th>${hl.hcontent}</th>
										<th>${hl.approval}</th>
										<th>${hl.totalHoliday}</th>
									</tr>
								</c:forEach>
							</tbody>	
						</table>
					</div>
				</div>

				<!-- 	</div> -->


			</div>
<!-- 			<div id="applypop" style="display: none"> -->
			<div id="applypop">
				<div class="pop-container">
					<form action="${pageContext.request.contextPath}/ApplyHoliday" class="pop-form">
						<div class="pop1">
							<div class="pop-titleContainer">
								<span class="pop-title">휴가신청</span><span>*필수 입력란입니다</span>
							</div>
							<div>
								<a href="">✖️</a>
							</div>
						</div>
						<div class="pop1-1">
							<div class="count-nums">총휴가일수, 사용된 휴가일수, 잔여휴가일수</div>
							<div class="pop2">
								<p class="p"><span class="important">*</span>휴가 종류</p>
								<select name="leaveType" id="leaveType" onchange="TypeChange();">
									<option value="연차">연차</option>
									<option value="반차">반차</option>
								</select>
	<!-- 							<div class="halfType" id="halfType" style="display:none" > -->
							</div>
							
							<div class="pop2-1">
								<div class="pop3">
									<p class="p"><span class="important">*</span>휴가 기간 (하루를 사용하실 경우 모두 같은날을 선택해주세요)</p>
									<div class="date-div">
										<input type="date" placeholder="시작일 년/월/일" name="leaveStartDate" id="leaveStartDate"/>
										<span>~</span> 
										<input type="date" placeholder="종료일 년/월/일" name="leaveEndDate" id="leaveEndDate"/>
									</div>
								</div>
							</div>
							<div class="halfType" id="halfType" >
								<p class="p"><span class="important">*</span>반차</p>
								<div class="select-halfType">
<!-- 									<div id="morning-off">09:00~01:30</div> -->
<!-- 									<div id="afternoon-off">02:30~06:00</div> -->
									<label for="morning-off" id="morning-off">09:00~01:30</label><input id="input1" type="radio" value="오전" name="halfType" checked="checked"/>
									<label for="afternoon-off" id="afternoon-off">02:30~06:00</label><input id="input2" type="radio" value="오전" name="halfType"/>
								</div>
							</div>
							<div class="pop2-3">
								<div class="pop4">
									<p class="p">신청사유</p>
									<input type="text" placeholder="내용을 입력해주세요" name="content" id="content"/>
								</div>
							</div>	
							<div class="pop5">
								<button id="submit-btn">신청하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		document.getElementById("apply-holiday").addEventListener("click",function(){
			document.getElementById("applypop").style.display = "flex";
		});
		
		function OnChange(){    
			let year = document.getElementById("sortingYear").value;
	    	location.href="${pageContext.request.contextPath}/Holiday?year="+year;
	    };
	    
	    function TypeChange(){
	    	
	    	let type = document.getElementById("leaveType").value;
	    	let startDate = document.getElementById("leaveStartDate").value;
	    	let endDate = document.getElementById("leaveEndDate").value;
	    	let halfType = document.getElementById("halfType");
	    	if(type == "반차"){
	    		halfType.style.display = "flex";
	    	}
	    	if(type == "연차"){
	    		halfType.style.display = "none";
	    	}
// 	    	console.log(type);
// 	    	console.log(startDate);
// 	    	console.log(endDate);
	    };
	    
// 	    let after = document.getElementById("afternoon-off");
// 	    let morning = document.getElementById("morning-off")
// 	    after.addEventListener("click",function(){
// 	    	after.style.backgroundColor = "#272454";
// 	    	after.style.color = "white";
// 	    	morning.style.backgroundColor = "white";
// 	    	morning.style.color = "black";
// 	    });
// 	    morning.addEventListener("click",function(){
// 	    	after.style.backgroundColor = "white";
// 	    	after.style.color = "black";
// 	    	morning.style.backgroundColor = "#272454";
// 	    	morning.style.color = "white";
// 	    });
	    
	    document.getElementById("submit-btn").addEventListener("click",function(){
	    	location.href="${pageContext.request.contextPath}/ApplyHoliday?halfType="+"오전";
	    });
	</script>
</body>
</html>

