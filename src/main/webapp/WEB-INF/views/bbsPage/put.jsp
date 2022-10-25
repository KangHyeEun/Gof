<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bbs/setstyle.css" />
</head>
<body>
	<div class="header">
		<img src="${pageContext.request.contextPath}/imges/logo.PNG" />
		<div class="header-logout">로그아웃 버튼</div>
	</div>
	<div class="container">
		<jsp:include page="../include/menu.jsp"></jsp:include>
		<div class="container-inner-bbs">
			<div class="inner-div-bbs">

				<form:form modelAttribute="bbsVO"
					action="${pageContext.request.contextPath}/bbsPage/put"
					method="post">
					<form:hidden path="id" />
					<div class="set-title">
						<h2>사내 게시판</h2>
					</div>
					<div class="set-subtitle">
						<div>
							<h3>수정하기</h3>
						</div>
						<div>
							<button id="return">목록</button>
						</div>
					</div>
					<div class="set-main">
						<table>
							<tbody>
								<tr>
									<th>작성자</th>
									<td>${bbsVO.owner}</td>
								</tr>
								<tr>
									<th>카테고리</th>
									<td><form:select path="category">
											<c:forEach var="vo" items="${categories}">
												<form:option value="${vo.category}">${vo.category}</form:option>
											</c:forEach>
										</form:select></td>
								</tr>
								<tr>
									<th>제목</th>
									<td>
										<div class="set-title">
											<form:input path="title" />
										</div>
									</td>
								</tr>
								<tr>
									<th>내용</th>
									<td><form:textarea path="content" /></td>
								</tr>
								<tr>
									<th>파일첨부<span><img src=""></span></th>
									<td><input type="file" name="mediaFile" id="mediaFile" multiple="multiple" />
										<button id="btn">Upload</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="set-footer">
						<button>작성하기</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		document.getElementById("return").addEventListener("click",function(e){
			e.preventDefault();
			location.href = "${pageContext.request.contextPath}/bbsPage/bbs";
		});
	</script>
</body>
</html>