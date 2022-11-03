<%@page import="com.awoo.vo.InfoVO"%>
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
	href="${pageContext.request.contextPath}/resources/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/Profile/Profile.css">
<title>Insert title here</title>
<style type="text/css">
.btnzip {
	display: flex;
	flex-direction: row;
	width: 100%;
}

.zip {
	display: flex;
	justify-content: flex-end;
}

.zipimg {
	
}
</style>
</head>
<body>
	<div class="container-wrap">
		<div class="header">
			<div class="navbar__toogleBtn" id="mobile-btn">☰</div>
			<img
				src="${pageContext.request.contextPath}/resources/imges/logo.PNG" />
			<div class="header-logout">
				<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
			</div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner-bbs">
				<div class="inner-div-bbs">
					<!-- 각자 필요한 부분 넣기 -->
					<c:forEach items="${myInfo}" var="info">
					<div class="scroll">
						<div class="intro">
							<h3>${info.name}님의 상세 정보</h3>
							<p>⏏홈>내 정보>나의 상세정보</p>
						</div>

						<div class="personal-wrap">
							<div class="prodiv">
								<img id="showimg" src="${pageContext.request.contextPath}/upload/user.png">
								<label for="proimg" id="img">사진등록</label><input type="file"
									name="proimg" id="proimg" accept="image/*" multiple>
							</div>
							<div id="personal">
								<table>
									<tr>
										<td class="label">이름<span>*</span></td>
										<td><input type="text" name="name" id="name"
											value="${info.name}" required></td>
										<td class="label">성별<span>*</span></td>
										<td><input type="radio" name="gender" id="genderm"
											value="M"> 남자 <input type="radio" name="gender"
											id="genderf" value="F"> 여자</td>
									</tr>
									<tr>
										<td class="label">생년월일<span>*</span></td>
										<td colspan='3'><input type="date" name=birthday
											id="birthday" value="${info.birthday}" required></td>
									</tr>
									<tr>
										<td class="label">이메일<span>*</span></td>
										<td colspan='3'><input type="text" name="email_id"
											id="email_id" value="${email_id}" required> @ <input
											type="text" name="email_domain" id="email_domain"
											value="${email_domain}" required /> <select class="select"
											id="email_select" required>
												<option value=" ">직접입력</option>
												<option value="naver.com">naver.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="hanmail.net">hanmail.net</option>
												<option value="hotmail.com">hotmail.com</option>
												<option value="korea.com">korea.com</option>
												<option value="nate.com">nate.com</option>
												<option value="yahoo.com">yahoo.com</option>
										</select></td>
									</tr>
									<tr>
										<td id="noB" class="label">사원번호<span>*</span></td>
										<td id="noB"><input type="text" name="empno" id="empno"
											required value="${info.empno}"></td>
										<td id="noB" class="label">비밀번호<span>*</span></td>
										<td id="noB"><input type="password" name="password"
											id="password" value="${info.password}" readonly></td>
									</tr>
								</table>
							</div>
						</div>
						<div id="employee" style="width: 100%;">
							<table>
								<tr>
									<td class="label">부서</td>
									<td><select class="edepartment" id="edepartment"
										name="edepartment">
											<option value=" - ">※선택해주세요</option>
											<option value="영업">영업</option>
											<option value="마켓팅">마켓팅</option>
											<option value="개발">개발</option>
											<option value="인사">인사</option>
											<option value="회계">회계</option>
									</select></td>
									<td class="label">직책<span>*</span></td>
									<td><select name="eposition" id="eposition" required>
											<option value="">※선택해주세요</option>
											<option value="부장">부장</option>
											<option value="대리">대리</option>
											<option value="사원">사원</option>
											<option value="수습">수습</option>
											<option value="팀장">팀장</option>
									</select></td>
									<td class="label">재직 상태<span>*</span></td>
									<td><select name="estatus" id="estatus" required>
											<option value="">※선택해주세요</option>
											<option value="재직">재직</option>
											<option value="휴직">휴직</option>
											<option value="퇴직">퇴직</option>
									</select></td>
								</tr>
								<tr>
									<td class="label">고용 형태<span>*</span></td>
									<td><select name="ehiredType" id="ehiredType" required>
											<option value="">※선택해주세요</option>
											<option value="정규직">정규직</option>
											<option value="비정규직">비정규직</option>
									</select></td>
									<td class="label">총 연차 수<span>*</span></td>
									<td><input type="text" name="total_holiday"
										id="total_holiday" value="${info.totalHoliday}" required></td>
									<td class="label">관리자 여부</td>
									<td><input type="checkbox" name="check_admin"
										id="check_admin"></td>
								</tr>
								<tr>
									<td class="label">입사일<span>*</span></td>
									<td colspan='5'><input type="date" name="ehiredDate"
										id="ehiredDate" value="${info.ehiredDate}" required></td>
								</tr>
								<tr>
									<td class="label">전화번호</td>
									<td colspan='1'><input type="number" name="telNumber"
										id="telNumber" placeholder="번호만 입력해 주세요"
										value="${info.telNumber}"></td>
									<td class="label">핸드폰<span>*</span></td>
									<td colspan='3'><input type="number" name="phoneNumber"
										id="phoneNumber" required placeholder="번호만 입력해 주세요"
										value="${info.phoneNumber}"></td>
								</tr>
								<tr>
									<td id="noB" class="label">주소</td>
									<td colspan='5'>
										<div style="display: flex; flex-direction: row;">
											<input type="text" id="addre" value="${info.address}"
												style="width: 100%" />
											<div style="display: none;" id="addresszip"
												style="display: flex; flex-direction: row;">
												<input type="text" name="postcode" id="postcode"
													placeholder="우편번호"> <input type="text"
													name="address" id="address" placeholder="주소"> <input
													type="text" name="detailAddress" id="detailAddress"
													placeholder="상세주소"> <input type="text"
													name="extraAddress" id="extraAddress" placeholder="참고항목">
											</div>
											<input type="button" onclick="execDaumPostcode()"
												value="우편번호 찾기"><br>
										</div>
										<div id="wrap"
											style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
											<img
												src="//t1.daumcdn.net/postcode/resource/images/close.png"
												id="btnFoldWrap"
												style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
												onclick="foldDaumPostcode()" alt="접기 버튼">
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>