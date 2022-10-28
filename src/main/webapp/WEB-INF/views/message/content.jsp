<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
<title>Insert title here</title>
<style>
.container1 {
	margin-top: 10px;
	
}

}
.head {
	
	width: 600px;
	margin-top: 10px;
}

.main2 {
	border: 1px solid black;
	background-color: #eaf6f7;
	margin-top: 15px;
	width: 600px;
	height: 50px;
	border-radius: 7px;
}

.main1 {
	border: 1px solid black;
	background-color: #eaf6f7;
	margin-top: 20px;
	width: 600px;
	height: 600px;
	border-radius: 7px;
}

#return {
	margin-top: 30px;
	padding: 15px 35px 15px 35px;
	background: #272454;
	border: 0;
	color: white;
	font-size: 15px;
	border-radius: 5px;
	margin-right: -10px;
	text-aline: center;
}

#delete {
	margin-top: 30px;
	padding: 10px 30px 10px 30px;
	background: #272454;
	border: 0;
	color: white;
	font-size: 12px;
	border-radius: 5px;
	margin-right: -170px;
	text-aline: center;
}

h2 {
	background-color: #eaf6f7;
	width: 600px;
	height: 50px;
	border: 1px solid black;
	margin-top: 30px;
	border-radius: 5px;
}




</style>



</head>
<body>

	<div class="container-wrap">
		<div class="header">
			<div class="navbar__toogleBtn" id="mobile-btn">☰</div>
			<img src="${pageContext.request.contextPath}/imges/logo.PNG" />
			<div class="header-logout"><a href="${pageContext.request.contextPath}/logout">로그아웃</a> </div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner-bbs">
				<div class="inner-div-bbs">
					<!-- 각자 필요한 부분 넣기 -->
					<div class="container1">
						<h1>상세 받은 쪽지함</h1>
					</div>
					<div class="head">
						<h2>제목 : ${messageVO.mtitle}</h2>
					</div>
					<div class="main2">
						<h3>보낸이 : ${messageVO.mreciever}</h3>
					</div>

					<div class="main1">
						<h3>
							내용 : <br /> ${messageVO.mcontent}
						</h3>
					</div>
					<div class="footer1">
						<button id="return">뒤로가기</button>

					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		document
				.getElementById("return")
				.addEventListener(
						"click",
						function() {
							location.href = "${pageContext.request.contextPath}/message/message1";
						});
	</script>

</body>
</html>