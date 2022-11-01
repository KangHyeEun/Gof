<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main.css">
<title>Insert title here</title>

</head>
<body>

	<div class="container-wrap">
		<div class="header">
			<div class="navbar__toogleBtn" id="mobile-btn">☰</div>
			<img src="${pageContext.request.contextPath}/resources/imges/logo.PNG"/>
            <div class="header-logout">로그아웃 버튼</div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner-bbs">
				<div class="inner-div-bbs">
					<div>
						<h1>부서 관리</h1>
						<button type="button">부서 등록</button>
					</div>
					<div>
						<table>
							<tr>
								<th>No.</th>
								<th>부서명</th>
								<th>사원수</th>
								<th></th>
							</tr>
							<c:forEach var="i" items="${list}">
								<tr>
									<td>${i.id}</td>
									<td><input type="text" name="department" id="department" value="${i.department}"/></td>
										<c:set var="loof_flag" value="false" />
										<c:forEach var="c" items="${count}">
										<c:choose>
											<c:when test="${i.department eq c.department}">
												<td>${c.count}</td>
												<td style="display: none;">0</td>
												<c:set var="loof_flag" value="true" />
											</c:when>
											<c:otherwise>
												<td style="display: none;">${c.count}</td>
												<td>0</td>
											</c:otherwise>											
										</c:choose> 
										</c:forEach>
									<td>
										<a href="#">수정</a>
										<a href="#">삭제</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
</body>
</html>