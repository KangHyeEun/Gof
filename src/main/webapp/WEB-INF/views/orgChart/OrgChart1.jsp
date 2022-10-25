<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main.css">
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/orgChart.css"> --%>
<title>Insert title here</title>
<style type="text/css">
.org {
	width: 100%;
	padding-bottom: 2%;
	margin-bottom: 2%;
}

.org_inner {
	border-bottom: 1px solid black;
	width: 100%;
	display: flex;
	align-items: center;
	padding-bottom: 2%;
	margin-bottom: 2%;
}

.org1 {
	width: 100%;
	display: flex;
	flex-direction: row;
	overflow-x: auto;
	white-space: nowrap;
	font-size: 0
}

.org1-1 {
	border-left: 3px solid #14abab;
	padding-left: 1%;
	margin-top: 1%;
    margin-bottom: 2%;
}

.org1-main {
	border: 1px solid black;
	min-width: 250px;
	max-width: 250px;
    height: 20vh;
	border-radius: 20px;
	padding: 1%;
	display: flex;
	align-items: center;
	margin-right: 1%;
}

.org1-img {
	flex: 1;
	width: 140px;
	height: 75%;
/* 	border: 1px solid black; */
	border-radius: 50px;
	margin-right: 5%;
	background: url("${pageContext.request.contextPath}/imges/user.png") no-repeat;
	background-size: cover;
}

.org1-content {
	font-size: 0.8px;
    width: 50%;
    white-space: pre-line;
    font-weight: bold;
}
</style>
</head>
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
					<!-- ------------------------------------------------------------------------------------------- -->
					<div class="org">
						<div class="org_inner">
							<h2>조직도</h2>
							<p>Organization chart</p>
						</div>
						<h3>전체 ${count}명</h3>
						<c:forEach var="i" items="${edepartment}">
							<div class="org1-1">
								<h4>${i.edepartment}</h4>
							</div>
							<div class="org1">
								<c:forEach var="j" items="${list}">
								<c:if test="${i.edepartment eq j.edepartment}">
									<div class="org1-main">
										<div class="org1-img"></div>
										<div class="org1-content">
											<p>이름 : ${j.name}(${j.eposition})</p>
											<p>번호 : ${j.phoneNumber}</p>
											<p>이메일 : ${j.email}</p>
										</div>
									</div>
								</c:if>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
					<!-- --------------------------------------------------------------------------------------------- -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>