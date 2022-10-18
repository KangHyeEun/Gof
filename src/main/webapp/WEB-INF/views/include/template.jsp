<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    .container-wrap{
        width:100vw;
        height: 100vh;
        display: flex;
        flex-direction: column;
    }
    .header{
        height:60px;
        background-color: #272454;
    }
    .container{
        width:100%;
        height:100vh;
        display: flex;
    }
    .container-inner{
        width: calc(100% - 210px);
        height:calc(100vh - 60px);
        background-color: white;
    }
</style>
<body>



	<div class="container-wrap">
		<div class="header"></div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner">
				
			</div>
		</div>
	</div>
	
	
</body>
</html>