<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/orgChart/orgChart.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/admin1.css">
<title>Insert title here</title>
<style type="text/css">
input {
	border-radius: 0;
}

.req {
	border: 1px solid #2196f3;
	border-radius: 30px;
	color: #2196f3;
	background-color: white;
}

.req1 {
	border: 1px solid #16af0f;
	border-radius: 30px;
	color: #16af0f;
	background-color: white;
}

.req2 {
	border: 1px solid red;
	border-radius: 30px;
	color: red;
	background-color: white;
}

.rbtn1 {
	background-color: white;
	border: 1px solid #b8bfc4;
	color: #b8bfc4;
	border-radius: 5px;
	width: 50px;
	cursor: pointer;
}

.rbtn2 {
	background-color: #2196f3;
	border: 1px solid #2196f3;
	color: white;
	border-radius: 5px;
	width: 50px;
	cursor: pointer;
}

#rejec {
	width: 97%
}

.modal_wrap {
	width: 30%;
	height: 25%;
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
							<fmt:parseNumber var="page" value="${count/10}"
								integerOnly="true" />
							<h3>휴가 신청 관리</h3>
							<p>⏏홈>휴가 신청</p>
						</div>
						<form action="${pageContext.request.contextPath}/damin/holidayselect"
							method="post">
							<div class="div1">
								<div class="selectD" style="height: 40px;">
									<select name="hwriteDate" id="category">
										<option value="">전체 연도</option>
										<option value="2022">2022</option>
										<option value="2021">2021</option>
										<option value="2017">2017</option>
									</select> <select name="htype" id="category">
										<option value="">휴가 종류</option>
										<option value="연차">연차</option>
										<option value="반차">반차</option>
									</select> <select name="edepartment" id="category">
										<option value="">부서</option>
										<option value="영업">영업</option>
										<option value="마켓팅">마켓팅</option>
										<option value="개발">개발</option>
										<option value="인사">인사</option>
										<option value="회계">회계</option>
									</select>
									<button class="btn1">검색하기</button>
								</div>
							</div>
						</form>
					</div>

					<!-- 리스트 --------------------------------------------------------------------------------- -->
					<div class="table" style="width: 100%;">
						<div id="EpTable">
							<div class="scroll">
								<table id="table1" class="table1">
									<tr>
										<th>신청일</th>
										<th>이름</th>
										<th>유형</th>
										<th>종류</th>
										<th>기간</th>
										<th>일수</th>
										<th>내용</th>
										<th></th>
										<th></th>
										<th></th>
									</tr>
									<c:forEach var="i" items="${list}" begin="${startPage}"
										end="${endPage}">
										<tr>
											<td>${i.hwriteDate}</td>
										<c:set var="loof_flag" value="false"/>
										<c:forEach var="j" items="${depart}">
											<c:if test="${not loof_flag}">
											<c:choose>
												<c:when test="${i.empno eq j.empno}">
												<td>${i.huserName}(${j.edepartment})</td>	
													<c:set var="loof_flag" value="true"/>											
												</c:when>
											</c:choose>
											</c:if>
										</c:forEach>
											<c:choose>
												<c:when test="${i.approval eq '요청중'}">
													<td><div class="req">신청</div></td>
												</c:when>
												<c:when test="${i.approval eq '승인'}">
													<td><div class="req1">${i.approval}</div></td>
												</c:when>
												<c:otherwise>
													<td><div class="req2">${i.approval}</div></td>
												</c:otherwise>
											</c:choose>
											<td>${i.htype}</td>
											<td>${i.hstartDate}~${i.hendDate}</td>
											<td>${i.countDate}</td>
											<td>${i.hcontent}</td>
											<td></td>
											<td></td>
											<td><c:choose>
													<c:when test="${i.approval eq '요청중'}">
														<a class="rbtn1" id="modal_open">반려</a>
														<a class="rbtn2"
															href="${pageContext.request.contextPath}/holiday/Ok/${i.id}?empno=${i.empno}&countDate=${i.countDate}">승인</a>
														<!-- 모달창 -------------------------------------------------------------------------------- -->
														<form
															action="${pageContext.request.contextPath}/holiday/No/${i.id}">
															<div class="modal_dim" id="modal_dim">
																<div class="modal_wrap">
																	<div class="modal">
																		<div class="mdiv1">
																			<h4>반려 사유</h4>
																			<h5 id="exit">X</h5>
																		</div>
																		<div>
																			<input type="text" name="rejectionReason" id="rejec" />
																		</div>
																		<div class="bdiv">
																			<button class="mbutton">등록하기</button>
																		</div>
																	</div>
																</div>
															</div>
														</form>
													</c:when>
													<c:when test="${i.approval eq '승인'}">
														${i.approvalDate}
													</c:when>
													<c:when test="${i.approval eq '반려'}">
														${i.rejectionReason}
													</c:when>
												</c:choose></td>
										</tr>
										</c:forEach>
									
								</table>
								<!-- 페이지 처리 -->
								<div class="paging">

									<c:choose>
										<c:when test="${nowPage == 1}">
											<span class="num" style="color: #272454;">◀</span>
										</c:when>
										<c:otherwise>
											<div class="num">
												<a id="prev"
													href="${pageContext.request.contextPath}/holiday/paging/${nowPage-1}">◀</a>
											</div>
										</c:otherwise>
									</c:choose>
									<c:forEach begin="1" end="${page+1}" varStatus="status">
										<c:choose>
											<c:when test="${status.count eq nowPage}">
												<div class="num checked">
													<a
														href="${pageContext.request.contextPath}/holiday/paging/${status.count}"
														style="color: white;">${status.count}</a>
												</div>
											</c:when>
											<c:otherwise>
												<div class="num notchecked">
													<a
														href="${pageContext.request.contextPath}/holiday/paging/${status.count}">${status.count}</a>
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<c:choose>
										<c:when test="${nowPage == page+1}">
											<span class="num" style="color: #272454;">▶</span>
										</c:when>
										<c:otherwise>
											<div class="num">
												<a id="next"
													href="${pageContext.request.contextPath}/holiday/paging/${nowPage+1}">▶</a>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>

					<!-- ------------------------------------------------------------------------------ -->
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		/* 모달창 */
		document.getElementById("exit").addEventListener("click", function() {
			document.getElementById("modal_dim").style.display = "none";
		});

		document
				.getElementById("modal_open")
				.addEventListener(
						"click",
						function() {
							document.getElementById("modal_dim").style.display = "flex";
						});
	</script>
</body>
</html>