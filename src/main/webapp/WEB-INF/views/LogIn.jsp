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
		<div class="modal-content">
			<span class="close-button">&times;</span>
			<h3 class="title">비밀번호 변경</h3>
			<form action="${pageContext.request.contextPath}/resetPassword" method="post">
				<label for="text">아이디:</label><input type="text" name="empno_id" id="empno_id"><br />
				<label for="text">현재 비밀번호:</label><input type="text" name="nowPW" id="nowPW"><br />
				<label for="text">새 비밀번호:</label><input type="password" name="newPW" id="newPW"><br />
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
	 }else{
		return true;
	 } 
 });
 
 document.querySelector(".close-button").addEventListener("click", function(){
	 document.querySelector(".modal").style.display = "none";
 });
    
 document.querySelector("#submit").addEventListener("click", function(){
	 alert("비밀번호가 성공적으로 변경되었습니다.");
 });
 
//  width: 26%;
//  /* height: calc(100% - 60px); */
//  position: absolute;
//  background-color: #4c4c4c94;
//  /* display: flex; */
//  /* justify-content: center; */
//  align-items: center;
//  /* display: none; */
//  z-index: 100;
//  position: absolute;
//  top: 29%;
//  left: 37%;

/* //로그인 유효성 검사
//joinform_check 함수로 유효성 검사
function joinform_check() {
  //변수에 담아주기
  let empno = document.getElementById("empno");
  let pw = document.getElementById("pw");
  let rePW = document.getElementById("rePW");

  if (empno.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
    alert("아이디를 입력하세요.");
    empno.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
  };

  if (pw.value == "") {
    alert("비밀번호를 입력하세요.");
    pw.focus();
    return false;
  };

  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
  let pwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

  if (!pwCheck.test(pw.value)) {
    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
    pwd.focus();
    return false;
  };

  if (rePW.value !== pw.value) {
    alert("비밀번호가 일치하지 않습니다..");
    rePW.focus();
    return false;
  };

  //입력 값 전송
  document.loginForm.submit(); //유효성 검사의 포인트   
} */

    
    
  </script>
</html>