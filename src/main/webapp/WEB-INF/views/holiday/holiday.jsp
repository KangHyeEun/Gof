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
	width: 500px;
	height: 500px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
	padding: 1%;
	box-sizing: border-box;
	box-shadow: 0 17px 20px -18px rgba(0, 0, 0, 1);
}

.pop2 {
	width: 100%;
}

.pop1 {
	width: 100%;
	display: flex;
	justify-content: space-between;
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
	width: 100%;
}

.pop5 {
	display: flex;
	justify-content: center;
	width: 100%;
	height: 15%;
}

.pop5 form {
	width: 50%;
}

#applypop .pop5 form button {
	width: 100%;
	height: 40px;
	background-color: rgb(181, 181, 249);
}
.select-halfType{
	display:flex;
	
}
#morning-off,#afternoon-off{
	border: 1px solid black;
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
					<form action="${pageContext.request.contextPath}/ApplyHoliday">
						<div class="pop1">
							<div>
								<span>휴가신청</span><span>*필수 입력란입니다</span>
							</div>
							<div>
								<a href="">✖️</a>
							</div>
						</div>
						<div>총휴가일수, 사용된 휴가일수, 잔여휴가일수</div>
						<div class="pop2">
							<p>휴가종류*</p>
							<select name="leaveType" id="leaveType" onchange="TypeChange();">
								<option value="연차">연차</option>
								<option value="반차">반차</option>
							</select>
<!-- 							<div class="halfType" id="halfType" style="display:none" > -->
							<div class="halfType" id="halfType" >
								<p>반차</p>
								<div class="select-halfType">
									<div id="morning-off"><span>09:00~01:30</span></div>
									<div id="afternoon-off"><span>02:30~06:00</span></div>
								</div>
							</div>
						</div>
						<div class="pop3">
							<p>휴가일선택* (하루를 사용하실 경우 같은날을 '두번 클릭해주세요')</p>
							<input type="date" placeholder="시작일 년/월/일" name="leaveStartDate" id="leaveStartDate"/> 
							<input type="date" placeholder="종료일 년/월/일" name="leaveEndDate" id="leaveEndDate"/>
						</div>
						<div class="pop4">
							<p>신청사유</p>
							<input type="text" placeholder="내용을 입력해주세요" name="content" id="content"/>
						</div>
						<div class="pop5">
							<button>신청하기</button>
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
	    		halfType.style.display = "block";
	    	}
	    	if(type == "연차"){
	    		halfType.style.display = "none";
	    	}
// 	    	console.log(type);
// 	    	console.log(startDate);
// 	    	console.log(endDate);
	    };
	    
	</script>
</body>
</html>

