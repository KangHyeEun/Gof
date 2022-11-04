<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/login/style.css">
<title>Insert title here</title>
<style type="text/css">
	
</style>
</head>
<body>
	<div class="wrapper fadeInDown">
		<div class="container">
		<img src="${pageContext.request.contextPath}/resources/imges/logo-white.png" class="login-logo"/>
			<div id="formContent">
				<!-- Tabs Titles -->
				<h2 class="active">LOGIN</h2>
				
				<!-- Login Form -->
				<form:form modelAttribute="personalInfoVO" action="${pageContext.request.contextPath}/login" method="post" name="loginForm">
					<p>아이디</p>
					<form:input path="empno" placeholder="아이디를 입력하세요" id="empno" value="220204"/>
					<p>패스워드</p>
					<form:password path="password" placeholder="패스워드를 입력하세요" id="pw" value="abc6"/>
					<button id="checkPW">Log in</button>
				</form:form>
			</div>
			<div class="emptydiv"></div>
		</div>
		
	</div>

	<div class="modal">
		<div id="formContent">
			<div class="modal-header">
				<div>
					<h3 class="active">비밀번호 변경</h3>
				</div>
				<div>
					<h5 class="close-button">X</h5>
				</div>
			</div>
			<form action="${pageContext.request.contextPath}/resetPassword" method="post" id="modal-form" name="modal-form">
				<label for="text">아이디:</label><input type="text" name="empno_id" id="empno_id"><br />
				<label for="text">현재 비밀번호:</label><input type="text" name="nowPW" id="nowPW"><br />
				<label for="text">새 비밀번호:</label><input type="password" name="newPW" id="newPW" placeholder="영문자+숫자+특수문자 조합 8~25자리"><br />
				<button id="submit">비밀번호 바꾸기</button>
			</form>
		</div>
	</div>
</body>

<!-- 신규 사원 비밀번호 변경 유도 -->
<script type="text/javascript">
window.addEventListener("DOMContentLoaded",function(){
	document.querySelector(".modal").style.display = "none";
});
 
document.getElementById("checkPW").addEventListener("click", function(e){
    let empno = document.querySelector('#empno').value;
    let pw = document.querySelector('#pw').value;
    if(pw == 'abc1') {
    	e.preventDefault();
		alert("초기 비밀번호를 변경해주세요.");
   		// 모달창 띄우기
    	document.querySelector(".modal").style.display = "flex";
    	document.querySelector("#empno_id").value = empno;
 	  	return false;
	}else if(empno == "" || empno == 0){
		e.preventDefault();
		alert("아이디를 입력하세요.");
		loginForm.empno.focus();
		return false;
	}else if(pw == "" || pw == 0){
		e.preventDefault();
		loginForm.pw.focus();
		alert("비밀번호를 입력하세요");
		return false;
	}else{
		alert("환영합니다.");
		$("#checkPW").submit();
	}
 });
 
 document.querySelector(".close-button").addEventListener("click", function(){
	 document.querySelector(".modal").style.display = "none";
 });
 
 //비밀번호 변경 조건
 document.querySelector("#submit").addEventListener("click", function(e){
    let newPW = document.querySelector('#newPW');
    //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
    let pwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
    
	if(newPW.value =="" || newPW.value == 0){
		e.preventDefault();
		alert("새 비밀번호를 입력해주세요.(영문자+숫자+특수문자 조합으로 8~25자리)");
		newPW.focus();
		return false;
	}else if(!pwCheck.test(newPW.value)){
		e.preventDefault();
		alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
		newPW.focus();
		return false;
	}else{
		alert("비밀번호가 성공적으로 변경되었습니다.");
		$("#submit").submit();
	}

 });
 

    
    
  </script>
</html>