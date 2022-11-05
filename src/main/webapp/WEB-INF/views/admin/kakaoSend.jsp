<%@page import="com.awoo.vo.MessageVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main.css">
<script id="javascript-sdk" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>Insert title here</title>
<style>
.inner-div-bbs{
	height:90%;
}
.kakao-container{
    width: 90%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 100%;
}
.kakao-img{
	width: 260px;
	min-width:210px;
    border: 1px solid #7c8995;
    border-radius: 10px;
    box-shadow: 1px 1px 3px grey;
}
.left-kakao{
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    align-items: center;
    width: 100%;
    height: 70%;
    background-color: #f1f1f1;
    border-radius: 10px;
    box-shadow: 2px 2px 2px #afafaf;
    border: 1px solid #d3d3d3;
}

.left-kakao > p{
	margin-bottom: 30px;
}
.left-kakao input{
    width: 80%;
    height: 30px;
    border: none;
    border-bottom: 2px solid #bfbfbf;
    /* background-color: #e7e7e7; */
    box-shadow: 1px 1px solid black;
    box-shadow: 2px 0px 2px #a1a1a1;
    border-radius: 15px;
    padding: 0 10px;
    box-sizing: border-box;
}
.left-kakao input:focus, .left-kakao input:focus-visible{
	outline:none;
	border:none;
	border-bottom: 2px solid #4ea7ff;
}
.left-kakao label{
    width: 85%;
    font-weight: bold;
    font-size: 0.9em;
}
.right-kakao{
    display: flex;
/*     justify-content: space-between; */
    align-items: center;
    flex-direction: column;
    height: 80%;
    width: 45%;
    
}
.right-kakao > p {
    margin-bottom: 25px;
}
</style>
</head>
<body>

	<div class="container-wrap">
		<div class="header">
			<div class="navbar__toogleBtn" id="mobile-btn">☰</div>
			<img src="${pageContext.request.contextPath}/resources/imges/logo.PNG"/>
            <div class="header-logout">	<a href="${pageContext.request.contextPath}/logout">로그아웃</a> </div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner-bbs">
				<div class="inner-div-bbs">
					<h3 class="sub-title">카카오톡 공지</h3> 
					<!-- 각자 필요한 부분 넣기 -->
					<div class="kakao-container">
						
						<div class="right-kakao">
							<p><strong>◎ 아래 카카오톡 아이콘을 눌러 전송하세요</strong></p> 
							<div class="left-kakao">
							<label for="img">1. 이미지 url : </label><input type="text" id="img" name="img" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNuvafpok1f34VfmtLMX_0RYNYnJ-aSpv0qQ&usqp=CAU"/>
							<label for="title">2. 제목 : </label><input type="text" id="title" name="title" value="공지제목입니다"/>
							<label for="content">3. 본문 : </label><input type="text" id="content" name="content" value="공지본문입니다" />
<!-- 							<label for="button">4. 버튼 : </label><input type="text" id="button" name="button" value="확인버튼입니다"/> -->
<!-- 							<label for="buttonURL">5. 버튼 이동 url : </label><input type="text" id="buttonURL" name="buttonURL" value="http://google.com"/> -->
							<a id="kakao-link-btn" href="javascript:sendLink()">
							  <img
							    src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
							  />
							</a>						
						</div>
						</div>
						<div class="right-kakao">
							<p><strong>◎ 샘플 이미지</strong></p> 
							<img src="${pageContext.request.contextPath}/resources/imges/kakao.png" class="kakao-img"/>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
 Kakao.init('88f4903fdd2bacd47c43abc82d37273c');
  function sendLink() {
	  let img1 = document.getElementById("img").value;
	  let title1 = document.getElementById("title").value;
	  let content1 = document.getElementById("content").value;
// 	  let button1 = document.getElementById("button").value;
// 	  let buttonURL1 = document.getElementById("buttonURL").value;
	  
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: title1,
        description: content1,
        imageUrl:img1,
        link: {
          mobileWebUrl: 'https://www.naver.com',
          webUrl: 'https://www.naver.com',
        },
      },
//       social: {
//         likeCount: 9999, //99999가 최대입니다
//         commentCount: 9999, //99999가 최대입니다
//         sharedCount: 9999, //99999가 최대입니다
//       },
      buttons: [
        {
          title: "",
          link: {
            mobileWebUrl: "",
            webUrl: "",
          },
        },
      ],
    })
  }
</script>
</body>
</html>