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
	href="${pageContext.request.contextPath}/resources/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bbs/setstyle.css" />
<!-- ckeditor 적용 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>	
</head>
<body>
	<div class="header">
		<img src="${pageContext.request.contextPath}/resources/imges/logo.PNG" />
		<div class="header-logout">
			<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
		</div>
	</div>
	<div class="container">
		<jsp:include page="../include/menu.jsp"></jsp:include>
		<div class="container-inner-bbs">
			<div class="inner-div-bbs">

				<form:form modelAttribute="BBSVO"
					action="${pageContext.request.contextPath}/bbsNotice/set"
					method="post" enctype="multipart/form-data">

					<div class="set-header">
						<h2>사내 게시판</h2>
					</div>

					<div class="set-subtitle">
						<div>
							<h3>글쓰기</h3>
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
									<td>${sessionScope.personalInfoVO.name}</td>
								</tr>
								<tr>
									<th>카테고리</th>
									<td><form:select path="category">
											<c:forEach var="vo" items="${categories}">
												<form:option value="${vo.category}" class="category">${vo.category}</form:option>
											</c:forEach>
										</form:select>
									</td>
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
									<td>
										<form:textarea path="content" id="textarea"/>
									</td>
								</tr>
								<tr>
									<th>파일첨부&nbsp;&nbsp;<span><img src="https://uinnout.com/employee/images/clip.svg"></span></th>
									<td><input type="file" name="mediaFile" id="mediaFile" multiple="multiple" />
										<button id="btn">Upload</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="set-footer">
						<button>저장하기</button>
					</div>
				</form:form>

			</div>
		</div>
	</div>

	<script type="text/javascript">
	//뒤로가기
		document.getElementById("return").addEventListener("click",function(e){
			e.preventDefault();
			location.href = "${pageContext.request.contextPath}/bbsNotice/bbs";
		});
	
	//이지윅즈 적용
	CKEDITOR.replace('textarea');
	
	//파일 업로드
		document.getElementById("btn").addEventListener("click", function(e){
			e.preventDefault();
			//formData를 통해 데이터를 보낼 양식 설정
			const formData = new FormData;
			//mediaFile input=file 태그 엘리먼트 선언
			const inputFiles = document.getElementById("mediaFile");
			//inputFiles에서 파일에 대한 정보들을 전부 가져와 변수에 저장
			let files = inputFiles.files;
			//어떤 값이 오는지 임시 출력
			console.log(files);
			
			//files의 정보를 formData에 담기
			for (const file of files) {
				formData.append("uploadFile", file);
			}
			//fetch를 통해 formData 전송
			fetch("${pageContext.request.contextPath}/bbsNotice/fileupload", {
				method : "POST", //반드시 post
				body : formData})
			.then(response => console.log(response))
			.catch(error => console.log(error));
		});

	</script>
</body>
</html>