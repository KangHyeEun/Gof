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
					
						<div class="scroll">
							<div class="intro">
								<h3>${jy.name}님의 상세정보</h3>
								<p>⏏홈>내 정보>나의 상세정보</p>
							</div>
							<form action="${pageContext.request.contextPath}/Profile/updateData"
								class="form1" method="post" enctype="multipart/form-data">
								<input name="page" value="1" style="display: none;" />
								<div class="personal-wrap">
									<div class="prodiv">
									<c:choose>
										<c:when test="${!empty fileList}">
											<c:forEach var="img" items="${fileList}">
												<img id="showimg" 
													src="${pageContext.request.contextPath}/upload/${img.fileName}">
											</c:forEach>
										</c:when>
										<c:otherwise>
											<img id="showimg"
											src="${pageContext.request.contextPath}/upload/user.png">
										</c:otherwise>
									</c:choose>
										<label for="proimg" id="img">사진수정</label><input type="file"
											name="proimg" id="proimg" accept="image/*">
									</div>
									<div id="personal">
										<table>
											<tr>
												<td class="label">이름<span></span></td>
												<td>${jy.name}</td>
	
												<td class="label">성별<span></span></td>
												<td>${jy.gender}</td>
											</tr>
	
											<tr>
												<td class="label">생년월일<span></span></td>
												<td colspan='3'>${jy.birthday}</td>
											</tr>
											<tr>
												<td class="label">이메일<span></span></td>
												<td colspan='3'>
													<input type="text" name="emailf" id="emailf" value="${jy.emailf}" required> @ 
													<input type="text" name="emails" id="emails" value="${jy.emails}" required /> 
													<select class="select" id="email_select" required>
														<option value=" ">직접입력</option>
														<option value="naver.com">naver.com</option>
														<option value="gmail.com">gmail.com</option>
														<option value="hanmail.net">hanmail.net</option>
														<option value="hotmail.com">hotmail.com</option>
														<option value="korea.com">korea.com</option>
														<option value="nate.com">nate.com</option>
														<option value="yahoo.com">yahoo.com</option>
													</select>
												</td>
											</tr>
											<tr>
												<td id="noB" class="label">사원번호<span></span></td>
												<td id="noB">${jy.empno}</td>
												<td id="noB" class="label">비밀번호<span></span></td>
												<td id="noB">
													<input type="password" name="password" id="password" value="${jy.password}">
												</td>
											</tr>
										</table>
									</div>
								</div>
								<div id="employee" style="width: 100%;">
									<table>
										<tr>
											<td class="label">부서</td>
											<td>${jy.edepartment}</td>
											<td class="label">직책<span></span></td>
											<td>${jy.eposition}</td>
	
										</tr>
										<tr>
											<td class="label">고용 형태<span></span></td>
											<td>${jy.ehiredType}</td>
											<td class="label">총 연차 수<span></span></td>
											<td>${jy.totalHoliday}</td>
											<!--<td class="label">관리자 여부</td>
											<td><input type="checkbox" name="check_admin"
												id="check_admin"></td>-->
										</tr>
										<tr>
											<td class="label">입사일<span></span></td>
											<td>${jy.ehiredDate}</td>
											<td class="label">재직 상태<span></span></td>
											<td>${jy.estatus}</td>
										<tr>
											<td class="label">전화번호</td>
											<td colspan='1'>
												<input type="number" name="telNumber" id="telNumber" placeholder="번호만 입력해 주세요" value="${jy.telNumber}">
											</td>
											<td class="label"><span>핸드폰</span>
											</td>
											<td colspan='3'>
												<input type="number" name="phoneNumber" id="phoneNumber" required placeholder="번호만 입력해 주세요" value="${jy.phoneNumber}">
											</td>
										</tr>
										<tr>
											<td id="noB" class="label">주소</td>
											<td colspan='5'>
												<div style="display: flex; flex-direction: row;">
													<input type="text" name="address" id="address" value="${jy.address}" style="width: 100%" />
<!-- 													<div id="addresszip" style="display: flex; flex-direction: row;"> -->
<!-- 														<input type="text" name="address" id="address" placeholder="우편번호">  -->
<!-- 														<input type="text" name="address" id="address" placeholder="주소">  -->
<!-- 														<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">  -->
<!-- 														<input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목"> -->
<!-- 													</div> -->
<!-- 													<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br> -->
												</div>
												<div id="wrap" style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
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
								<br>
								<div class="btnzip">
									<div class="zip" style="width: 60%">
										<button type="submit" class="insertbtn" id="btn1">내정보 수정하기</button>
									</div>
								</div>
							</form>
							
			
						</div>
					
				</div>
			</div>
		</div>
	</div>
				<!-- 주소 찾기  ------------------------------------------------------------------------------------------------------>
		
          
        
		<!-- 이메일 박스 -------------------------------------------------------------------------------------------------------->
		<script>
            document.getElementById("email_select").addEventListener("change",function(){
                const email1 = document.getElementById("email_select").value;
                console.log(email1);
                
                document.getElementById("emails").value = email1;
            });

        
        /*프로필 사진 변경-----------------------------------------------------------------------------------------------------------------*/
        const InputFile = document.getElementById("proimg");
        document.getElementById("proimg").addEventListener("change", function(){
            const fileReader = new FileReader();
            const selectedFile = [...InputFile.files];
            fileReader.readAsDataURL(selectedFile[0]);

            fileReader.onload = function(){
                document.getElementById("showimg").src = fileReader.result;
            }
        });
		

        document.getElementById("btn1").addEventListener("click",function(){
        	alert("정상적으로 수정되었습니다.");
        })
        
    
    </script>
</body>
</html>