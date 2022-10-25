<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* write note */
#write_note_in {
	position: absolute;
	left: 220px;
}

#write_form {
	margin-left: -150px;
	margin-top: 15px;
	font-size: 14px;
}

#write_t {
	margin-left: -150px;
	margin-top: 10px;
	font: bold 27px 'malgun gothic';
}

.wr_ip input {
	padding: 0 0 0 10px;
	font-size: 14px;
	border-radius: 5px;
	border: solid 2px #D8D8D8;
	width: 180px;
	height: 35px;
}

.wr_ip textarea {
	padding: 0 0 0 10px;
	font-size: 14px;
	border-radius: 10px;
	border: solid 2px #D8D8D8;
	width: 250px;
	height: 250px;
}

.wr_ip_top {
	margin-top: 15px;
}

.wri_bt {
	padding: 10px 20px 10px 20px;
	background: #272454;
	border: 0;
	color: white;
	font-size: 12px;
	border-radius: 5px;
}

.wri_bt a {
	color: white;
}

.wri_bt:hover {
	background: #08298A;
}
</style>
<body>


	<div id="write_note_in">
		<div id="write_t">
			<h2>쪽지 보내기</h2>
		</div>
		<form action="${pageContext.request.contextPath}/message/result2"
			method="post">
			<div id="write_form">
				<div class="wr_ip">
					<input type="text" name="mreciever" placeholder="받는사람"
						id="mreciever" />
				</div>
				<div class="wr_ip wr_ip_top">
					<input type="text" name="mtitle" placeholder="제목" id="mtitle" />
				</div>
				<div class="wr_ip wr_ip_top">
					<textarea name="mcontent" placeholder="내용" id="mcontent"></textarea>
				</div>
				<button onclick="javascript:btn()" class="wri_bt wr_ip_top">보내기</button>
			</div>
		</form>

	</div>


	<!-- 현재 알림창을 끄는 기능을 쓰면 데이터 전달이 안되서 보류 -->
	<script>
		function btn() {
			alert('쪽지 전송에 성공하였습니다.');
		}
	</script>
</body>
</html>