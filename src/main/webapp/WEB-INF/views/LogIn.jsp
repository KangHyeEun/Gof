<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/login/style.css">
<title>Insert title here</title>
</head>
<body>
    <div class="wrapper fadeInDown">
        <div id="formContent">
            <!-- Tabs Titles -->
            <h2 class="active"> 로그인 </h2>

            <!-- Login Form -->
            <form:form modelAttribute="personalInfoVO" action="${pageContext.request.contextPath}/login" method="post">
                <form:input path="empno" value="220204" placeholder="아이디를 입력하세요"/>
                <form:password path="password" value="abc6" placeholder="패스워드를 입력하세요"/>
                <button>Log in</button>
            </form:form>
            
        </div>
    </div>
</body>

</html>