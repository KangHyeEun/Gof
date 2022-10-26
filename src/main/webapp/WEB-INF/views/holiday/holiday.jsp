<%@page import="com.awoo.vo.HolidayVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/holiday/style.css">
<title>Insert title here</title>
</head>
<style>
	


	table{
		border:0;
		font-size: 0.9em;
	}
	th, td {
	    border: none;
	    padding: 1em;
 	    width: 80px; 
 	    white-space: nowrap;
/* 	    white-space: nowrap; */
	    
	}
/* 	th:nth-child(4), td:nth-child(4){ */
/* 		width:150px; */
/* 	} */
	.holiday-list tr th:nth-child(5), .holiday-list tr td:nth-child(5){
	width: 170px;
	white-space: nowrap;
	}
	.holiday-list tr th:nth-child(6), .holiday-list tr td:nth-child(6){
    display: block;
/*     width: 100%;  */
    width: 22em;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;
    height: 0.8em;
    text-align: left; 
    word-wrap: break-word;
    display: -webkit-box;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    
	}
	th{
/* 	    border-bottom: 1px solid #444444;	 */
	}
	.sub-sub-title{
	    display: flex;
	    justify-content: flex-start;
	    width: 100%;
	    height: 10%;
	    align-items: center;
	}
	.sub-sub-title h4{
/* 	    width: 10%; */
	    width: 130px;
	}
	.sub-sub-title p{
		font-weight: bold;
	}
	.sub-sub-title span{
		color: #2196f3;
	}
	tbody tr:nth-child(odd){
	background-color: #f8f8f9;
	}
	.count-nums{
	    justify-content: space-evenly;
	}
	.count-nums .holiday-count{
		color : #2196f3;
	}
	
	
	
	
	.modal .btn{cursor: pointer;border: 1px solid #999999;text-align: center;border-radius: 5px;outline: none;font-weight: 500;}
	.dimLayer{display: block;width: 100%;background-color: rgba(0, 0, 0, 0.3);position: fixed;left: 0;top: 0px;margin: 0;padding: 0;z-index: 9998;}
	.modal{width: 600px;height: 252px;border-radius: 10px;padding: 80px 24px;box-sizing: border-box;text-align: center;}
	.modal-section{background: #ffffff;box-sizing: border-box;display: none;position: absolute;top: 50%;left: 50%;-webkit-transform: translate(-50%, -50%);-ms-transform: translate(-50%, -50%);-moz-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);transform: translate(-50%, -50%);display: none;z-index: 9999;}
	.menu_msg{font-size: 21px;font-weight: 500;}
	.enroll_box p{padding-bottom: 56px;}
	.gray_btn {width: 90px;background: #ffffff;color: #999999;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;}
	.pink_btn {width: 90px;background: #ed197a;color: #fff;height: 36px;line-height: 36px;transition: 0.5s;font-size: 17px;border: none;}
	
	
	.detail-container{
	 	width: 100%;
	    height: 100%;
	    display: flex;
	    /* justify-content: flex-start; */
	    flex-direction: column;
	    justify-content: space-around;
	    
	}
	.detail-container table tr{
/* 		background-color : white; */
	}
	.detail-container table,.detail-container table td {
		border-collapse: collapse;
		border:1px solid #dfdfdf;
		padding: 10px;

	}
	.detail-container table td:nth-child(1){
    	width: 100px;
    	text-align : center; 
	}
	.detail-container table tr:nth-child(4){
/*     	height: 13rem;  */
	}
	
	.approval-container{
		width: 100%;
	    display: flex;
	    flex-direction: column;
	    height: 23%;
	    font-weight: bold;
	    justify-content: center;
	}	    
	.approvalDate,.reject{
		height: 30px;pop-rejection_reason
	}
	
	#pop-approvalDate, #pop-rejection_reason{
		font-weight: normal;
    	padding: 0 1em;	
	}
	#pop-approval{
		color : rgb(33, 150, 243);
	}
	#pop-hcontent{
	    display: block;
	    /* width: 100%; */
	    width: 22em;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: normal;
	    height: 11em;
	    text-align: left;
	    word-wrap: break-word;
	}
	@media screen and (max-width: 1864px) {
		th, td {
/* 	        padding: 0.8em; */
   			font-size: 14px;
		}
		.select {
    		height: 4%;
    	}
		.sub-title {
		    width: 62%;
    	}
    	.sub-sub-title h4 {
/*     		width: 13%; */
    	}
    	.div1 {
/* 	    	height: 11%; */
	    }
	    .div1-1 {
/*     		width: 21%; */
	    }
}
	@media screen and (max-width: 1490px) {
		th, td {
	        padding: 1em 0.6em;
   			font-size: 14px;
		}
		.select {
    		height: 4%;
    	}
		.sub-title {
		    width: 62%;
    	}
    	.sub-sub-title h4 {
/*     		width: 13%; */
    	}
    	.div1 {
/* 	    	height: 11%; */
	    }
	    .div1-1 {
/*     		width: 21%; */
	    }
}
@media screen and (max-width: 1280px) {
	th, td {
		padding: 0.9em 0.3em;
	    font-size: 14px;
    	white-space: nowrap;
		
	}
	.thead tr th:nth-child(1),
	.thead tr th:nth-child(4),
	.thead tr th:nth-child(6),
	.tbody tr td:nth-child(1),
	.tbody tr td:nth-child(4),
	.tbody tr td:nth-child(6){
		display: none;
	}
}
@media screen and (max-width: 1050px) {
	#apply-holiday {
	    width: 90px;
	    font-size: 12px;
	}
	th, td {
    	padding: 17px 0;
	    font-size: 12px;
	}

@media screen and (max-width: 668px) {
	.num {
	    height: 78%;
	    width: 20px;
    }
	th, td {
		padding: 18px 0;
	    font-size: 11px;
	}
	.pop-titleContainer {
    	width: 64%;
    }
    .pop-container {
    width: 400px;
    padding: 6%
    }
    .count-nums {
    font-size: 0.8em;
    }
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
					<div class="sub-sub-title">
						<h4>◎&nbsp;휴가 신청내역</h4>
<%-- 						<p>잔여일수 : <span>${holidayList[0].totalHoliday}</span>일</p> --%>
<%-- 						<p>사용일수 : <span>${holidayList[0].usedHoliday}</span>일</p> --%>
						<p>잔여일수 : <span>${holidayList[0].totalHoliday - holidayList[0].usedHoliday}</span>일</p>
					</div>
					 
					<div class="div2">
						<table border="1" class="holiday-list">
							<thead class="thead">
								<tr>
									<th>id</th>
									<th>휴가 신청일</th>
									<th>종류</th>
									<th>반차 종류</th>
									<th>기간</th>
<!-- 									<th>일수</th> -->
									<th>내용</th>
									<th>처리 상태</th>
									<th>결재일</th>
									<th>상세보기</th>
								</tr>
							</thead>
							<tbody class="tbody" id="htable-body">
								<c:forEach items="${holidayList}" var="hl" varStatus="status1">
									<tr id="tr${status1.count}">
										<td>${hl.id}</td>
										<td>${hl.hwriteDate}</td>
										<td>${hl.htype}</td>
										<td>${hl.halfDay != null ? hl.halfDay : "-"}</td>
										<td>${hl.hstartDate} ~ ${hl.hendDate}</td>
<%-- 										<td>${hl.countDate}</td> --%>
										<td>${hl.hcontent}</td>
										<td>${hl.approval}</td>
										<td>${hl.approvalDate != null ? hl.approvalDate : "-"}</td>
										<td><a class="${hl.id}" id="atag${status1.count}">상세보기</a></td>
									</tr>
								</c:forEach>
							</tbody>	
						</table>
					</div>
					<div class="select">
						<div class="num"><a id="prev">◀</a></div>
							<%
							int Ppage = Integer.parseInt((String)request.getParameter("page"));
							int begin = (Ppage-1)/10 <= 0 ? 1 : (int)Math.ceil((Ppage-1)/10)*10+1;
							
							
							List<HolidayVO> list = (List<HolidayVO>)request.getAttribute("holidayList");
							
							int celi = (int)Math.ceil(list.size()/10);
							int endPage = list.size() == 0 ? 1 : celi - begin > 10 ? begin+9 : celi+1;
							%>
							<c:forEach begin="<%=begin%>" end="<%=endPage%>" varStatus="status" var="var">
								<c:choose>
									<c:when test="${param.page eq var}">
										<div class="num checked"><span>${var}</span></div>
									</c:when>
									<c:otherwise>				
										<div class="num notchecked"><a href="Holiday?page=${var}&&year=${param.year}">${var}</a></div>							
									</c:otherwise>
								</c:choose>
							</c:forEach>
						<div class="num"><a id="next">▶</a></div>
					</div>

				<!-- 	</div> -->


			</div>
<!-- 			<div id="applypop" style="display: none"> -->
			
<!-- 	         <section class="modal modal-section type-alert" id="confirmed-block"> -->
<!-- 	            <div class="enroll_box"> -->
<!-- 	                <p class="menu_msg">휴가 신청이 정상적으로 완료되었습니다</p> -->
<!-- 	            </div> -->
<!-- 	            <div class="enroll_btn"> -->
<!-- 	                <button class="btn pink_btn modal_close">확인</button> -->
<!-- 	            </div> -->
<!-- 	        </section> -->
		</div>
		
		<div id="applypop">
				<div class="pop-container">
					<form action="${pageContext.request.contextPath}/ApplyHoliday" class="pop-form" method="post">
						<div class="pop1">
							<div class="pop-titleContainer">
								<span class="pop-title">휴가신청</span><span><span class="important">*</span>필수 입력란입니다</span>
							</div>
							<div>
								<a href="">✖️</a>
							</div>
						</div>
						<div class="pop1-1">
							<div class="count-nums">
								<span>총휴가일수:&nbsp;<span class="holiday-count">${holidayList[0].totalHoliday}</span></span>
								<span>사용된 휴가일수:&nbsp;<span class="holiday-count">${holidayList[0].usedHoliday}</span></span> 
								<span> 잔여휴가일수:&nbsp;<span class="holiday-count">${holidayList[0].totalHoliday - holidayList[0].usedHoliday}</span></span>
							</div>
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
										<input type="date" placeholder="시작일 년/월/일" name="leaveStartDate" id="leaveStartDate" required onchange="SDateCheck();"/>
										<span class="end-cal">~</span> 
										<input class="end-cal" type="date" placeholder="종료일 년/월/일" name="leaveEndDate" id="leaveEndDate" required onchange="EDateCheck();"/>
									</div>
								</div>
							</div>
							<div class="halfType" id="halfType" >
								<p class="p"><span class="important">*</span>반차</p>
								<div class="select-halfType">
<!-- 									<div id="morning-off">09:00~01:30</div> -->
<!-- 									<div id="afternoon-off">02:30~06:00</div> -->
									<input id="input1" type="radio" value="오전" name="halfType" checked="checked"/><label for="input1" id="morning-off" onclick='getMType()'>09:00~01:30</label>
									<input id="input2" type="radio" value="오후" name="halfType"/><label for="input2" id="afternoon-off" onclick='getAType()'>02:30~06:00</label>
								</div>
							</div>
							<div class="pop2-3">
								<div class="pop4">
									<p class="p"><span class="important">*</span>신청사유</p>
									<textarea placeholder="내용을 입력해주세요" name="content" id="content" required></textarea>
								</div>
							</div>	
							<div class="pop5">
								<button id="submit-btn" type="button">신청하기</button>
								<button type="submit" id="real-submit-btn" style="display: none">신청하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			
	        <section class="modal modal-section type-confirm" id="confirm-block">
	            <div class="enroll_box">
	                <p class="menu_msg" id="real-submit-message">휴가를 신청하시겠습니까?</p>
	            </div>
	            <div class="enroll_btn">
	                <button class="btn pink_btn btn_ok" id="btn_ok">확인</button>
	                <button class="btn gray_btn modal_close" id="btn_cancle">취소</button>
	            </div>
	        </section>
		
			<div id="detailpop">
				<div class="pop-container">
					<div class="pop1">
						<div class="pop-titleContainer">
							<span class="pop-title">휴가 신청 상세내역</span>
							<span id="pop-approval"></span>
						</div>
						<div>
							<a href="">✖️</a>
						</div>
					</div>
					<div class="detail-container">
					
						<div></div>
						<table border="1">
							<tr>
								<td>휴가 신청일</td>
								<td><span id="pop-writeDate"></span></td>
							</tr>
							<tr>
								<td>휴가 종류</td>
								<td><span id="pop-halfDay"></span><span id="pop-htype"></span></td>
							</tr>
							<tr>
								<td>기간</td>
								<td><span id="pop-hstartDate"></span>&nbsp;~&nbsp;<span id="pop-hendDate"></span></td>
							</tr>
							<tr>
								<td>일수</td>
								<td><span id="pop-countDate"></span></td>
							</tr>
							<tr>
								<td>신청 내용</td>
								<td><span id="pop-hcontent"></span></td>
							</tr>
						</table>
<!-- 						<div>휴가 신청일: <span id="pop-writeDate"></span></div> -->
<!-- 						<div>휴가 종류: <span id="pop-htype"></span></div> -->
<!-- 						<div>반차 종류: <span id="pop-halfDay"></span></div> -->
<!-- 						<div>기간: <span id="pop-hstartDate"></span>~<span id="pop-hendDate"></span></div> -->
<!-- 						<div>일수: <span id="pop-countDate"></span></div> -->
<!-- 						<div>내용: <span id="pop-hcontent"></span></div> -->
<!-- 						<div>처리 상태: <span id="pop-approval"></span></div> -->
						<div class="approval-container">
							<div class="approvalDate">결재일: <span id="pop-approvalDate">넣을 예정</span></div>
							<div id="reject" class="reject">반려사유: <span id="pop-rejection_reason">넣을 예정</span></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		let size = ${holidayList.size()};
		let page = ${param.page};
		let year = ${param.year};
	
	    document.addEventListener("DOMContentLoaded", function(){
			// 페이지 이동
			for (var i = 0; i < size; i++) {
				// 현재 페이지에서 10개씩만 tr 출럭함 나머지 display none
				if(i+1 > 10*page || i+1 <= 10*(page-1)){
					document.getElementById("tr"+(i+1)).style.display = "none";		
				}
				
			}
			
			// 앞에 순서 번호 넣기
			let child = document.getElementById("htable-body").children;
	    	var cnt = 0;
	    	for (let i = 0; i < child.length; i++) {
	    		// 순서
				child[i].children[0].innerHTML = i+1;
	    		
	    		// 일수가 1일 이상이면 소숫점 없애기
				let intext = child[i].children[5].innerText;
	    		if(intext >= 1){
	    			let date1 = intext.split('.');
	    			child[i].children[5].innerHTML = date1[0];	
	    		}
	    		
	    		let status = child[i].children[7];
	    		if(status.innerText == "요청중"){
	    			child[i].children[7].style.color = "#2196f3";	
	    		}
	    		
	    	}
		
	    	
			
	    });
	    
	    var prev = document.getElementById("prev");
		var next = document.getElementById("next");
		
		prev.addEventListener("click",function(){
			var page1 = page-1;
			if(page1 <= 0){
				page1 = 1;
			}
			location.href="${pageContext.request.contextPath}/Holiday?page="+page1+"&&year="+year;
		});
		next.addEventListener("click",function(){
			var page1 = page+1;
			if(page1 >= Math.ceil(size/10)){
				page1 = Math.ceil(size/10);
			}
			location.href="${pageContext.request.contextPath}/Holiday?page="+page1+"&&year="+year;
		});
		
		
		
	    
		document.getElementById("apply-holiday").addEventListener("click",function(){
			document.getElementById("applypop").style.display = "flex";
		});
		
			
		
		function OnChange(){    
			let year = document.getElementById("sortingYear").value;
	    	location.href="${pageContext.request.contextPath}/Holiday?page=1&&year="+year;
	    };
	    
	    
// 	    let Ltype1 ="연차";
	    function TypeChange(){	
	    	let Ltype = document.getElementById("leaveType").value;
	    	let halfType = document.getElementById("halfType");
	    	let end = document.getElementsByClassName("end-cal");
	    	if(Ltype == "반차"){
	    		halfType.style.display = "flex";
	    		end[0].style.visibility = "hidden";
	    		end[1].style.visibility = "hidden";
	    		end[1].removeAttribute('required');	
	    		end[1].value = "0";
	    	}
	    	if(Ltype == "연차"){
	    		halfType.style.display = "none";
	    		end[0].style.visibility = "visible";
	    		end[1].style.visibility = "visible";
	    		end[1].setAttribute('required', true);
	    	}
	    };
	    
	    // 휴가 신청 시작 날짜와 끝날짜를 오늘 이후로 신청하도록 alert 띄움
	    function SDateCheck(){
	    	
	    	let today = new Date();

	    	let year = today.getFullYear();
	    	let month = ('0' + (today.getMonth() + 1)).slice(-2);
	    	let day = ('0' + today.getDate()).slice(-2);
	    	let dateString = year + '-' + month  + '-' + day;
	    	
	    	let startDate = document.getElementById("leaveStartDate").value;
	    	if(dateString > startDate){
	    		alert("휴가 신청이 불가능한 날짜 입니다.");
	    		document.getElementById("leaveStartDate").value = dateString; 
	    	}
	    	
	    }
   		 function EDateCheck(){
	    	
	    	let today = new Date();

	    	let year = today.getFullYear();
	    	let month = ('0' + (today.getMonth() + 1)).slice(-2);
	    	let day = ('0' + today.getDate()).slice(-2);
	    	let dateString = year + '-' + month  + '-' + day;
	    	
	    	let startDate = document.getElementById("leaveStartDate").value;
	    	let endDate = document.getElementById("leaveEndDate").value;
	    	
	    	if(dateString > endDate || startDate > endDate ){
	    		alert("휴가 신청이 불가능한 날짜 입니다.");
	    		document.getElementById("leaveEndDate").value = startDate; 
	    	}
	    	
	    }
   		 let Htype = "오전";
 		function getMType() {
	 		Htype = "오전";
 		}
 		function getAType() {
	 		Htype = "오후";
 		}
 		
   		 document.getElementById("submit-btn").addEventListener("click",function(){
			let Ltype = document.getElementById("leaveType").value;
			let Stype = document.getElementById("leaveStartDate").value;
			let Etype = document.getElementById("leaveEndDate").value;
			
			let Ctype = document.getElementById("content").value;
			
   			let section = document.getElementsByClassName("modal-section");
			
   			if(Ltype == "연차"){
   				if(Stype != ""  && Etype != "" && Ctype != ""){
   		   			section[0].style.display = "block";
   		   			document.getElementById("real-submit-message").innerHTML = Stype+" ~ "+Etype+"<br> 휴가를 신청하시겠습니까?";
	   			}else{
					section[0].style.display = "none";	
					document.getElementById("real-submit-btn").click();
	   			}
   			}else if(Ltype == "반차"){
   				
		   		if(Stype != "" && Ctype != "" && Htype != ""){
		   			section[0].style.display = "block";
   		   			document.getElementById("real-submit-message").innerHTML = Stype+"의 "+Htype+"반차를 신청하시겠습니까?";	
   				}else{
					section[0].style.display = "none";	
					document.getElementById("real-submit-btn").click();
	   			}
   			}
 	     
   		 });
   		 
   		 document.getElementById("btn_ok").addEventListener("click",function(){
 		 	document.getElementById("real-submit-btn").click();   				 
 		 });
 	     document.getElementById("btn_cancle").addEventListener("click",function(){
 	    	document.getElementsByClassName("modal-section")[0].style.display = "none";
 		 });
 	    
 	   	
 	     
 	     
 	 // 비동기로 상세보기 가져옴
 	 for (let k = 1; k <= size; k++) {
 		document.getElementById("atag"+k).addEventListener("click",function(){
 			document.getElementById("detailpop").style.display = "flex";
 		
			let classname = document.getElementById("atag"+k).className;
			let simple_data = {id:classname};
			
			fetch("${pageContext.request.contextPath}/holiday/detail",{
				method : "POST", // PUT, PATCH, DELETE
				headers : {"Content-Type" : "application/json"},
				body : JSON.stringify(simple_data)
			}).then(response => response.json())
		
			.then(data => {
// 				console.log("---------------------------")
// 				console.log(data.id)
// 				console.log(data.hwriteDate)
// 				console.log(data.htype)
// 				console.log(data.hstartDate)
// 				console.log(data.hendDate)
// 				console.log(data.hcontent)
// 				console.log(data.halfDay)
// 				console.log(data.approval)
// 				console.log(data.approvalDate) // 요청날자는 null 가능성 있음
// 				console.log(data.countDate)
// 				console.log(data.empno)
// 				console.log(data.totalHoliday)
				
// 				<div>휴가 신청일: <span id="pop-writeDate"></span></div>
// 				<div>휴가 종류: <span id="pop-htype"></span></div>
// 				<div>반차 종류: <span id="pop-halfDay"></span></div>
// 				<div>기간: <span id="pop-hstartDate"></span>~<span id="pop-hendDate"></span></div>
// 				<div>일수: <span id="pop-countDate"></span></div>
// 				<div>내용: <span id="pop-hcontent"></span></div>
// 				<div>처리 상태: <span id="pop-approval"></span></div>
// 				<div>결재일: <span id="pop-approvalDate"></span></div>

				document.getElementById("pop-writeDate").innerHTML=data.hwriteDate;
				document.getElementById("pop-htype").innerHTML=data.htype;
				document.getElementById("pop-halfDay").innerHTML=data.halfDay;
				document.getElementById("pop-hstartDate").innerHTML=data.hstartDate;
				document.getElementById("pop-hendDate").innerHTML=data.hendDate;
				document.getElementById("pop-countDate").innerHTML=data.countDate+"일";
				document.getElementById("pop-hcontent").innerHTML=data.hcontent;
				document.getElementById("pop-approval").innerHTML=data.approval;
				if(data.rejectionReason == null || data.rejectionReason == ""){
					document.getElementById("reject").style.visibility = "hidden";
				}else{
					document.getElementById("pop-rejection_reason").innerHTML=data.rejectionReason;
				}	
				if(data.approvalDate == null || data.approvalDate == ""){
					document.getElementById("pop-approvalDate").innerHTML="미확인";
				}else{
					document.getElementById("pop-approvalDate").innerHTML=data.approvalDate;
				}
			}).catch(error => {
				console.log("error");
			});
		});
 	 }			
	</script>
</body>
</html>

