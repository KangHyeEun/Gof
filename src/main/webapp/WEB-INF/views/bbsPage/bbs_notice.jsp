<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bbs/bbsstyle.css"/>
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
<div class="container-wrap">
	<div class="header">
		<div class="navbar__toogleBtn" id="mobile-btn">☰</div>
		<img src="${pageContext.request.contextPath}/resources/imges/logo.PNG" />
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
	            <h3>공지사항</h3>
	        </div>
	        <div class="wrbtn">
                <c:if test="${personalInfoVO.empno == 220102}">
	            	<a href="${pageContext.request.contextPath}/bbsNotice/wrbtn">작성하기</a>
	        	</c:if>
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
						<button id="search">
							<img src="${pageContext.request.contextPath}/resources/imges/search.svg"/>
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
						<c:forEach var="vo" items="${list}" varStatus="status">
							<tr>
								<td>${vo.id}</td>
								<td>${vo.category} <c:if test="${vo.category == '중요'}"><img src="${pageContext.request.contextPath}/resources/imges/horn.svg"/></c:if></td>
								<td><a href="${pageContext.request.contextPath}/bbsNotice/bbs/${vo.id}">${vo.title}</a></td>
								<td>인사담당자</td>
								<td>${vo.createDate}</td>
								<td>${vo.viewCounts}</td>
								<td>
								<c:if test="${vo.fileCounts != 0}">
									<span><img src="${pageContext.request.contextPath}/resources/imges/clip.png" id="cilpimg"/></span>${vo.fileCounts}
								</c:if>
								</td>
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
                    <span class="num" >◀◀</span>
                </c:when>
                <c:otherwise>
                    <div class="num">
                        <a href="${pageContext.request.contextPath}/bbsNotice/bbs?page=${page.startPage - 1}" >◀◀</a>
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
                        href="${pageContext.request.contextPath}/bbsNotice/bbs?page=${page.nowPage - 1}${page.searchTypeKeyword}">◀</a>
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
                            <a href="${pageContext.request.contextPath}/bbsNotice/bbs?page=${i}${page.searchTypeKeyword}">${i}</a>
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
                        href="${pageContext.request.contextPath}/bbsNotice/bbs?page=${page.nowPage + 1}${page.searchTypeKeyword}">▶</a>
                    </div>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${page.totalPage eq page.endPage}">
                    <span class="num">▶▶</span>
                </c:when>
                <c:otherwise>
                    <div class="num">
                        <a href="${pageContext.request.contextPath}/bbsNotice/bbs?page=${page.endPage + 1}">▶▶</a>
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
// //검색
	document.getElementById("search").addEventListener("click", function(){
		let searchType = document.getElementById("searchType").value;
		let keyword = document.getElementById("keyword").value;
		
		console.log(searchType);
		console.log(keyword);

		location.href = "${pageContext.request.contextPath}/bbsNotice/bbs?searchType="+searchType+"&keyword="+keyword;
	});	
</script>

</body>
</html>