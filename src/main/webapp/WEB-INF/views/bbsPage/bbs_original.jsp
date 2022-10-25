<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.BBScontainer {
	display: grid;
	grid-template-columns: 200px 1fr 200px;
	grid-template-rows: 50px 100px 30px 30px 1fr 50px;
	gap: 0px 0px;
	grid-auto-flow: row;
	grid-template-areas: ". . ." ". toppannel ." ". button-area ." ". select-area ." ". main ." ". pannel .";
}

main {
	grid-area: main;
}

table {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

table td, table th {
	border: 1px solid #ddd;
	padding: 8px;
}

table tr:nth-child(even) {
	background-color: #f2f2f2;
}

table tr:hover {
	background-color: #ddd;
}

table th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #0335fc;
	color: white;
}
.button-area{
	grid-area: button-area;
	text-align: right;
}
.select-area{
	grid-area: select-area;
}
#pannel{
	grid-area: pannel;
	text-align: center;
}
</style>
</head>
<body>
	<div class="BBScontainer">
	<div class="button-area">
		<div>
			<button id="wrbtn">글쓰기</button>
		</div>
	</div>
	<div class="select-area">
		<form action="${pageContext.request.contextPath}/bbsPage/search">
			<div>
				<select name="selectVal">
					<option value="all">제목+내용</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="owner">작성자</option>
				</select>
				<input type="text" name="keyword" id="keyword"/>
				<button>검색</button>
			</div>
		</form>
	</div>
		<main>
			<table>
				<thead>
					<tr>
						<th>id</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>작성일/작성시간</th>
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
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</main>
		
		<div id="pannel">
			<div id="paging">
				<c:choose>
					<c:when test="${1 == page.startPage}">
						<span>◀◀</span>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/bbsPage/bbs?page=${page.startPage - 1}">◀◀</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${1 == page.nowPage}">
						<span>◀</span>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/bbsPage/bbs?page=${page.nowPage - 1}">◀</a>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<c:choose>
						<c:when test="${page.nowPage eq i}">
							<span>${i}</span>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/bbsPage/bbs?page=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${page.totalPage == page.nowPage}">
						<span>▶</span>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/bbsPage/bbs?page=${page.nowPage + 1}">▶</a>
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
	
	<script type="text/javascript">
	//글쓰기
		document.getElementById("wrbtn").addEventListener("click", function(){
			location.href="${pageContext.request.contextPath}/bbsPage/wrbtn"
		});
	</script>
</body>
</html>