<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main.css">
<title>Insert title here</title>
<style>
#table1 {
	text-align: center;
}

th, td {
	padding: 7px;
}

tr:nth-child(odd) {
	background-color: #f8f8f9;
}

th {
	background-color: #eaf6f7;
}

#table1 {
	width: 100%;
}

a {
	color: black;
}

.scroll {
	padding: -10px;
}

.scroll::-webkit-scrollbar {
	width: 10px;
}

.scroll::-webkit-scrollbar-thumb {
	background-color: #f2f4f5;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

.scroll::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}

.intro {
	display: flex;
	justify-content: space-between;
	padding-bottom: 4%;
}

.intro>p {
	color: #c0c5c9;
}

.intro {
	display: flex;
	justify-content: space-between;
	padding-bottom: 2%;
}

.intro>p {
	color: #c0c5c9;
}

#note_bt {
	margin-top: 15px;
}

#note_bt ul li {
	float: left;
	margin-left: 100px;
}

#return {
	padding: 10px 20px 10px 20px;
	background: #272454;
	border: 0;
	color: white;
	font-size: 12px;
	border-radius: 5px;
	margin-right: -170px;
	margin-top: 20px;
}

#return:hover {
	background: #08298A;
	color: white;
}

#return a {
	color: white;
}
</style>


</head>
<body>

	<div class="container-wrap">
		<div class="header">
		<div class="navbar__toogleBtn" id="mobile-btn">☰</div>
			<img src="${pageContext.request.contextPath}/imges/logo.PNG" />
			<div class="header-logout">로그아웃 버튼</div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner-bbs">
				<div class="inner-div-bbs">
					<c:forEach var="item" items="${list}">
					
							<div class="header1">
								<h4>제목 :</h4>
								<h4>${item.mtitle}</h4>
							</div>
							<div class="main1">
							    <h4>내용 :</h4>
								<p>${item.mcontent}</p>
							</div>
						</c:forEach>
						<div class="footer1">
							<button id="return">뒤로가기</button>
						</div>
					</div>


					<script type="text/javascript">
    	document.getElementById("return").addEventListener("click",function(){
    		location.href = "${pageContext.request.contextPath}/message/message1";
    	});
    </script>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>