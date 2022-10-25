<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./include/menu.jsp"></jsp:include>     
	<h1>시작페이지</h1>
	<a href="${pageContext.request.contextPath}/MoveToHome">홈 이동</a><br>
	<a href="${pageContext.request.contextPath}/Commuting">가빈이동</a><br>
	<a href="${pageContext.request.contextPath}/template">템플릿 이동</a><br>
	<a href="${pageContext.request.contextPath}/bbstemplate">게시판 템플릿 이동</a><br>
	<hr>
	
	<a href="${pageContext.request.contextPath }/calendar">Calendar 이동</a>

<hr>
	<a href="${pageContext.request.contextPath}/admin">혜은이동</a>
	
	<hr>
	<a href="${pageContext.request.contextPath}/message"> 지영 - 받은 쪽지함</a>
	
	<a href="${pageContext.request.contextPath}/message/message2">지영 - 보낸 쪽지함</a>
</body>
</html>
