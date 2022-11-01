<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bbs/bbsstyle.css"/>
<title>Insert title here</title>
<style type="text/css">
/* body { */
/* 	font-family: 'Nanum Barun Gothic', sans-serif; */
/* } */

/* .inner-div-bbs { */
/* 	display: inline-block; */
/* } */

/* .bbs-header { */
/* 	display: flex; */
/* 	box-sizing: border-box; */
/* 	margin: 0; */
/* 	padding: 0; */
/* 	justify-content: space-between; */
/* } */

/* .title { */
/* 	display: flex; */
/* 	box-sizing: border-box; */
/* } */

/* .title h3 { */
/* 	font-family: 'NanumSquare', sans-serif; */
/* 	font-size: 1.8rem; */
/* 	font-weight: 700; */
/* 	line-height: 3.6rem; */
/* 	color: #212529; */
/* } */

/* .wrbtn { */
/* 	box-sizing: border-box; */
/* 	display: flex; */
/* 	align-items: center; */
/* 	height: 5rem; */
/* } */

/* .wrbtn a { */
/* 	display: flex; */
/* 	justify-content: center; */
/* 	align-items: center; */
/* 	padding: 10px 30px; */
/* 	font-size: 1rem; */
/* 	color: #fff; */
/* 	background-color: #232249; */
/* 	border-radius: 0.4rem; */
/* 	text-decoration: none; */
/* } */

/* .helpBar { */
/* 	/* border: 1px solid black; */ */
/* 	display: flex; */
/* 	justify-content: right; */
/* 	align-items: center; */
/* 	height: 3rem; */
/* 	padding-bottom: 0.8rem; */
/* } */

/* .search-wrap { */
/* 	border: 1px solid gray; */
/* 	border-radius: 0.4rem; */
/* 	padding: 0.1rem; */
/* } */

/* .helpBar select { */
/* 	width: 6rem; */
/* 	height: 1.5rem; */
/* 	border-style: none; */
/* } */

/* .helpBar input { */
/* 	width: 20rem; */
/* 	height: 1.5rem; */
/* 	border-style: none; */
/* } */

/* .helpBar select, .helpBar input:focus { */
/* 	outline: none; */
/* } */

/* #search { */
/* 	border: none; */
/* 	border-radius: 0.4rem; */
/* 	box-sizing: border-box; */
/* 	padding: 0.5rem 1rem; */
/* 	width: 1.4rem; */
/* 	height: 1.4rem; */
/* 	background-image: url(https://uinnout.com/admin/images/search.svg); */
/* 	background-repeat: no-repeat; */
/* 	background-size: contain; */
/* 	background-color: #fff; */
/* 	cursor: pointer; */
/* } */

/* .main { */
/* 	height: auto; */
/* 	display: flex; */
/* 	justify-content: center; */
/* 	align-items: center; */
/* 	box-sizing: border-box; */
/* } */

/* table { */
/* 	border-collapse: collapse; */
/* 	table-layout: fixed; */
/* 	width: -webkit-fill-available; */
/* } */

/* thead tr { */
/* 	border-top: 2px solid #909294; */
/* 	border-bottom: 1px solid #b3c2d1; */
/* } */

/* tbody tr { */
/* 	border-bottom: 1px solid #b3c2d1; */
/* } */

/* tbody tr:last-child { */
/* 	border-bottom: 2px solid #909294; */
/* } */

/* tbody tr td:nth-child(3) { */
/* 	padding-left: 3rem; */
/* 	text-align: left; */
/* } */

/* table td, table th { */
/* 	padding: 8px; */
/* 	text-align: center; */
/* 	line-height: 1.8rem; */
/* } */

/* table a { */
/* 	text-decoration: none; */
/* 	color: #0459c1; */
/* 	overflow: hidden; */
/* 	font-size: 1rem; */
/* } */

/* table th { */
/* 	font-family: 'Nanum Barun Gothic', sans-serif; */
/* 	padding-top: 12px; */
/* 	padding-bottom: 12px; */
/* 	background-color: white; */
/* 	color: rgb(0, 0, 0); */
/* } */

/* .bbs-footer { */
/* 	display: flex; */
/* 	justify-content: center; */
/* 	align-items: center; */
/* 	padding: 1.5rem; */
/* 	display: fixed; */
/* 	box-sizing: border-box; */
/* } */

/* #paging { */
/* 	display: flex; */
/* } */

/* .num { */
/* 	height: 100%; */
/* 	width: 26px; */
/* 	margin: 0 2px; */
/* 	border: 1px solid #14abab;; */
/*  	display: flex; */
/* 	justify-content: center; */
/* 	align-items: center; */
/* 	/* 	font-weight: bold; */ */
/* 	border-radius: 10px; */
/* 	font-size: 11px; */
/* 	color: black; */
/* } */

/* .num a { */
/* 	text-decoration: none; */
/* 	height: 100%; */
/* 	width: 100%; */
/* 	display: flex; */
/* 	justify-content: center; */
/* 	align-items: center; */
/* } */

/* .checked { */
/* 	background-color: #14abab; */
/* 	color: white; */
/* 	border: 1px solid #14abab; */
/* } */

/* .notchecked:hover { */
/* 	background-color: #c9eaec; */
/* 	color: black; */
/* 	border: 1px solid #c9eaec; */
/* } */


</style>
</head>
<body>
<div class="container-wrap">
	<div class="header">
		<img src="${pageContext.request.contextPath}/imges/logo.PNG" />
		<div class="header-logout">
			<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
		</div>
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
						<select name="searchType" id="searchType">
						    <option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
					        <option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
						    <option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
						    <option value="owner" <c:if test="${page.searchType eq 'owner'}">selected</c:if>>작성자</option>
						</select>
						
						<input type="text" name="keyword" id="keyword" value="${page.keyword}"/>
						<button type="submit" id="search">
							<img src="${pageContext.request.contextPath}/imges/search.svg"/>
						</button>
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
								<td><span>✉</span> 첨부 파일</td>
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
                    <span class="num">◀◀</span>
                </c:when>
                <c:otherwise>
                    <div class="num">
                        <a href="${pageContext.request.contextPath}/bbsPage/bbs?page=${page.startPage - 1}" >◀◀</a>
                    </div>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${1 == page.nowPage}">
                    <span class="num">◀</span>
                </c:when>
                <c:otherwise>
                    <div class="num">
                        <a
                        href="${pageContext.request.contextPath}/bbsPage/bbs?page=${page.nowPage - 1}${page.searchTypeKeyword}">◀</a>
                    </div>
                    </c:otherwise>
            </c:choose>
            <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
                <c:choose>
                    <c:when test="${page.nowPage eq i}">
                        <span class="num checked">${i}</span>
                    </c:when>
                    <c:otherwise>
                        <div class="num notchecked">
                            <a href="${pageContext.request.contextPath}/bbsPage/bbs?page=${i}${page.searchTypeKeyword}">${i}</a>
                        </div>        
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${page.totalPage == page.nowPage}">
                    <span class="num">▶</span>
                </c:when>
                <c:otherwise>
                    <div class="num">
                        <a
                        href="${pageContext.request.contextPath}/bbsPage/bbs?page=${page.nowPage + 1}${page.searchTypeKeyword}">▶</a>
                    </div>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${page.totalPage eq page.endPage}">
                    <span class="num">▶▶</span>
                </c:when>
                <c:otherwise>
                    <div class="num">
                        <a href="${pageContext.request.contextPath}/bbsPage/bbs?page=${page.endPage + 1}">▶▶</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
		
			</div>
		</div>
	</div>
</div>
		
<script type="text/javascript">

// 	window.addEventListener("DOMContentLoaded",function(){
// 		document.getElementById("keyword").value = "${keyword}";
// 	});
// //검색(페이징)
	document.getElementById("search").addEventListener("click", function(){
		let searchType = document.getElementById("searchType").value;
		let keyword = document.getElementById("keyword").value;
		
		console.log(searchType);
		console.log(keyword);

		location.href = "${pageContext.request.contextPath}/bbsPage/bbs?searchType="+searchType+"&keyword="+keyword;
	});	
	
// 	function clickPage(i){
// 		let searchType = document.getElementById("searchType").value;
// 		let keyword = document.getElementById("keyword").value;
		
// 		location.href = "${pageContext.request.contextPath}/bbsPage/bbs?page="+i+"&searchType="+searchType+"&keyword="+keyword;
// 	}
	
	
	document.getElementById("keyword").addEventListener("keydown", function(e){
		const button = document.getElementById("search");
		const input = document.getElementById("keyword");
		if(e.key === "Enter") {
			console.log(1);
		}
	});
</script>

</body>
</html>