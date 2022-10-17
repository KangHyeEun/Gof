<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>시작페이지</h1>
	<a href="${pageContext.request.contextPath }/menu/menu.jsp">이동</a>
	<a href="${pageContext.request.contextPath }/test.jsp">test이동</a>
	<jsp:include page="./menu/menu.jsp"></jsp:include>
</body>
</html>