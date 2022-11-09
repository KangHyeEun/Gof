<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.error-wrapper{
    width: 100%;
    height: 90vh;
    heigth: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
	}
</style>
</head>
<body>
	<div class="error-wrapper">
		<img src="${pageContext.request.contextPath}/resources/imges/404error.jpg">
	</div>
</body>
</html>