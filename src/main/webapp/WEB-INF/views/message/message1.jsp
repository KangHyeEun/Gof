<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main.css">

<title>Insert title here</title>
<style type="text/css">


#table1 {
	text-align: center;
}

th, td {
	padding: 7px;
}

tr:nth-child(odd) {
	background-color: #f8f8f9;
}

th {
	background-color: #eaf6f7;
}

#table1 {
	width: 100%;
}



a {
	color: black;
	
}



.scroll {
	padding: -10px;
}

.scroll::-webkit-scrollbar {
	width: 10px;
}

.scroll::-webkit-scrollbar-thumb {
	background-color: #f2f4f5;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

.scroll::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}



.intro {
	display: flex;
	justify-content: space-between;
	padding-bottom: 4%;
}

.intro>p {
	color: #c0c5c9;
}


.intro {
	display: flex;
	justify-content: space-between;
	padding-bottom: 2%;
}

.intro>p {
	color: #c0c5c9;
}
#note_bt {
	margin-top:15px;
	
}
#note_bt ul li {
	float: left;
	margin-left:100px;
}
#wri_m_bt {

	padding: 10px 20px 10px 20px;
	background:  #272454;
	border: 0;
	color:white;
	font-size: 12px;
	border-radius: 5px;
	margin-right: -170px;
}
#wri_m_bt:hover {
	background: #08298A;
	color:white;
	
}
#wri_m_bt a{
	color:white;
}
</style>
</head>
<body>

	<div class="container-wrap">
		<div class="header">
		<div class="navbar__toogleBtn" id="mobile-btn">☰</div>
			<img src="${pageContext.request.contextPath}/imges/logo.PNG" />
			<div class="header-logout">로그아웃 버튼</div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner-bbs">
				<div class="inner-div-bbs">
					<!-- 각자 필요한 부분 넣기 -->
					<div class="intro">
						<h1>받은 쪽지함</h1>
					</div>
					<div class="scroll" style="overflow: auto; width: 100%; height: 350px;">
						<table id="table1">

							<thead>
								<tr>
									<th><input type="checkbox" onclick="checkAll()"
										name="allCheck" id="allCheck" /></th>
									<th>NO.</th>
									<th>보낸사람</th>
									<th>제목</th>
									<th>날짜</th>
									<th>받는사람</th>
								</tr>
							</thead>
							<tbody id="table-body">
								<c:forEach var="item" items="${list}">
									<tr>

										<td><input type="checkbox" name="RowCheck" id="chkObj" value="${item.id}"></td>
										<td>${item.id}</td>
										<td>${item.mreciever}</td>
										<td><a
											href="${pageContext.request.contextPath}/message/content">${item.mtitle}</a></td>
										<td>${item.createDate}</td>
										<td>${item.mowner}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>


						<div id="note_bt">
							<ul>
								<li id="wri_m_bt"><a href="${pageContext.request.contextPath }/message/result2"
									onclick="window.open(this.href, '_blank', 'width=600, height=600' ); return false;">쪽지쓰기</a></li>
							</ul>
						</div>

						<input type="button" value="삭제" class="btn btn-outline-info" id="wri_m_bt"
							onclick="chkDel();">

					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		function checkAll() {
			var is_checked = document.getElementById("allCheck").checked;
			var RowCheck = document.getElementsByName("RowCheck");
			var rowCnt = RowCheck.length;
			if (is_checked == true) {
				for (var i = 0; i <= rowCnt; i++) {
					document.getElementsByName("RowCheck")[i].checked = true;
				}
			} else {
				for (var i = 0; i <= rowCnt; i++) {
					document.getElementsByName("RowCheck")[i].checked = false;
				}
			}
		}

		function chkDel() {
			var url = "";
			var valueArr = new Array();
			var list = $("input[name='RowCheck']");
			for (var i = 0; i < list.length; i++) {
				if (list[i].checked) {
					valueArr.push(list[i].value);
					console.log(valueArr);
				}
			}
			if (valueArr.length == 0) {
				alert("삭제할 쪽지가 없습니다.");
			} else {
				var chk = confirm("정말 삭제하시겠습니까?");
				$.ajax({
					url : 'message/result7',
					type : 'POST',
					traditional : true,
					data : {
						valueArr : valueArr
					},
					success : function(jdata) {
						if (jdata = 1) {
							alert("삭제가 완료되었습니다.");
							location.replace("message")
						} else {
							alert("삭제 실패");
						}
					}
				});
			}
		}
	</script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</body>
</html>