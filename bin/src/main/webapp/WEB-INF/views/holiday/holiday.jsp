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
									<th>반차 종류</th>
									<th>기간</th>
<!-- 									<th>종료일</th> -->
									<th>내용</th>
									<th>처리 상태</th>
									<th>결재일</th>
									<th>totalHoliday</th>
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
<%-- 										<td>${hl.hendDate}</td> --%>
										<td>${hl.hcontent}</td>
										<td>${hl.approval}</td>
										<td>${hl.approvalDate != null ? hl.approvalDate : "-"}</td>
										<td>${hl.totalHoliday}</td>
									</tr>
								</c:forEach>
							</tbody>	
						</table>
					</div>
					<div class="select">
						<div class="num"><a id="prev">◀</a></div>
							<c:forEach begin="1" end="${holidayList.size() == 0? 1 : holidayList.size()%10 == 0? holidayList.size()/10 :((holidayList.size()/10)+(1-((holidayList.size()/10)%1))%1)}" varStatus="status">
								<c:choose>
									<c:when test="${param.page eq status.count}">
										<div class="num checked"><span>${status.count}</span></div>
									</c:when>
									<c:otherwise>				
										<div class="num notchecked"><a href="Holiday?page=${status.count}&&year=${param.year}">${status.count}</a></div>							
									</c:otherwise>
								</c:choose>
							</c:forEach>
						<div class="num"><a id="next">▶</a></div>
					</div>
				</div>

				<!-- 	</div> -->


			</div>
<!-- 			<div id="applypop" style="display: none"> -->
			<div id="applypop">
				<div class="pop-container">
					<form action="${pageContext.request.contextPath}/ApplyHoliday" class="pop-form" method="get">
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
										<input type="date" placeholder="시작일 년/월/일" name="leaveStartDate" id="leaveStartDate" required />
										<span>~</span> 
										<input type="date" placeholder="종료일 년/월/일" name="leaveEndDate" id="leaveEndDate" required />
									</div>
								</div>
							</div>
							<div class="halfType" id="halfType" >
								<p class="p"><span class="important">*</span>반차</p>
								<div class="select-halfType">
<!-- 									<div id="morning-off">09:00~01:30</div> -->
<!-- 									<div id="afternoon-off">02:30~06:00</div> -->
									<input id="input1" type="radio" value="오전" name="halfType" checked="checked"/><label for="input1" id="morning-off">09:00~01:30</label>
									<input id="input2" type="radio" value="오후" name="halfType"/><label for="input2" id="afternoon-off">02:30~06:00</label>
								</div>
							</div>
							<div class="pop2-3">
								<div class="pop4">
									<p class="p"><span class="important">*</span>신청사유</p>
									<input type="text" placeholder="내용을 입력해주세요" name="content" id="content" required />
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
		let size = ${holidayList.size()};
		let page = ${param.page};
		let year = ${param.year};
	
	    document.addEventListener("DOMContentLoaded", function(){
			// 페이지 이동
			for (var i = 0; i < size; i++) {
				if(i+1 > 10*page || i+1 <= 10*(page-1)){
					document.getElementById("tr"+(i+1)).style.display = "none";		
				}
			}
			
			
			let child = document.getElementById("htable-body").children;
	    	var cnt = 0;
	    	for (let i = 0; i < child.length; i++) {
	    		// 순서
				child[i].children[0].innerHTML = i+1;
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
	    	location.href="${pageContext.request.contextPath}/Holiday?page="+page+"&&year="+year;
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
	    };
	    

	</script>
</body>
</html>

