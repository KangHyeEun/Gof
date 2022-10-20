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
<style type="text/css">

	.inner-div-bbs{
	    justify-content: space-between;
	    padding-bottom : 2%;
	}
	.container1{
		width: 100%;
		height: 12%;
		display:flex;
		flex-direction:row;
		justify-content: space-between;
		align-items:center;
 		border:1px solid black; 
	}
	.container1 .section1, .container .section2{
		height: 100%;
 		border: 1px solid red; 
		padding: 1%;
		box-sizing : border-box;
	}
	.container1 .section1{
		width: 35.9%;
	}
	.container .section2{
		width: 64.9%;
		display: flex;
		justify-content: space-between;
	}
	.sub-title{
		font-weight: bold;
	}
	.container2{
		width: 100%;
		height: 78%;
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
/* 		border:1px solid black; */
	}
	
	
	.intro {
    height: 5%;
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-content: space-between;
	}
	
	.select{
	height:4%;
	width: 100%;
/* 	border: 1px solid blue; */
	display: flex;
    justify-content: center;
	}
/* 	.select-container{ */
/* 		width: 10%; */
/* 		height: 100%; */
/* 		display:flex; */
/* 		flex-direction: row; */
/* 		justify-content: center; */
/* 	} */
	.num{
	height: 100%;
	width: 30px;
 	margin: 0 2px; 
	border: 1px solid #c1c1c1;
	display: flex;
	justify-content:center;
	align-items:center;
/* 	font-weight: bold; */
 	margin-radius:10px; 
	font-size:11px;
	color: black;
	}
	.num a{
	text-decoration : none;
	height: 100%;
	width: 100%;
	display: flex;
	justify-content:center;
	align-items:center;
	}
	.checked{
	background-color: #272454;
	color: white;
	border: 1px solid #272454;
	}
	
	.notchecked:hover{
	background-color: #959595;
	color: black;
	border: 1px solid #959595;
	}
</style>
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
				<div class="inner-div-bbs">
					<div class="intro">
						<h3>근무 기록</h3>
						<p>⏏홈&gt;근태 관리&gt;근무 기록</p>
					</div>
					<div class="container1">
						<section class="section1">
							<p class="sub-title">이번 달 근무 현황 그래프</p>
							<div class="progress-bar">진행현황그래프</div>
						</section>
						<section class="section2">
							<p class="sub-title">이번 달 근무 상세 현황</p>
							 <p>초과 근무 : ${overTime}</p>
			                <p>지각 : ${countLate}</p>
			                <p>정상 근무 횟수 : <span id="normal-commuting"></span></p>
							<p>근무시간 미달 : </p>
						</section>					
					</div>
					<div class="container2">
						<!-- 정렬 버튼 -->
							<div class="sorting">
								<p>출퇴근 관리</p>
								<div>
									<select name="sorting-year" id="sorting-year" onchange="OnChange();">
										<option value="0">전체 연도</option>
										<c:forEach items="${distinctYear}" var="year">
											<option value="${year}" <c:if test ="${year eq param.year}">selected="selected"</c:if>>${year}</option>
										</c:forEach>
									</select>
									<span>년</span>
									<select name="sorting-month" id="sorting-month" onchange="OnChange();">
										<option value="0">전체 월</option>
										<c:forEach begin="1" end="12" var="month">
											<option value="${month}" <c:if test ="${month eq param.month}">selected="selected"</c:if>>${month}</option>
										</c:forEach>
									</select>
									<span>월</span>
								</div>
							</div>
							<!-- 게시판 -->
							<div class="list">
				            	<table class="list-table" border="1" >
				            		<thead class="table-head">
					            		<tr>
					            			<th>순서</th>
					            			<th>근무일</th>
					            			<th>출근시간</th>
					            			<th>퇴근시간</th>
					            			<th>근무시간</th>
					            			<th>연장근무시간</th>
					            			<th>테스트</th>
					            		</tr>
				            		</thead>
				            		<tbody class="table-body" id="table-body">
						            	<c:forEach items="${CommutingList}" var="cl" varStatus="status1">
						            		<tr id="tr${status1.count}">
							            		<td>${cl.id}</td>
							            		<td>${cl.workday}</td>
							            		<td>${cl.startTime}</td>
							            		<td>${cl.endTime != null? cl.endTime : "-"}</td>
							            		<td>${cl.workTime != null? cl.workTime : "-"}</td>
							            		<td>${cl.overTime != null? cl.overTime : "-"}</td>
							            		<td>${cl.empno}</td>
						            		</tr>	
						            	</c:forEach>
					            	</tbody>
				            	</table>
				            </div>
						</div>
						<div class="select">
							<%
// 							int Ppage = Integer.parseInt((String)request.getParameter("page"));
// 							int begin = (Ppage-1)/10 <= 0 ? 0 : (int)Math.ceil((Ppage-1)/10)*10;
// 							int CommutingList = Integer.parseInt(request.getParameterValues("CommutingList").size());
							
// 							int end = Ppage   begin+9;
							%>
<!-- 							<a id="doubleprev">＜＜</a> -->
<!-- 							<div class="select-container"> -->
								<div class="num"><a id="prev">◀</a></div>
									<c:forEach begin="1" end="${CommutingList.size() == 0? 1 : CommutingList.size()%10 == 0? CommutingList.size()/10 : 
									((CommutingList.size()/10)+(1-((CommutingList.size()/10)%1))%1)}" varStatus="status">
										<c:choose>
											<c:when test="${param.page eq status.count}">
												<div class="num checked"><span>${status.count}</span></div>
											</c:when>
											<c:otherwise>				
												<div class="num notchecked"><a href="Commuting?page=${status.count}&&year=${param.year}&&month=${param.month}">${status.count}</a></div>							
											</c:otherwise>
										</c:choose>
									</c:forEach>
								<div class="num"><a id="next">▶</a></div>
<!-- 							</div> -->
<!-- 							<a id="doublenext">＞＞</a> -->
							
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
		let size = ${CommutingList.size()};
		let page = ${param.page};
		let year = document.getElementById("sorting-year").value;
    	let month = document.getElementById("sorting-month").value;
		
		 document.addEventListener("DOMContentLoaded", function(){
			
		
// 			alert("하이");
// 			alert(page);
// 			alert(size);
// 			// 페이지 이동
			for (var i = 0; i < size; i++) {
				if(i+1 > 10*page || i+1 <= 10*(page-1)){
					document.getElementById("tr"+(i+1)).style.display = "none";		
				}
			}
			
			// 순서 아이디 값으로 넣기
// 			let year = document.getElementById("sorting-year").value;
// 	    	let month = document.getElementById("sorting-month").value;
// 	    	let child = document.getElementById("table-body").children;
	    	
// 	    	var cnt = 0;
// 	    	for (let i = 0; i < child.length; i++) {
				
// 	    	let date = child[i].children[1].innerHTML;
// 	    	let spliteddate = date.split("-");
	    	
// 	    	child[i].children[0].innerHTML = i+1;
	    	
	    	
// 		    	if(month == spliteddate[1] && year == spliteddate[0]){
// 		    		// 표시되어있는 tr 갯수 세기
// 			    	cnt++;
// 		    		child[i].style.display = "";
// 		    		for (var j = 0; j < cnt; j++) {
// 		    			child[i].children[0].innerHTML = i;	
// 					}
// 		    	}else {
// 		    		child[i].style.display = "none";
// 		    	}
		    	
// 			}
			
			
		 });
			// 버튼
			var prev = document.getElementById("prev");
			var next = document.getElementById("next");
			var doubleprev = document.getElementById("doubleprev");
			var doublenext = document.getElementById("doublenext");
			
			prev.addEventListener("click",function(){
				var page1 = page-1;
				if(page1 <= 0){
					page1 = 1;
				}
				location.href="${pageContext.request.contextPath}/Commuting?page="+page1+"&&year="+year+"&&month="+month;
			});
			next.addEventListener("click",function(){
				var page1 = page+1;
				if(page1 >= Math.ceil(size/10)){
					page1 = Math.ceil(size/10);
				}
				location.href="${pageContext.request.contextPath}/Commuting?page="+page1+"&&year="+year+"&&month="+month;
			});
// 			doubleprev.addEventListener("click",function(){
// 				var page1 = 0;
// 				if(page > 1){
// 					if(Math.floor((page)/10) <= 1){
// 						page1 = 1;
// 					}else if(Math.floor((page-1)/10)*10+1 > 1){
// 						page1 = Math.floor((page-1)/10)*10;
// 					}
// 					location.href="${pageContext.request.contextPath}/Commuting?page="+page1+"&&year="+year+"&&month="+month;	
// 				}	
// 			});
// 			doublenext.addEventListener("click",function(){
// 				var page1 = 0;
// 				if(page < Math.ceil(size/10)){
// 					if(page%10 == 0){
// 						page1 = page+1;
// 					}else if((Math.floor((page-1)/10)+1)*10+1 < Math.ceil(size/10)){
// 						page1 = (Math.floor((page-1)/10)+1)*10+1;
// 					}else{
// 						page1 = Math.ceil(size/10);
// 					}
// 					location.href="${pageContext.request.contextPath}/Commuting?page="+page1+"&&year="+year+"&&month="+month;
// 				}
// 			});


		function OnChange(){    
			year = document.getElementById("sorting-year").value;
    		month = document.getElementById("sorting-month").value;
	    	location.href="${pageContext.request.contextPath}/Commuting?page="+1+"&&year="+year+"&&month="+month;
	    };
		
		</script>
	
	
</body>
</html>