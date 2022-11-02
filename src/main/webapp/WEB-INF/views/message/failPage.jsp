<%@page import="com.awoo.vo.MessageVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main.css">

<title>Insert title here</title>
<style>

</style>
</head>
<body>

	<div class="container-wrap">
		<div class="header">
			<div class="navbar__toogleBtn" id="mobile-btn">☰</div>
			<img src="${pageContext.request.contextPath}/resources/imges/logo.PNG"/>
            <div class="header-logout">	<a href="${pageContext.request.contextPath}/logout">로그아웃</a> </div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner-bbs">
				<div class="inner-div-bbs">
					<h3 class="sub-title">보내기 실패</h3> 
						<div class="wrap">
					      <div class="container">
					        <div class="heading">
					          <span class="big-message"> no    THANK YOU!</span>
					        </div>
					        <div class="img-container">
					          <img src="img/thankyou.png" alt="thankyou-image">
					        </div>
					        <div class="content-div">
					            <p class="content">Your submission has been received. We will reply soon!</p>
					            <p class="content"><a href="#">Back to previous page</a></p>
					        </div>
					      </div>
					    </div>
					
				</div>
			</div>
		</div>
	</div>
	
	<script>
	
	</script>
</body>
</html>