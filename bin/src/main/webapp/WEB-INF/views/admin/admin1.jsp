<%@page import="com.awoo.vo.PersonalInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/admin1.css">
<title>Insert title here</title>
<style type="text/css">
.container {
	height: auto;
}

nav {
	height: auto;
}

.scroll {
	height: 75vh;
}

.paging {
	display: flex;
}
.num{
	height: 100%;
	width: 26px;
 	margin: 0 2px; 
	border: 1px solid #14abab;;
	display: flex;
	justify-content:center;
	align-items:center;
/* 	font-weight: bold; */
 	border-radius:10px; 
	font-size:11px;
	color: black;
	}
	
	.num a{
	text-decoration : none;
	height: 100%;
	width: 100%;
	display: flex;
	justify-content:center;
	align-items:center;
	}
	.checked{
	background-color: #14abab;
	color: white;
	border: 1px solid #14abab;
	}
	
	.notchecked:hover{
	background-color: #c9eaec;
	color: black;
	border: 1px solid #c9eaec;
	}
	
	.paging {
		width: 100%;
	    justify-content: center;
	    padding-top: 1%;
	    height: auto;
	    align-items: center;
	}
	#ul {
		display: flex;
	}
	.span1{
		cursor: pointer;
	}
	.table1>tbody:nth-child(2n) {
	background-color: #f8f8f9;
}
</style>
</head>
<body>
	<div class="container-wrap">
		<div class="header">
			<img src="${pageContext.request.contextPath}/imges/logo.PNG" />
			<div class="header-logout">   <a href="${pageContext.request.contextPath}/logout">로그아웃</a> </div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner-bbs">
				<div class="inner-div-bbs">
					<div class="select">
						<div class="intro">
						
							<h3>직원 정보 관리</h3>
							<p>⏏홈>관리자>인사관리</p>
						</div>
						<form action="${pageContext.request.contextPath}/admin/details?page=1"
							method="post">
							<div class="div1">
								<h4>
									<img src="${pageContext.request.contextPath}/imges/admin2.png"
										class="timg2" />직원 상세 검색
								</h4>
								<div class="selectD">
									<select name="edepartment" id="category">
										<option value="">부서 선택</option>
										<option value="영업">영업</option>
										<option value="마켓팅">마켓팅</option>
										<option value="개발">개발</option>
										<option value="인사">인사</option>
										<option value="회계">회계</option>
									</select> <select name="eposition" id="category">
										<option value="">직책 선택</option>
										<option value="부장">부장</option>
										<option value="대리">대리</option>
										<option value="사원">사원</option>
										<option value="수습">수습</option>
										<option value="팀장">팀장</option>
									</select> <select name="ehiredType" id="category">
										<option value="">고용 형태 선택</option>
										<option value="정규직">정규직</option>
										<option value="비정규직">비정규직</option>
									</select>
									<div id="category" onclick="test()">
										<p id="categoryA">상세조건</p>
										<img id="categoryA"
											src="${pageContext.request.contextPath}/imges/down.JPG">
									</div>
									<button class="btn1">검색하기</button>
								</div>
								<div id="detailS">
									<table id="t1">
										<tr>
											<td style="width: 13.5%;">재직상태</td>
											<td><input type="checkbox" name="allCheck1"
												id="allCheck1" onclick="checkAll1()">전체</td>
											<td><input type="checkbox" name="estatus1" id="estatus1" value="재직">재직</td>
											<td><input type="checkbox" name="estatus1" id="estatus1" value="퇴직">퇴직</td>
											<td><input type="checkbox" name="estatus1" id="estatus1" value="휴직">휴직</td>
										</tr>
									</table>
									<table id="t2">
										<tr>
											<td>입사기간</td>
											<td><input type="date" name="ehiredDate" id="startDate"
												placeholder="(시작일)"> ~ <input type="date"
												name="date" id="endDate" placeholder="(종료일)"></td>
											<td><span id="s1" class="styleA" onclick="change()">최근
													1개월</span></td>
											<td><span id="s2" class="styleA" onclick="change()">최근
													2개월</span></td>
											<td><span id="s3" class="styleA" onclick="change()">최근
													3개월</span></td>
										</tr>
									</table>
								</div>
							</div>
						</form>
					</div>
					<div class="table" style="width: 100%;">
						<h4>
							<img src="${pageContext.request.contextPath}/imges/total.png"
								class="timg" />총 <span id="count"></span>명
						</h4>
						<form action="${pageContext.request.contextPath}/admin/updateD?page=1"
							method="post" id="form1">
							<div id="EpTable">
								<div class="tbtn1">
									<button id="modal_open" type="button">선택 직원 정보 수정</button>
									<button id="newEp" type="button">신규 직원 등록</button>
								</div>
								<div class="scroll">

									<table id="table1" class="table1">
										<tr>
											<th><input type="checkbox" name="allCheck" id="allCheck" onclick="checkAll()"></th>
											<th>No.</th>
											<th>이름</th>
											<th>사원번호</th>
											<th>부서</th>
											<th>직책</th>
											<th>입사일</th>
											<th>고용형태</th>
											<th>총 연차 수</th>
											<th>재직 상태</th>
											<th>상세보기</th>
										</tr>
										<c:forEach var="i" items="${list}" begin="${10*(page-1)}"
											end="${(10*(page-1))+9}">
											<tr>
												<td><input type="checkbox" name="empno" id="empno"
													value="${i.empno}" value1="${i.name}" value2="${i.edepartment}"></td>
												<td>${i.id}</td>
												<td>${i.name}</td>
												<td>${i.empno}</td>
												<td>${i.edepartment}</td>
												<td>${i.eposition}</td>
												<td>${i.ehiredDate}</td>
												<td>${i.ehiredType}</td>
												<td>${i.totalHoliday}</td>
												<td>${i.estatus}</td>
												<td><a
													href="${pageContext.request.contextPath}/admin/detail/${i.id}" style="color: #ababaf;">상세보기</a></td>
											</tr>
											
											<script type="text/javascript">
												let c = ${list.size()};
												const count = document.getElementById("count");
												count.innerText = c;
											</script>
											
										</c:forEach>
									</table>

									<div class="paging">
										
										<c:choose>
										<c:when test="${param.page == 1}">
											<div class="num">
												<span id="prev" style="color: #14abab;">◀</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="num">
												<a id="prev" href="admin?page=${param.page-1}">◀</a>
											</div>
										</c:otherwise>
									</c:choose>
										<%
										int Ppage = Integer.parseInt((String) request.getParameter("page"));
										int begin = (Ppage - 1) / 10 <= 0 ? 1 : (int) Math.ceil((Ppage - 1) / 10) * 10 + 1;

										List<PersonalInfoVO> list = (List<PersonalInfoVO>) request.getAttribute("list");

										int celi = (int) Math.ceil(list.size() / 10);
										int endPage = list.size() == 0 ? 1 : celi - begin > 10 ? begin + 9 : celi + 1;
										%>
										<c:forEach begin="<%=begin%>" end="<%=endPage%>"
											varStatus="status" var="var">
											<c:choose>
												<c:when test="${param.page eq var}">
													<div class="num checked">
														<span>${var}</span>
													</div>
												</c:when>
												<c:otherwise>
													<div class="num notchecked">
														<a href="admin?page=${var}">${var}</a>
													</div>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${param.page} == <%=endPage%>">
												<div class="num">
													<span id="next" style="color: #14abab;">▶</span>
												</div>
											</c:when>
											<c:otherwise>
												<div class="num">
													<a id="next" href="admin?page=${param.page+1}">▶</a>
												</div>
											</c:otherwise>
										</c:choose>

									</div>
								</div>
							</div>

							<div class="modal_dim" id="modal_dim">
								<div class="modal_wrap">
									<div class="modal">
										<div class="mdiv1">
											<h4>선택 직원정보 수정</h4>
											<h5 id="exit">X</h5>
										</div>
										<div class="mdiv2">
											<h4>
												선택직원 <span id="mspan"></span>명
											</h4>
											<div class="mdiv2-1">
												<h5 style="color: #aaabad;">직원추가</h5>
												<input type="text" name="" id="" class="minput"
													placeholder="입력해주세요">
											</div>
										</div>
										<div class="mdiv3">
											<ul id="ul"></ul>
										</div>
										<div class="mselect">
											<div class="sdiv1">
												<h4>부서</h4>
												<select name="edepartment" id="mcategory" class="m1">
													<option value="">변경없음</option>
													<option value="영업">영업</option>
													<option value="마켓팅">마켓팅</option>
													<option value="개발">개발</option>
													<option value="인사">인사</option>
													<option value="회계">회계</option>
												</select>
											</div>
											<div class="sdiv2">
												<h4>직책</h4>
												<select name="eposition" id="mcategory" class="m2">
													<option value="">변경없음</option>
													<option value="부장">부장</option>
													<option value="대리">대리</option>
													<option value="사원">사원</option>
													<option value="수습">수습</option>
													<option value="팀장">팀장</option>
												</select>
											</div>
											<div class="sdiv3">
												<h4>고용형태</h4>
												<select name="ehiredType" id="mcategory">
													<option value="">고용 형태 선택</option>
													<option value="정규직">정규직</option>
													<option value="비정규직">비정규직</option>
												</select>
											</div>
											<div class="sdiv4">
												<h4>재직상태</h4>
												<select name="estatus" id="mcategory">
													<option value="">변경없음</option>
													<option value="재직">재직</option>
													<option value="퇴직">퇴직</option>
													<option value="휴직">휴직</option>
												</select>
											</div>
										</div>
										<div class="bdiv">
											<button class="mbutton">수정하기</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
					<!-- ------------------------------------------------------------------------------ -->
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		/*신규 직원 등록*/
		document.getElementById("newEp").addEventListener("click", function() {
			location.href = "${pageContext.request.contextPath}/admin/newE";
		});
		/*리스트 전체 체크*/
		function checkAll() {
			const checkboxes = document.getElementsByName("empno");
			if (document.getElementById("allCheck").checked == true) {
				for (var i = 0; i < checkboxes.length; i++)
					checkboxes[i].checked = true;
			}
			if (document.getElementById("allCheck").checked == false) {
				for (var i = 0; i < checkboxes.length; i++)
					checkboxes[i].checked = false;
			}
		}

		/*상세 보기 display*/
		function test() {
			var con = document.getElementById("detailS");
			con.style.display = (con.style.display != 'none') ? "none" : "flex";
		}

		/*상세보기 전체 체크*/
		function checkAll1() {
			const checkboxes = document.getElementsByName("estatus1");
			if (document.getElementById("allCheck1").checked == true) {
				for (var i = 0; i < checkboxes.length; i++)
					checkboxes[i].checked = true;
			}
			if (document.getElementById("allCheck1").checked == false) {
				for (var i = 0; i < checkboxes.length; i++)
					checkboxes[i].checked = false;
			}
		}

		/*버튼 변화 (1개월,2개월,3개월)*/
		var s = [ "s1", "s2", "s3" ];

		function change() {

			var save = "";
			var index = "";
			var month = "";

			for (let i = 0; i < s.length; i++) {
				document
						.getElementById(s[i])
						.addEventListener(
								"click",
								function() {
									if (document.getElementById(s[i]).classList
											.contains("styleA")) {
										document.getElementById(s[i]).classList
												.replace("styleA", "styleB");
										month = s[i].substring(1, 2);
										let d = new Date();
										d.setMonth(d.getMonth() - (month));
										document.getElementById("endDate").valueAsDate = new Date();
										document.getElementById("startDate").valueAsDate = d;
										save = s[i];
										index = i;
										s.splice(i, 1);
										for (let j = 0; j < s.length; j++) {
											if (document.getElementById(s[j]).classList
													.contains("styleB")) {
												document.getElementById(s[j]).classList
														.replace("styleB",
																"styleA");
											}
										}
										s.splice(index, 0, save);
									}
								});
			}
		}

		/*날짜 설정(1개월, 2개월,3개월)*/
		document.getElementById("startDate").addEventListener(
				"click",
				function() {
					for (let i = 0; i < s.length; i++) {
						if (document.getElementById(s[i]).classList
								.contains("styleB")) {
							document.getElementById(s[i]).classList.replace(
									"styleB", "styleA");
						}
					}
					document.getElementById("startDate").valueAsDate = null;
					document.getElementById("endDate").valueAsDate = null;
				});

		/* 모달창 끄기*/
		
		document.getElementById("exit").addEventListener("click", function() {
			document.getElementById("modal_dim").style.display = "none";	
				const ul = document.getElementById("ul");

				while(ul.hasChildNodes()){
					ul.removeChild( ul.firstChild );  
				}
            	
		});
		
		
		/*모달창 켜기*/
		document
				.getElementById("modal_open")
				.addEventListener(
						"click",
						function() {
							const checkboxes = document
									.getElementsByName("empno");
							var j = 0;
							for (var i = 0; i < checkboxes.length; i++) {
								if (checkboxes[i].checked == true) {
									j++;
								}
							}
							if (j > 0) {
								document.getElementById("modal_dim").style.display = "flex";
							} else {
								alert("정보를 수정할 직원을 선택해 주세요.");
								document.getElementById("modal_dim").style.display = "flex";
							}
						});
		/*모달창 select 색 변경*/
		document
				.getElementById("mcategory")
				.addEventListener(
						"change",
						function() {
							if (document.getElementById("mcategory").style.backgroundColor = '#f8fafb') {
								document.getElementById("mcategory").style.backgroundColor = "white";
							}
						});
		
		/*모달창 div에 li추가*/
		document.getElementById("modal_open").addEventListener(
				"click",
				function() {
					const checkboxes = document.getElementsByName("empno");
					const ul = document.getElementById("ul");
					const mspan = document.getElementById("mspan");
					const li1 = document.getElementsByName("li1");

					for (var i = 0; i < checkboxes.length; i++) {
						if (checkboxes[i].checked) {
							const li = document.createElement("li");
							const name = checkboxes[i].getAttribute("value1");
							const edepartment = checkboxes[i]
									.getAttribute("value2");
							const span = document.createElement("span");

							span.innerText = "X"
							span.setAttribute("id", "remove"+i);
							span.setAttribute("value", name);
							span.setAttribute("class", "span1");

							li.innerText = name + "(" + edepartment + ")";
							li.setAttribute("name", "li1");
							li.setAttribute("value", name);
							li.append(span);
							
							ul.append(li);
							
						
						}
					}
							
							mspan.innerText = li1.length;
					
					/*모달창 span 삭제*/
					
					for (var i = 0; i < checkboxes.length; i++) {
						document.getElementById("remove"+i).addEventListener("click", function(e) {	
						
							const del = e.target;  // span ("X")
							const deleteAll = del.parentNode; // <li><span></span></li>
							checkboxes[i-1].checked = false;
							deleteAll.remove();
							
							mspan.innerText = li1.length;
						});
						
					}
				});
		
		
	</script>

</body>
</html>