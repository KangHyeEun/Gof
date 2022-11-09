<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.errorMessage {
	display: flex;
	justify-content: center;
	align-items: center;
}
.errorBtn {
	display: flex;
	flex-direction: row-reverse;
}
</style>
</head>
<body>
<script>
    const backFunc = function (){
        history.back();
    }
</script>
<br>
<div class="container">
    <h1>Error Message Page</h1>
    <hr>
    <div class="errorMessage">
    <h3>잘못된 요청입니다.</h3>
    </div>
    <hr>
    <div class="errorBtn">
        <button onclick="backFunc()">뒤로 가기</button>
    </div>
</div></body>
</html>