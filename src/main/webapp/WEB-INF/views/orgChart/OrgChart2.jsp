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
							<h3>조직도</h3>
							<p>⏏홈>조직도</p>
						</div>
						<form action="${pageContext.request.contextPath}/orgChart/details"
							method="post">
							<div class="div1">
								<h4>
									<img src="${pageContext.request.contextPath}/imges/admin2.png"
										class="timg2" />직원 상세 검색
								</h4>
								<div class="selectD" style="height: 40px;">
									<select name="edepartment" id="category">
										<option value="">부서 선택</option>
										<option value="영업">영업</option>
										<option value="마켓팅">마켓팅</option>
										<option value="개발">개발</option>
										<option value="인사">인사</option>
										<option value="회계">회계</option>
									</select> <select name="eposition" id="category">
										<option value="">직책 선택</option>
										<option value="부장">부장</option>
										<option value="대리">대리</option>
										<option value="사원">사원</option>
										<option value="수습">수습</option>
										<option value="팀장">팀장</option>
									</select>
										<input type="text" name="name" id="category" placeholder="이름 검색"/>
									<button class="btn1">검색하기</button>
								</div>
							</div>
						</form>
					</div>
					<div class="table" style="width: 100%;">
						<h4>
							<img src="${pageContext.request.contextPath}/imges/total.png"
								class="timg" />총 <span>${count}</span>명
						</h4>
							<div id="EpTable">
								<div class="scroll">
									<table id="table1" class="table1">
										<tr>
											<th>부서</th>
											<th>직책</th>
											<th>이름</th>
											<th>전화번호</th>
											<th style="width: 20%;">이메일</th>
										</tr>
										<c:forEach var="i" items="${list}" begin="${startPage}"
											end="${endPage}">
											<tr>
												<td>${i.edepartment}</td>
												<td>${i.eposition}</td>
												<td>${i.name}</td>
												<td>${i.phoneNumber}</td>
												<td>${i.email}</td>
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
														href="${pageContext.request.contextPath}/orgChart/paging/${nowPage-1}">◀</a>
												</div>
											</c:otherwise>
										</c:choose>
										<c:forEach begin="1" end="${page+1}" varStatus="status">
											<c:choose>
												<c:when test="${status.count eq nowPage}">
													<div class="num checked">
														<a href="${pageContext.request.contextPath}/orgChart/paging/${status.count}" style="color: white;">${status.count}</a>
													</div>
												</c:when>
												<c:otherwise>
													<div class="num notchecked">
														<a href="${pageContext.request.contextPath}/orgChart/paging/${status.count}">${status.count}</a>
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
														href="${pageContext.request.contextPath}/orgChart/paging/${nowPage+1}">▶</a>
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