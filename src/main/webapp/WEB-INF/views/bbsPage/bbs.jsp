<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bbs/bbsstyle.css"/>
<title>Insert title here</title>
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
			
	    <!-- 헤더 -->
	    <div class="bbs-header">
	        <div class="title">
	            <h3>사내 게시판</h3>
	        </div>
	        <div class="wrbtn">
	            <a href="${pageContext.request.contextPath}/bbsPage/wrbtn">작성하기</a>
	        </div>
	    </div>
				
			<!-- 검색 기능------------------------------- -->
				<div class="helpBar">
			        <div class="search-wrap">
						<c:choose>
							<c:when test="${title} != null && ${content} != null">
								<select name="option" id="option">
									<option value="both" selected>제목+내용</option>
									<option value="category">카테고리</option>
									<option value="owner">글쓴이</option>
								</select>
								<input type="text" id="text" name="text" value="${title}"/>
							</c:when>
							<c:when test="${title} != null">
								<select name="option" id="option">
									<option value="both" selected>제목+내용</option>
									<option value="category">카테고리</option>
									<option value="owner">글쓴이</option>
								</select>
								<input type="text" id="text" name="text" value="${title}"/>
							</c:when>
							<c:when test="${content} != null">
								<select name="option" id="option">
									<option value="both" selected>제목+내용</option>
									<option value="category">카테고리</option>
									<option value="owner">글쓴이</option>
								</select>
								<input type="text" id="text" name="text" value="${content}"/>							
							</c:when>
							<c:otherwise>
								<select name="option" id="option">
									<option value="both" selected>제목+내용</option>
									<option value="category">카테고리</option>
									<option value="owner">글쓴이</option>
								</select>
								<input type="text" id="text" name="text"/>							
							</c:otherwise>
						</c:choose>
						<button id="search"></button>
					</div>				
				</div>
				
			<!-- 게시판 테이블------------------------------- -->
			<div class="main">
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>분류</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>첨부 파일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${list}">
							<tr>
								<td>${vo.id}</td>
								<td>${vo.category}</td>
								<td><a href="${pageContext.request.contextPath}/bbsPage/bbs/${vo.id}">${vo.title}</a></td>
								<td>${vo.owner}</td>
								<td>${vo.createDate}</td>
								<td>${vo.viewCounts}</td>
								<td>첨부 파일</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- 페이징단------------------------------- -->
				<div class="bbs-footer">
					<div id="paging">
						<c:choose>
							<c:when test="${1 == page.startPage}">
								<span>◀◀</span>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/bbsPage/bbs?page=${page.startPage - 1}">◀◀</a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${1 == page.nowPage}">
								<span>◀</span>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/bbsPage/bbs?page=${page.nowPage - 1}">◀</a>
							</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${page.startPage}"
							end="${page.endPage}">
							<c:choose>
								<c:when test="${page.nowPage eq i}">
									<span>${i}</span>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/bbsPage/bbs?page=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${page.totalPage == page.nowPage}">
								<span>▶</span>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/bbsPage/bbs?page=${page.nowPage + 1}">▶</a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${page.totalPage eq page.endPage}">
								<span>▶▶</span>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/bbsPage/bbs?page=${page.endPage + 1}">▶▶</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
		
			</div>
		</div>
	</div>
</div>
		
<script type="text/javascript">
//검색
	document.getElementById("search").addEventListener("click", function(){
		let option = document.getElementById("option").value;
		let text = document.getElementById("text").value;
		
		if(option == "both"){
			location.href = "${pageContext.request.contextPath}/bbsPage/bbs?title="+text+"&content="+text;	
		}else if(option == "category"){
			location.href = "${pageContext.request.contextPath}/bbsPage/bbs?category="+text;	
		}else if(option == "owner"){
			location.href = "${pageContext.request.contextPath}/bbsPage/bbs?owner="+text;
		}
	});
</script>

</body>
</html>