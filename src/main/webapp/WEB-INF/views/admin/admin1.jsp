<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/admin1.css">
<title>Insert title here</title>
<style type="text/css">
	.intro {
	display: flex;
	justify-content: space-between;
	padding-bottom: 2%;
}

.intro>p {
	color: #c0c5c9;
}
</style>
</head>
<body>

	<div class="container-wrap">
		<div class="header">
			<img src="${pageContext.request.contextPath}/imges/logo.PNG" />
			<div class="header-logout">로그아웃 버튼</div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner-bbs">
				<div class="inner-div-bbs">
					<div class="select">
						<div class="intro">
							<h3>직원 정보 관리</h3>
							<p>⏏홈>관리자>인사관리</p>
						</div>
						<form action="${pageContext.request.contextPath}/">
							<div calss="div1">
								<h4>
									<img src="${pageContext.request.contextPath}/imges/admin2.png"
										class="timg2" />직원 상세 검색
								</h4>
								<div class="selectD">
									<select name="category" id="category">
										<option value="name">이름</option>
									</select> 
									<input type="text" name="sel" id="sel" size="85%">
									<button class="btn1">검색하기</button>
								</div>
							</div>
						</form>
					</div>
					<div class="table" style="width : 100%">
						<h4>
							<img src="${pageContext.request.contextPath}/imges/total.png"
								class="timg" />총 <span>10</span>명
						</h4>
						<form action="${pageContext.request.contextPath}/update">
							<div id="EpTable">
								<div class="tbtn1">
									<button id="update">선택 직원 정보 수정</button>
									<button id="newEp" type="button">신규 직원 등록</button>
								</div>
								<div class="scroll"
									style="overflow: auto; width: 100%; height: 350px;">
									<table id="table1" >
										<tr>
											<th><input type="checkbox" name="" id=""></th>
											<th>No.</th>
											<th>이름</th>
											<th>사원번호</th>
											<th>부서</th>
											<th>직책</th>
											<th>입사일</th>
											<th>고용형태</th>
											<th>총 연차 수</th>
											<th>재직 상태</th>
											<th>상세보기</th>
										</tr>
										<c:forEach var="i" items="${list}">
											<tr>
												<td><input type="checkbox" name="" id=""
													value="${i.id}"></td>
												<td>${i.id}</td>
												<td>${i.name}</td>
												<td>${i.empno}</td>
												<td>${i.edepartment}</td>
												<td>${i.eposition}</td>
												<td>${i.ehiredDate}</td>
												<td>${i.estatus}</td>
												<td>${i.totalHoliday}</td>
												<td>${i.estatus}</td>
												<td><a
													href="${pageContext.request.contextPath}/detail/${i.id}">상세보기</a></td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		document.getElementById("newEp").addEventListener("click", function() {
			location.href = "${pageContext.request.contextPath}/newE";
		});
	</script>

</body>
</html>