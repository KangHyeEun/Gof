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
<style type="text/css">
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

#wri_m_bt {
	padding: 10px 20px 10px 20px;
	background: #272454;
	border: 0;
	color: white;
	font-size: 12px;
	border-radius: 5px;
	margin-right: -170px;
}

#wri_m_bt:hover {
	background: #08298A;
	color: white;
}

#wri_m_bt a {
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
					<!-- 각자 필요한 부분 넣기 -->
					<div class="intro">
						<h1>보낸 쪽지함</h1>
					</div>
					<div class="scroll"
						style="overflow: auto; width: 100%; height: 350px;">
						<table id="table1">

							<thead>
								<tr>
									<th><input type="checkbox" onclick="checkAll()"
										name="allCheck" id="allCheck" /></th>
									<th>NO.</th>
									<th>보낸사람</th>
									<th>제목</th>
									<th>날짜</th>
									<th>받는사람</th>
								</tr>
							</thead>
							<tbody id="table-body">
								<c:forEach var="item" items="${list}">
									<tr>
										<td><input type="checkbox" name="RowCheck" id="chkObj"
											value="${item.id}"></td>
										<td>${item.id}</td>
										<td>${item.mowner}</td>
										<td><a
											href="${pageContext.request.contextPath}/message/content">${item.mtitle}</a></td>
										<td>${item.createDate}</td>
										<td>${item.mreciever}</td>
									</tr>

								</c:forEach>

							</tbody>

						</table>

						<!--  	<script>s
					
					$('#delBtn')Click(function){
						if($("input:checkbox[name='chk_list']:checked").length === 0);
							return;
					}
					
					$("input:checkbox[name='chk_list']:checked").each(function(k,kval){
						console.log("Kval :: " , kVal.parentElment.parentElement.parentElement);
					})	let a = kVal.parentElen
					</script> -->


						<!--쪽지 삭제 @PostMapping("result8") 테스트 -->

						<form action="${pageContext.request.contextPath}/message/result8"
							method="get">
							<label for="id"></label> <input type="text" name="id" id="id" />
							<button id="wri_m_bt">삭제</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>