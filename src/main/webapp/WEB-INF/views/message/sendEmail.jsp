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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/holiday/style.css">

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
					<h3 class="sub-title">여기는 이메일 수정중 수정중 수정중</h3>
						<form action="WebSendMail" method="post" enctype="multipart/form-data"> 
<!-- 						<form action="WebSendMail" method="post" enctype="multipart/form-data"> -->
							<table border="1" cellpadding="0" cellspacing="0">
							<tr>
							   <td>from</td>
							   <td><input type="text" name="from" size="40"></td>
							</tr>
							<tr>
							   <td>keyPassword</td>
							   <td><input type="text" name="keyPassword" size="40"></td>
							</tr>
							<tr>
							   <td>sendTo</td>
							   <td><input type="text" name="sendTo" size="40"></td>
							</tr>
							<tr>
							   <td>Title</td>
							   <td><input type="text" name="subject" size="40"></td>
							</tr>
							<tr>
							   <td>Content</td>
							   <td><textarea name="body" rows="10" cols="40"></textarea></td>
							</tr>
							<tr>
							   <td>File</td>
							   <td><input type="file" name="attachment"></td>
							</tr>
							<tr>
							   <td colspan="2"><input type="submit" value="Submit"></td>
							</tr>
							</table>
						</form>
	
					<button type="button" id="btn1"> 비밀번호 수정 </button>
					
			
				</div>
			</div>
		
					<div id="applypop">
						<div class="pop-container">
							<form action="${pageContext.request.contextPath}/updateEmail" method="post">
								<div class="pop1">
									<div class="pop-titleContainer">
										<span class="pop-title">구글 이메일 로그인</span>
									</div>
									<div>
										<a id="cancle">✖️</a>
									</div>
								</div>
								<div class="pop1-1">
									<div class="count-nums">
										<span>구글 계정 아이디와 2단계 인증된 비밀번호를 입력하여주세요</span>
									</div>
									<div class="pop2">
										<label for="from">아이디 : </label><input type="text" name="email_id" id="email_id" size="40">
										<label for="keyPassword">비밀번호 : </label><input type="text" name="email_password" id="email_password" size="40">
									</div>
									<div class="pop5">
										<button id="submit-btn" type="submit">로그인</button>
		<!-- 								<button type="submit" id="real-submit-btn" style="display: none">신청하기</button> -->
									</div>
								</div>
							</form>
						</div>
				
<!-- 		        <section class="modal modal-section type-confirm" id="confirm-block"> -->
<!-- 		            <div class="enroll_box"> -->
<!-- 		                <p class="menu_msg" id="real-submit-message">휴가를 신청하시겠습니까?</p> -->
<!-- 		            </div> -->
<!-- 		            <div class="enroll_btn"> -->
<!-- 		                <button class="btn pink_btn btn_ok" id="btn_ok">확인</button> -->
<!-- 		                <button class="btn gray_btn modal_close" id="btn_cancle">취소</button> -->
<!-- 		            </div> -->
<!-- 		        </section> -->
		        
		        
			</div>
		</div>
	</div>
	
	
	
	<script>
		document.getElementById("btn1").addEventListener("click",function(){
			
			document.getElementById("applypop").style.display = "flex";
			
		});
	</script>
</body>
</html>