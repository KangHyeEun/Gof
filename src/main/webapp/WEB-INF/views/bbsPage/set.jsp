<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
<style>
	.inner-div-bbs {
	    display: inline-block;
	}
    .set-header {
        padding-bottom: 1rem;
    }
    .set-subtitle {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-bottom: 1rem;
    }
    .set-subtitle #return {
        background-color: #fff;
	    border-radius: 0.4rem;
	    border: 1px solid #272454;
	    padding: 0.5rem;
	    margin-right: 0.5rem;
	    font-size: 0.8rem;
	    width: 5rem;
	    cursor: pointer;
    }
    table {
        width: 100%;     
        border-collapse: collapse;
    }
    table th{
    	width: 10rem;
        font-family: 'Nanum Barun Gothic', sans-serif;
        border-bottom: 1px solid #e5e7e9;
        min-height: 50px;
        padding: 10px 0 10px 20px;
        background-color: #e3edf7;
        text-align: left;
        font-weight: 700;
        line-height: 2.1rem;
        color: #212529;
        font-size: 0.8rem;
    }
    table td {
        font-family: 'Nanum Barun Gothic', sans-serif;
        background-color: #fff;
        font-size: 1rem;
        font-weight: 400;
        line-height: 2.1rem;
        color: #212529;
        padding: 0.8rem;
        border-bottom: 1px solid #e5e7e9;
    }
    table tr:nth-child(4){
        height: 200px;
    }
    .set-footer {
        display: flex;
        align-items: center;
        justify-content: center;
        padding-top: 2rem;
    }
    .set-footer button {
        font-family: 'Nanum Barun Gothic', sans-serif;
        font-weight: 400;
        color: #fff;
        border-radius: 0.4rem;
        border: 0;
        text-align: center;
        background: #232249;
        height: 3rem;
        width: 8rem;
        cursor: pointer;
    }
    #category {
		height: 40px;
	    font-family: 'Nanum Barun Gothic', sans-serif;
	    font-weight: 400;
	    line-height: 1rem;
	    color: #b8bfc4;
	    border: 1px solid #b8bfc4;
	    border-radius: 4px;
	    padding: 0 25px 0 10px;
	    -webkit-appearance: none;
	    color: #212529;
        cursor: pointer;	    
    }
    #title {
    	width: 90%;
		height: 40px;
	    font-family: 'Nanum Barun Gothic', sans-serif;
	    font-weight: 400;
	    line-height: 1rem;
	    color: #b8bfc4;
	    border: 1px solid #b8bfc4;
	    border-radius: 4px;
	    padding: 0 25px 0 10px;
	    -webkit-appearance: none;
	    color: #212529;
    }
    #content {
    	width: 90%;
		height: 300px;
	    font-family: 'Nanum Barun Gothic', sans-serif;
	    font-weight: 400;
	    line-height: 1rem;
	    color: #b8bfc4;
	    border: 1px solid #b8bfc4;
	    border-radius: 4px;
	    padding: 0 25px 0 10px;
	    -webkit-appearance: none;
	    color: #212529;    
    }
    #btn {
        color: #fff;
        border: 1px solid #3fb4d0;
        background: #14ABAB;
        border-radius: 0.4rem;
 	    padding: 0.5rem;
	    margin-right: 0.5rem;
	    font-size: 0.8rem;
	    width: 5rem;
	    cursor: pointer;      	
    }
    #mediaFile { 
        color: #3fb4d0;
        border: 1px solid #3fb4d0;
        background: #fff;
        border-radius: 0.4rem;
 	    padding: 0.5rem;
	    margin-right: 0.5rem;
	    font-size: 0.8rem;
	    cursor: pointer;  
    }
</style>
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
            
				<form:form modelAttribute="BBSVO" action="${pageContext.request.contextPath}/bbsPage/set" method="post" enctype="multipart/form-data">
                    
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
                                    <td>${session.name}</td>
                                </tr>
                                <tr>
                                    <th>카테고리</th>
                                    <td>
                                        <form:select path="category">
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
                                            <form:input path="title"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td>
                                        <form:input path="content"/>
                                    </td>
                                </tr>
                                <tr>                                
                                    <th>파일첨부&nbsp;&nbsp;<span><img src="https://uinnout.com/employee/images/clip.svg"></span></th>
                                    <td>
                                        <input type="file" name="mediaFile" id="mediaFile" multiple="multiple"/>
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
			location.href = "${pageContext.request.contextPath}/bbsPage/bbs";
		});
	
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
			fetch("${pageContext.request.contextPath}/bbsPage/fileupload", {
				method : "POST", //반드시 post
				body : formData})
			.then(response => console.log(response))
			.catch(error => console.log(error));
		});

	</script>
</body>
</html>