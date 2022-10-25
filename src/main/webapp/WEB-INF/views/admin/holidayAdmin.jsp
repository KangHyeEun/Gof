<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/orgChart/orgChart.css">
<title>Insert title here</title>
<style type="text/css">
	input{
		border-radius: 0;
	}
	.req {
		border: 1px solid #2196f3;
		border-radius: 30px;
		color: #2196f3;
		background-color: white;
	}
	.req1 {
		border: 1px solid red;
		border-radius: 30px;
		color: red;
		background-color: white;
	}
	.rbtn1 {
		background-color: white;
		border: 1px solid #b8bfc4;
		color: #b8bfc4;
		border-radius: 5px;
		width: 50px;
		cursor: pointer;
	}
	.rbtn2 {
		background-color: #2196f3;
		border: 1px solid #2196f3;
		color: white;
		border-radius: 5px;
		width: 50px;
		cursor: pointer;
	}
</style>
</head>
<body>
	<div class="container-wrap">
		<div class="header">
			<img src="${pageContext.request.contextPath}/imges/logo.PNG" />
			<div class="header-logout">로그아웃 버튼</div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner-bbs">
				<div class="inner-div-bbs">
					<div class="select">
						<div class="intro">
						<fmt:parseNumber var="page" value="${count/10}"
											integerOnly="true" />
							<h3>휴가 신청 관리</h3>
							<p>⏏홈>휴가 신청</p>
						</div>
						<form action="${pageContext.request.contextPath}/orgChart/details"
							method="post">
							<div class="div1">
								<div class="selectD" style="height: 40px;">
								<select name="edepartment" id="category">
										<option value="">년도</option>
									</select>
									<select name="edepartment" id="category">
										<option value="">휴가 종류</option>
										<option value="연차">연차</option>
										<option value="반차">반차</option>
									</select>
									<select name="edepartment" id="category">
										<option value="">부서</option>
										<option value="영업">영업</option>
										<option value="마켓팅">마켓팅</option>
										<option value="개발">개발</option>
										<option value="인사">인사</option>
										<option value="회계">회계</option>
									</select>
									<button class="btn1">검색하기</button>
								</div>
							</div>
						</form>
					</div>
					<div class="table" style="width: 100%;">
							<div id="EpTable">
								<div class="scroll">
									<table id="table1" class="table1">
										<tr>
											<th><input type="checkbox" name="" id="" /></th>
											<th>신청일</th>
											<th>이름</th>
											<th>유형</th>
											<th>종류</th>
											<th>기간</th>											
											<th>일수</th>											
											<th>내용</th>	
											<th></th>																					
											<th></th>																					
											<th></th>																					
										</tr>
										<c:forEach var="i" items="${list}" begin="${startPage}" 
										end="${endPage}"> 
											<tr>
												<td><input type="checkbox" name="" id="" /></td>
												<td>${i.hwriteDate}</td>
												<td>${i.huserName}(부서)</td>
												<c:choose>
													<c:when test="${i.approval eq '요청중'}">
														<td><div class="req">신청</div></td>
													</c:when>
													<c:otherwise>
														<td><div class="req1">${i.approval}</div></td>													
													</c:otherwise>
												</c:choose>
												<td>${i.htype}</td>
												<td>${i.hstartDate}~${i.hendDate}</td>
												<td>${i.countDate}</td>
												<td>${i.hcontent}</td>
												<td></td>
												<td></td>
												<td>
												<c:choose>
													<c:when test="${i.approval eq '요청중'}">
														<a class="rbtn1" href="${pageContext.request.contextPath}/holiday/No/${i.id}">반려</a>
														<a class="rbtn2" href="${pageContext.request.contextPath}/holiday/Ok/${i.id}?empno=${i.empno}&countDate=${i.countDate}">승인</a>
													</c:when>
													<c:when test="${i.approval eq '승인'}">
														${i.approvalDate}
													</c:when>
													<c:otherwise>
														반려 사유
													</c:otherwise>
												</c:choose>
												</td>
											</tr>
										</c:forEach>
									</table>

									<div class="paging">
										
										<c:choose>
											<c:when test="${nowPage == 1}">
												<span class="num" style="color: #272454;">◀</span>
											</c:when>
											<c:otherwise>
												<div class="num">
													<a id="prev"
														href="${pageContext.request.contextPath}/holiday/paging/${nowPage-1}">◀</a>
												</div>
											</c:otherwise>
										</c:choose>
										<c:forEach begin="1" end="${page+1}" varStatus="status">
											<c:choose>
												<c:when test="${status.count eq nowPage}">
													<div class="num checked">
														<a href="${pageContext.request.contextPath}/holiday/paging/${status.count}" style="color: white;">${status.count}</a>
													</div>
												</c:when>
												<c:otherwise>
													<div class="num notchecked">
														<a href="${pageContext.request.contextPath}/holiday/paging/${status.count}">${status.count}</a>
													</div>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:choose>
											<c:when test="${nowPage == page+1}">
												<span class="num" style="color: #272454;">▶</span>
											</c:when>
											<c:otherwise>
												<div class="num">
													<a id="next"
														href="${pageContext.request.contextPath}/holiday/paging/${nowPage+1}">▶</a>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
					</div>
					<!-- ------------------------------------------------------------------------------ -->
				</div>
			</div>
		</div>
	</div>

</body>
</html>