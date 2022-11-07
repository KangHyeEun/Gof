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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/holiday/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/message/style.css">
<script id="javascript-sdk" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>Insert title here</title>
<style>
.container-inner-bbs{
    position: relative;
    padding:0;
}
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
.pop1{
	height:12%;
}
.pop1 p{
    font-size: 14px;
}

.pop2  > p{
	margin-bottom: 30px;
}
.pop2 input{
    width: 90%;
    height: 40px;
    border: none;
    border-bottom: 2px solid #bfbfbf;
    background-color: #f9f9f9; 
    box-shadow: 1px 1px solid black;
    box-shadow: 2px 0px 2px #a1a1a1;
/*     border-radius: 15px; */
    padding: 0 10px;
    box-sizing: border-box;
    
}
.pop2 input:focus, .pop2 input:focus-visible{
	outline:none;
	border:none;
	background-color:white;
	border-bottom: 2px solid #4ea7ff;
}
.pop2 label{
    width: 95%;
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

#applypop{
    width: 100%;
    height: 100%;
    display:flex;
    background-color:#e3e3e3;
}
.pop-titleContainer {
    width: 65%;
    flex-direction: column;
}
.pop2{
    height: 88%;
    display: flex;
    align-items: center;
    width: 100%;
    justify-content: space-between;
}

#prev-show{
	display: flex;
    justify-content: space-evenly;
    align-items: center;
    width: 100px;
    height: 35px;
    border: 1px solid #b7b7b7;
    background: linear-gradient(180deg, #f5f4f4, #e1e1e1);
    border-radius: 5px;
    cursor: pointer;
}
#prev-show:hover{
	background: linear-gradient(180deg, #d7d7d7, #a9a9a9);
/*     color: white; */
}
#prev-show img{
width: 25px;
}
#detailpop{
	width: 100%;
    height: 100%;
    background-color:#cbcbcb;

}
.detail-container{
    height: 77%;
    align-items: end;
    width: 90%;
    
}
.pop-container{
 padding-bottom: 3px;
}
#detailpop .pop-container{
	 background-image: url("${pageContext.request.contextPath}/resources/imges/kakao.png");
 	 background-size : cover; 
	 height: 816px;
	 padding:0;
	 justify-content: flex-start;
}
.button-kakao{
    width: 300px;
    z-index: 10;
    height: 100%;
    background-size: contain;
    background-repeat: no-repeat;
	background-image: url("${pageContext.request.contextPath}/resources/imges/kakao-button.png");
}
.no-button-kakao{
	width: 300px;
    z-index: 10;
    height: 100%;
    background-size: contain;
    background-repeat: no-repeat;
	background-image: url("${pageContext.request.contextPath}/resources/imges/kakao-mb.png");
}
#detailpop .pop1{
border:none;
}
.no-button-kakao .kakao-message-img{
	width: 100%;
    height: 318px;
}
.no-button-kakao p{
	padding: 3px 10px;
}
.no-button-kakao .kakao-content{
	color:gray;
}
.button-kakao .kakao-message-img{
	width: 100%;
    height: 318px;
}
.button-kakao p{
	padding: 4px 10px;
}
.button-kakao .kakao-content{
	color:gray;
}
.button-kakao .kakao-button{
	padding-top: 27px;
    text-align: center;
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

					
				</div>
				
					<!-- 쪽지 보내기 -->
			<div id="applypop">
				<div class="pop-container">
						<div class="pop1">
							<div class="pop-titleContainer">
								<span class="pop-title">카카오톡 공지</span>
								<p>◎ 아래 카카오톡 아이콘을 눌러 전송하세요</p>
							</div>
							<div>
								<a href=""></a>
							</div>
						</div>
						<div class="pop1-1">
							<div class="writeToMeContainer">
								<button type="button" id="prev-show"><img src="${pageContext.request.contextPath}/resources/imges/prev-show.png"/>미리보기</button>
								
							</div>	
							<div class="pop2">
								<label for="img">1. 이미지 url : </label><input type="text" id="img" name="img" value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNuvafpok1f34VfmtLMX_0RYNYnJ-aSpv0qQ&usqp=CAU"/>
								<label for="title">2. 제목 : </label><input type="text" id="title" name="title" value="공지제목입니다"/>
								<label for="content">3. 본문 : </label><input type="text" id="content" name="content" value="공지본문입니다" />
								<label for="button">4. 버튼 : </label><input type="text" id="button" name="button" value=""/>
								<label for="buttonURL">5. 버튼 이동 url : </label><input type="text" id="buttonURL" name="buttonURL" value=""/>
								<a id="kakao-link-btn" href="javascript:sendLink()">
							 	 <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
								</a>	
							</div>
						</div>
						<div class="empty-div">
						</div>
					</div>
				</div>
				
				
				<div id="detailpop" style="display:none">
				<div class="pop-container">
					<a id="backbtn" class="pop1"></a>
					<div class="detail-container">
						<div class="button-kakao" id="button-kakao" style="display:none">
							<img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" class="kakao-message-img" id="kbi"/>
							<p class="kakao-title" id="kbt">제목입니다</p>
							<p class="kakao-content" id="kbc">본문입니다</p>	
							<p class="kakao-button" id="kbb">버튼입니다</p>		
						</div>
						<div class="no-button-kakao" id="no-button-kakao" style="display:none">
							<img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" class="kakao-message-img" id="knbi"/>
							<p class="kakao-title" id="knbt">제목입니다</p>
							<p class="kakao-content" id="knbc">본문입니다</p>
						</div>
					</div>
				</div>
			</div>
				
				
				
<!-- 		        <section class="modal modal-section type-confirm" id="confirm-block"> -->
<!-- 		            <div class="enroll_box"> -->
<!-- 		                <p class="menu_msg" id="real-submit-message">쪽지를 전송하시겠습니까?</p> -->
<!-- 		            </div> -->
<!-- 		            <div class="enroll_btn"> -->
<!-- 		                <button class="btn pink_btn btn_ok" id="btn_ok">확인</button> -->
<!-- 		                <button class="btn gray_btn modal_close" id="btn_cancle">취소</button> -->
<!-- 		            </div> -->
<!-- 		        </section> -->
				</div>
			</div>
		</div>
	
	
<script type="text/javascript">
 Kakao.init('88f4903fdd2bacd47c43abc82d37273c');
  function sendLink() {
	  let img1 = document.getElementById("img").value;
	  let title1 = document.getElementById("title").value;
	  let content1 = document.getElementById("content").value;
	  let button1 = document.getElementById("button").value;
	  let buttonURL1 = document.getElementById("buttonURL").value;
	  
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
          title: button1,
          link: {
            mobileWebUrl: buttonURL1,
            webUrl: buttonURL1,
          },
        },
      ],
    })
  }
  
  
  document.getElementById("prev-show").addEventListener("click",function(){
	  let img1 = document.getElementById("img").value;
	  let title1 = document.getElementById("title").value;
	  let content1 = document.getElementById("content").value;
	  let button1 = document.getElementById("button").value;
	  let buttonURL1 = document.getElementById("buttonURL").value;
		document.getElementById("detailpop").style.display = "flex";
		
		if(button1 == "" || button1 == null){
			document.getElementById("no-button-kakao").style.display = "block";
			document.getElementById("button-kakao").style.display = "none";
			document.getElementById("knbi").src = img1;
			document.getElementById("knbt").innerHTML = title1;
			document.getElementById("knbc").innerHTML = content1;
			
		}else{
			document.getElementById("button-kakao").style.display = "block";
			document.getElementById("no-button-kakao").style.display = "none";
			document.getElementById("kbi").src = img1;
			document.getElementById("kbt").innerHTML = title1;
			document.getElementById("kbc").innerHTML = content1;
			document.getElementById("kbb").innerHTML = button1;
		}
	
  })
    document.getElementById("backbtn").addEventListener("click",function(){
	  document.getElementById("detailpop").style.display = "none";
	})
  

</script>
</body>
</html>