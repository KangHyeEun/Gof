<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.total{
		display : flex;
	}
	 .container{
	 width:100%;
    border: 1px solid black;
    display: flex;
    align-items:center;
    justify-content: center;
    
   }
   .left-section{
    border: 1px solid red;
    flex:1;
   } 

    .welcome{
        border:1px solid rgb(102, 41, 52);
    }

    .user-info{
        display: flex;
        flex-direction: column;
    }
    .user-info div{
        border:1px solid red;
    }
    .first-info, .show{
        display: flex;
        flex-direction: row;
    }
   .right-section{
    border: 1px solid blue;
    flex:2;
   }
   
   
   #popenter{
   		disply:none;
   }
</style>
</head>
	
<body>
	<div class="total">
		<jsp:include page="../include/menu.jsp"></jsp:include>	
		    <div class="container">
	        <section class="left-section">
	            <div class="welcome">
	                <h2>김가빈님</h2><h3>안녕하세요! 오늘도 행복한 하루 보내세요</h3>
	            </div>
	            <div class="user-info">
	                <div class="first-info">
	                    <p>오늘 나의 출퇴근</p>
	                    <div class="photo">
	                        <p>여기는 사진</p>
	                    </div>
	                    <div class="detail">
	                        <p>직원 종류</p>
	                    	<div>출근 - </div>
	                    	<div>퇴근 -</div>    	
	                    </div>
	                </div>
	                <div class="show">
	                	<div id="enter">출근</div>
	                	  <div id="popenter" class="pop_wrap" style="display:none">
						    <div class="pop_inner">
						      <p class="dsc">팝업 안내문구 입니다.</p>
						      <button type="button" class="btn_close">닫기</button>
						    </div>
						  </div>
	                    <div id="leave">퇴근</div>
	                    
	                </div>
	            </div>
	            <div class="process">
	
	            </div>
	        </section>
	
	        <section class="right-section">
	            <div class="sorting"></div>
	            <div class="list">
	            	<table border="1">
	            		<tr>
	            			<th>ID</th>
	            			<th>근무일</th>
	            			<th>출근시간</th>
	            			<th>퇴근시간</th>
	            			<th>근무시간</th>
	            			<th>연장근무시간</th>
	            		</tr>
		            	<c:forEach items="${CommutingList}" var="cl">
		            		<tr>
			            		<td>${cl.id}</td>
			            		<td>${cl.workday}</td>
			            		<td>${cl.startTime}</td>
			            		<td>${cl.endTime}</td>
			            		<td>${cl.workTime}</td>
			            		<td>${cl.overTime}</td>
		            		</tr>	
		            	</c:forEach>
	            	</table>
	            </div>
	        </section>
	    </div>
    </div>
    
    <script type="text/javascript">
    	document.getElementById("enter").addEventListener("click",function(){
    		document.getElementById("popenter").style.display = "block";

    	});
    	document.getElementById("leave").addEventListener("click",function(){
    		alert("바이");
    	});
    	
//     	function popupOpen(){
//     		var width = 500;
//     		var height = 500;
//     		var left = (window.screen.width / 2) - (width/2);
//     		var top = (window.screen.height / 4);
//     		var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', toolbar=no, menubar=no, location=no, scrollbars=no, status=no, resizable=no, titlebar=no';
    		
//     		var popUrl = "${pageContext.request.contextPath}/enterpopup";	//팝업창에 출력될 페이지 URL
    		
//     			window.open(popUrl,"",windowStatus);
//     		}
    </script>
</body>
</html>

