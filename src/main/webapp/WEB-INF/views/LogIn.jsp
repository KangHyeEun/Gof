<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/login/style.css">
<title>Insert title here</title>
<style type="text/css">
* {
    box-sizing: border-box;
}

*:focus {
    outline: none;
}

body {
    font-family: sans-serif;
    height: 97vh;
}

h2 {
    text-align: center;
    font-size: 16px;
    font-weight: 600;
    display: inline-block;
    margin: 40px 8px 10px 8px;
    color: black;
    border-bottom: 2px solid #5fbae9;
}

/* 구조 */

.wrapper {
    display: flex;
    align-items: center;
    flex-direction: column;
    justify-content: center;
    width: 100%;
    min-height: 100%;
    padding: 20px;
}

#formContent {
    border : 1px solid black;
    border-radius: 10px 10px 10px 10px;
    background: #fff;
    width: 90%;
    max-width: 450px;
    position: relative;
    padding: 0px;
    text-align: center;
}
/* 폼 디자인 */
button {
    background-color: #56baed;
    border: none;
    color: white;
    padding: 15px 80px;
    text-align: center;
    font-size: 13px;
    box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
    border-radius: 5px 5px 5px 5px;
    margin: 5px 20px 40px 20px;
    transition: all 0.3s ease-in-out;
}

input {
    background-color: #f6f6f6;
    color: #0d0d0d;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 5px;
    width: 85%;
    border: 2px solid #f6f6f6;
    transition: all 0.5s ease-in-out;
    border-radius: 5px 5px 5px 5px;
}

input:focus {
    background-color: #fff;
    border-bottom: 2px solid #5fbae9;
}
.modal {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.2);
	z-index: 999;
	display: none;
	justify-content: center;
	align-items: center;
}
.modal-content {
	box-sizing: border-box;
	width: 25%;
	height: 50%;
	background: white;
	z-index: 100;
	border-radius: 10px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
.close-button {
	justify-content: right;
	width: 1.5rem;
	line-height: 1.5rem;
	text-align: center;
	cursor: pointer;
	border-radius: 0.25rem;
	background-color: lightgray;
}

</style>
</head>
<body>
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->
			<h2 class="active">로그인</h2>

			<!-- Login Form -->
			<form:form modelAttribute="personalInfoVO" action="${pageContext.request.contextPath}/login" method="post" name="loginForm">
				<form:input path="empno" placeholder="아이디를 입력하세요" id="empno" value="220701"/>
				<form:password path="password" placeholder="패스워드를 입력하세요" id="pw" value="abc7"/>
				<button id="checkPW">Log in</button>
			</form:form>
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