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
	                        <p>출근</p>
	                        <p>퇴근</p>
	                    </div>
	                </div>
	                <div class="show">
	                    <div>출근 - </div>
	                    <div>퇴근 -</div>
	                </div>
	            </div>
	            <div class="process">
	
	            </div>
	        </section>
	
	        <section class="right-section">
	            <div class="sorting"></div>
	            <div class="list">
	            	<table>
		            	<c:forEach items="${CommutingList}" var="cl">
		            		<tr>
			            		<td>${cl.id}</td>
			            		<td>${cl.workday}</td>
			            		<td>${cl.startTime}</td>
		            		</tr>	
		            	</c:forEach>
	            	</table>
	            </div>
	        </section>
	    </div>
    </div>
</body>
</html>