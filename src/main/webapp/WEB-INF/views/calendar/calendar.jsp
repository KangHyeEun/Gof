<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
// 	String formatDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
// 	String formatTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm"));
	
// 	formatDate += "T" + formatTime;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/calendar/cal-style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
</head>
<body onload="refreshFunc();">
<!-- <body> -->
	<div class="container-wrap">
		<div class="header">
			<div class="navbar__toogleBtn" id="mobile-btn">☰</div>
			<img src="${pageContext.request.contextPath}/imges/logo.PNG"/>
            <div class="header-logout">
            	<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
            </div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner">
			    <!-- right-content -->
                <div class="calendar">
                    <div class="month">
	                    <div class="btnMove">
	                    	<i class="fas fa-angles-left prevs btnColor"></i>
	                        <i class="fas fa-angle-left prev btnColor"></i>
	                        <i class="fas fa-angle-right next btnColor"></i>
	                        <i class="fas fa-angles-right nexts btnColor"></i>
                        </div>
                        <div class="date">
                            <!-- month 객체로 월 동적 생성되는 부분 -->
                            <h1></h1>
                            <!-- 현재 시간을 기준으로 날짜가 동적 생성되는 부분 -->
                            <p class="todayMove"></p>
                        </div>
		               	<div class="btnDiv">
		               		<p id="btnScheAdd" class="btnColor">일정추가</p>
<!-- 		               		<p id="btnMonth" class="btnClick">월</p> -->
<!-- 		               		<p id="btnWeek" class="btnColor">주</p> -->
<!-- 		               		<p id="btnDay" class="btnColor">일</p> -->
		               	</div>
                    </div>
                    <div class="weekdays">
                        <div><span>일</span></div>
                        <div><span>월</span></div>
                        <div><span>화</span></div>
                        <div><span>수</span></div>
                        <div><span>목</span></div>
                        <div><span>금</span></div>
                        <div><span>토</span></div>
                    </div>
                    <div class="days">

                    </div>
                </div>
			</div>
			
<!-- 			 일정등록 팝업 -->
			<div class="schedule-wrap">
				<div class="schedule slideTop">
					<div>
						<p>일정 등록</p>
						<a>✖️</a>
					</div>
					<div>
						<form action="" method="post">
							<div>
							    <label for="calTitle">제목</label><br>
							    <input type="text" name="calTitle" id="calTitle">
						    </div>
						    <div>
							    <label for="calPlace">장소</label><br>
							    <input type="text" name="calPlace" id="calPlace">
						    </div>
						    <div>
							    <label for="calStart">일시</label><br>
							    <input type="datetime-local" name="calStart" id="calStart">
							    <label for="calEnd"> ~ </label>
							    <input type="datetime-local" name="calEnd" id="calEnd">
						    </div>
						    <div>
							    <label for="calAllday">종일</label>
							    <input type="checkbox" name="calAllday" id="calAllday" value="0">
							    <label for="calShow">비공개</label>
							    <input type="checkbox" name="calShow" id="calShow" value="0">
							    <label for="calNotice">공지</label>
							    <input type="checkbox" name="calNotice" id="calNotice" value="0">
						    </div>
						    <div>
							    <label for="calContent">설명</label><br>
							    <textarea name="calContent" class="calContent" cols="70" rows="5" placeholder="일정에 필요한 설명을 남기세요."></textarea>
						    </div>
						    <div class="btn">
						    	<button id="btn" class="btnColor" type="button">저장</button>
						    	<button id="realBtn" class="displayNone" type="submit">버튼</button>
						    </div>
						</form>
					</div>
				</div>
			</div>
			
<!-- 			일정 클릭시 (등록되어 있는 경우) 일정 목록 팝업 -->
			<div class="schedule-info-wrap">
				<div class="schedule-info slideTop">
					<div class="schedule-inner">
						<div class="schedule-title">
							<p>클릭한 곳의 날짜</p>
							<a>✖️</a>
						</div>
						<div class="schedule-list">
<!-- 								자바스크립트로 추가될 일정 부분 -->
						</div>
					</div>
				</div>
			</div>
			
<!-- 			일정목록에서 항목 클릭시 상세목록 팝업 -->
		    <div class="scheInfo-detail-wrap">
		        <div class="scheInfo-detail slideTop">
	                <div class="scheInfo-title">
	                    <p>일정 상세정보</p>
	                    <a>✖️</a>
	                </div>
	                <div class="scheInfo-content">
	                    <ul>
<!-- 		                    	일정 상세정보 항목들 들어갈 자리 -->
	                    </ul>
	                </div>
	                <div class="scheInfo-btn">
	                    <a href="${pageContext.request.contextPath}/logout">수정</a>
	                    <a>삭제</a>
	                </div>
		        </div>
		    </div>
		    
			<div class="scheUpdate-wrap">
				<div class="scheUpdate slideTop">
					<div>
						<p>일정 수정</p>
						<a>✖️</a>
					</div>
					<div>
						<form action="" method="post">
							<div>
							    <label for="calTitle">제목</label><br>
							    <input type="text" name="calTitle" id="calTitle">
						    </div>
						    <div>
							    <label for="calPlace">장소</label><br>
							    <input type="text" name="calPlace" id="calPlace">
						    </div>
						    <div>
							    <label for="calStart">일시</label><br>
							    <input type="datetime-local" name="calStart" id="calStart">
							    <label for="calEnd"> ~ </label>
							    <input type="datetime-local" name="calEnd" id="calEnd">
						    </div>
						    <div>
							    <label for="calAllday">종일</label>
							    <input type="checkbox" name="calAllday" id="calAllday" value="0">
							    <label for="calShow">비공개</label>
							    <input type="checkbox" name="calShow" id="calShow" value="0">
							    <label for="calNotice">공지</label>
							    <input type="checkbox" name="calNotice" id="calNotice" value="0">
						    </div>
						    <div>
							    <label for="calContent">설명</label><br>
							    <textarea name="calContent" class="calContent" cols="70" rows="5" placeholder="일정에 필요한 설명을 남기세요."></textarea>
						    </div>
						    <div class="btn">
						    	<button id="Updatebtn" class="btnColor" type="button">수정</button>
						    	<button id="UpdateRealBtn" class="displayNone" type="submit">버튼</button>
						    </div>
						</form>
					</div>
				</div>
			</div>
			
			
			
			

		</div>
	</div>
	

	<script type="text/javascript">
// 		.js 파일에서 contextPath 사용을 위해 sessionStorag에 저장
		sessionStorage.removeItem("contextpath");
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
// 		.js 파일에서 사원번호, 사원이름 사용을 위해 sessionStorage에 저장
		sessionStorage.removeItem("empno");
		sessionStorage.removeItem("ename");
		sessionStorage.setItem("empno", "${empno}");
		sessionStorage.setItem("ename", "${ename}");
	</script>
	
<!-- calendar -->
    <script src="${pageContext.request.contextPath}/calendar/cal-script.js"></script>
    
    <script type="text/javascript">
    	
    </script>
    <script type="text/javascript">
//     	일정 추가 팝업
    	const divA = document.querySelector(".schedule > div > a");
//     	닫기(x표시) 클릭시 none 처리
    	divA.addEventListener("click", function(){
			document.querySelector(".schedule-wrap").style.display = "none";
		});
    	
//     	일정 목록 팝업
    	const titleA = document.querySelector(".schedule-title > a");
//     	닫기(x표시) 클릭시 none 처리
    	titleA.addEventListener("click", function(){
			document.querySelector(".schedule-info-wrap").style.display = "none";
		});
    	
//     	일정 상세목록 팝업
    	const infoTitleA = document.querySelector(".scheInfo-title > a");
//     	닫기(x표시) 클릭시 none 처리
    	infoTitleA.addEventListener("click", function(){
			document.querySelector(".scheInfo-detail-wrap").style.display = "none";
		});
		
		const scheWrapEle = document.querySelector(".schedule-wrap");
		const scheInfoWrapEle = document.querySelector(".schedule-info-wrap");
		const InfoDetailWrapEle = document.querySelector(".scheInfo-detail-wrap");
		
// 		최종적으로 적용된 CSS를 모두 불러올수있는 메서드
// 		window.getComputedStyle(element)
//     	esc 누를시 일정추가, 일정목록 팝업 none 처리
    	document.onkeydown = function(event) {
    		if(event.keyCode == 27) {
//     			일정추가 팝업의 최종 속성 (getComputedStyle)
    			const scheWrap = window.getComputedStyle(scheWrapEle);
//     			일정목록 팝업의 최종 속성 (getComputedStyle)
    			const scheInfoWrap = window.getComputedStyle(scheInfoWrapEle);
//     			일정 상세목록 팝업의 최종 속성 (getComputedStyle)
    			const InfoDetailWrap = window.getComputedStyle(InfoDetailWrapEle);
    			
//     			일정추가 팝업이 보이는 상태일떄
    			if (scheWrap.display == "flex") {
    				scheWrapEle.style.display = "none";
    			}
// 				일정 상세목록 팝업만 보이는 상태일때
				if (scheInfoWrap.display == "none" && InfoDetailWrap.display == "flex") {
					InfoDetailWrapEle.style.display = "none";
					scheInfoWrapEle.style.display = "block";
				}
//     			일정목록 팝업만 보이는 상태일때
				else if (InfoDetailWrap.display == "none" && scheInfoWrap.display == "block") {
					scheInfoWrapEle.style.display = "none";
    			}
    		}
    	}
    </script>



<!-- 위의 .js 에서 EL태그 사용이 불가해서 대신 사용해볼까함 -->
<%--     <jsp:include page="./cal-script.jsp"></jsp:include> --%>
    
</body>
</html>