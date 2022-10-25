<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 비동기 검색 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/BBS/js/jquery-3.6.1.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/BBS/bbs/bbsstyle.css"/> --%>
<title>Insert title here</title>
<style type="text/css">
	body {
		font-family: 'Nanum Barun Gothic', sans-serif;
	}
    .inner-div-bbs{
        display: inline-block;
    }
    .bbs-header{
        display: flex;
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        justify-content: space-between;

    }
    .title{
        display: flex;
        box-sizing: border-box;
    }
    .title h3{
        font-family: 'NanumSquare', sans-serif;
        font-size: 1.8rem;
        font-weight: 700;
        line-height: 3.6rem;
        color: #212529;
    }
    .wrbtn{
        box-sizing: border-box;
        display: flex;
        align-items: center;
       	height: 5rem;
    }
    .wrbtn a {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 10px 30px;
        font-size: 1rem; 
        color: #fff;
        background-color: #232249;
        border-radius: 0.4rem;
        text-decoration: none;
    }
    .helpBar {
        /* border: 1px solid black; */
        display: flex;
        justify-content: right;
        align-items: center;
        height: 3rem;
        padding-bottom: 0.8rem;
    }
    .search-wrap {
        border: 1px solid gray;
        border-radius: 0.4rem;
        padding: 0.1rem;
    }
    .helpBar select {
        width: 6rem;
        height: 1.5rem;
        border-style: none;
    }
    .helpBar input{
        width: 20rem;
        height: 1.5rem;
        border-style: none;
    }
    .helpBar select, .helpBar input:focus{
        outline: none;
    }
    #search {
        border: none;
        border-radius: 0.4rem;
        box-sizing: border-box;
        padding: 0.5rem 1rem;
        width: 1.4rem;
        height: 1.4rem;
        background-image: url(https://uinnout.com/admin/images/search.svg);
        background-repeat: no-repeat;
        background-size: contain;
        background-color: #fff;
        cursor: pointer;
    }
    .main {
        height: auto;
    }
    table {
        border-collapse: collapse;
        width: 100%;
    }
    thead tr {
        border-top: 2px solid #909294;
        border-bottom: 1px solid #b3c2d1;
    }
    thead th:nth-child(3){
        width: 30rem;
    }
    tbody tr {
        border-bottom: 1px solid #b3c2d1;
    }
    tbody tr:last-child{
        border-bottom: 2px solid #909294;
    }
    tbody tr td:nth-child(3){
        padding-left: 5rem;
        text-align: left;
    }
    table td, table th {
        padding: 8px;
        text-align: center;
        line-height: 1.8rem;
    }
    table a {
    	text-decoration: none;
    	color: #0459c1;
    	overflow: hidden;
    	font-size: 1rem;
    }
    table th {
        font-family: 'Nanum Barun Gothic', sans-serif;
        padding-top: 12px;
        padding-bottom: 12px;
        background-color: white;
        color: rgb(0, 0, 0);
    }
    .bbs-footer {
    	display: flex;
    	justify-content: center;
    	align-items: center;
        padding: 1.5rem;
        display: fixed;
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