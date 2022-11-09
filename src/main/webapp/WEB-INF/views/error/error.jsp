<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.error-wrapper{
    width: 100%;
    height: 90vh;
    heigth: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
	}
	#errorBtn{
    color: #fff;
    padding: 15px 80px;
    text-align: center;
    font-size: 13px;
    box-shadow: 2px 3px 3px 0 rgb(187 187 187);
    border-radius: 5px 5px 5px 5px;
    transition: all 0.3s ease-in-out;
    background-color: #f4554d;;
    border: #fff;
    cursor: pointer;
	}
	#other_error_img {
		width: 560px;
		height: 470px;
	}
</style>
<script>
    const backFunc = function (){
        history.back();
    }
</script>
</head>
<body>
	<div class="error-wrapper">
		<img src="${pageContext.request.contextPath}/resources/imges/other_error.jpg" id="other_error_img">
        <button onclick="backFunc()" id="errorBtn">뒤로 가기</button>
	</div>
</body>
</html>