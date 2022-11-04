<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/admin2.css">
<title>Insert title here</title>
<style type="text/css">
	.container {
		height: auto;
	}
	nav {
		height: auto;
	}
	.btnzip{
		display: flex;
		flex-direction: row;
		width: 100%;
	}
	.zip {
	    display: flex;
	    justify-content: flex-end;
	}
	.zipimg{
		
	}
</style>
</head>
<body>

	<div class="container-wrap">
		<div class="header">
			<div class="navbar__toogleBtn" id="mobile-btn">☰</div>
			<img src="${pageContext.request.contextPath}/resources/imges/logo.PNG" />
			<div class="header-logout">   <a href="${pageContext.request.contextPath}/logout">로그아웃</a> </div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner-bbs">
				<div class="inner-div-bbs">
					<!-- 각자 필요한 부분 넣기 -->
					<div class="scroll">
						<div class="intro">
							<h3>직원 정보 수정</h3>
							<br />
							<p>⏏홈>관리자>인사관리>직원 개별 등록</p>
						</div>
						<form action="${pageContext.request.contextPath}/admin/insertData"
							class="form1" method="post" enctype="multipart/form-data">
							<input name="page" value="1" style="display: none;" />
							<div class="personal-wrap">
								<div class="prodiv">
									<img id="showimg"
										src="${pageContext.request.contextPath}/upload/user.png">
									<label for="proimg" id="img">사진등록</label><input type="file"
										name="proimg" id="proimg" accept="image/*" multiple>
								</div>
								<div id="personal">
									<table>
										<tr>
											<td class="label">이름<span class="redspan">*</span></td>
											<td><input type="text" name="name" id="name" required value="${pVO.name }" disabled></td>
											<td class="label">성별<span class="redspan">*</span></td>
											<td>
												<c:if test="${pVO.gender eq 'M' }">
													<input type="radio" name="gender" id="gender" value="M" checked> 남자 
													<input type="radio" name="gender" id="gender" value="F"> 여자
												</c:if>
												<c:if test="${pVO.gender eq 'F' }">
													<input type="radio" name="gender" id="gender" value="M"> 남자 
													<input type="radio" name="gender" id="gender" value="F" checked> 여자
												</c:if>
											</td>
										</tr>
										<tr>
											<td class="label">생년월일<span class="redspan">*</span></td>
											<td colspan='3'><input type="date" name=birthday
												id="birthday" required value="${pVO.birthday }"></td>
										</tr>
										<tr>
											<td class="label">이메일<span class="redspan">*</span></td>
											<td colspan='3'>
												<input type="text" name="email_id" id="email_id" required value="${pVO.email.split('@')[0] }"> @
												<input type="text" name="email_domain" id="email_domain" required  value="${pVO.email.split('@')[1] }"/>
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
											<td id="noB" class="label">사원번호<span class="redspan">*</span></td>
											<td id="noB"><input type="text" name="empno" id="empno"
												required value="${eVO.empno}" readonly></td>
											<td id="noB" class="label">비밀번호<span class="redspan">*</span></td>
											<td id="noB"><input type="password" name="password"
												id="password" value="abc1" readonly></td>
										</tr>
									</table>
								</div>
							</div>

							<div id="employee" style="width: 100%;">
								<table>
									<tr>
										<td class="label">부서</td>
										<td>
											<select class="edepartment" id="edepartment" name="edepartment">
												<option value="${eVO.edepartment }">${eVO.edepartment }</option>
<!-- 												<option value=" - ">※선택해주세요</option> -->
<%-- 												<c:forEach var = "d" items="${listD}"> --%>
<%-- 													<option value="${d.department}">${d.department}</option> --%>
<%-- 												</c:forEach> --%>
											</select>
										</td>
										<td class="label">직책<span class="redspan">*</span></td>
										<td>
											<select name="eposition" id="eposition"
											required>
												<option value="${eVO.eposition }">${eVO.eposition }</option>
<!-- 												<option value="">※선택해주세요</option> -->
<%-- 												<c:forEach var = "p" items="${listP}"> --%>
<%-- 													<option value="${p.position}">${p.position}</option> --%>
<%-- 												</c:forEach> --%>
											</select>
										</td>
										<td class="label">재직 상태<span class="redspan">*</span></td>
										<td>
											<select name="estatus" id="estatus"
											required>
												<option value="${eVO.estatus }">${eVO.estatus }</option>
<!-- 												<option value="">※선택해주세요</option> -->
<!-- 												<option value="재직">재직</option> -->
<!-- 												<option value="휴직">휴직</option> -->
<!-- 												<option value="퇴직">퇴직</option> -->
											</select>
										</td>
									</tr>
									<tr>
										<td class="label">고용 형태<span class="redspan">*</span></td>
										<td>
											<select name="ehiredType" id="ehiredType"
											required>
												<option value="${eVO.ehiredType }">${eVO.ehiredType }</option>
<!-- 												<option value="">※선택해주세요</option> -->
<!-- 												<option value="정규직">정규직</option> -->
<!-- 												<option value="비정규직">비정규직</option> -->
											</select>
										</td>
										<td class="label">총 연차 수<span class="redspan">*</span></td>
										<td><input type="text" name="total_holiday"
											id="total_holiday" value="${eVO.totalHoliday }" required readonly></td>
										<td class="label">관리자 여부</td>
										<c:if test="${eVO.checkAdmin == 0 }">
											<td><input type="checkbox" name="check_admin"
												id="check_admin" disabled></td>
										</c:if>
										<c:if test="${eVO.checkAdmin == 1 }">
											<td><input type="checkbox" name="check_admin"
												id="check_admin" disabled checked></td>
										</c:if>
									</tr>
									<tr>
										<td class="label">입사일<span class="redspan">*</span></td>
										<td colspan='5'><input type="date" name="ehiredDate"
											id="ehiredDate" value="${eVO.ehiredDate }" required readonly></td>
									</tr>
									<tr>
										<td class="label">전화번호</td>
										<td colspan='1'><input type="number" name="telNumber"
											id="telNumber" placeholder="번호만 입력해 주세요" value="0${pVO.telNumber }"></td>
										<td class="label">핸드폰<span class="redspan">*</span></td>
										<td colspan='3'><input type="number" name="phoneNumber"
											id="phoneNumber" required placeholder="번호만 입력해 주세요" value="${pVO.phoneNumber }"></td>
									</tr>
									<tr>
										<td id="noB" class="label">주소</td>
										<td id="noB" colspan='5'>
											<div>
												<input type="text" name="postcode" id="postcode" placeholder="우편번호">
												<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br> 
												<input type="text" name="address" id="address" placeholder="주소" value="${pVO.address.split(' ')[0]} ${pVO.address.split(' ')[1]} ${pVO.address.split(' ')[2] ${pVO.address.split(' ')[3]}">
												<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" value="${pVO.address.split(' ')[4]} ${pVO.address.split(' ')[5]} ${pVO.address.split(' ')[6]}"> 
												<input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목">
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


		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
		</script>
		
		<script>
            var element_wrap = document.getElementById('wrap');

            function foldDaumPostcode() {
                element_wrap.style.display = 'none';
            }

            function execDaumPostcode() {
                // var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
                new daum.Postcode({
                    oncomplete: function(data) {
                        var addr = ''; 
                        var extraAddr = ''; 

                        if (data.userSelectedType === 'R') { 
                            addr = data.roadAddress;
                        } else { 
                            addr = data.jibunAddress;
                        }

                        if(data.userSelectedType === 'R'){
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraAddr += data.bname;
                            }
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            if(extraAddr !== ''){
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            document.getElementById("extraAddress").value = extraAddr;
                        
                        } else {
                            document.getElementById("extraAddress").value = '';
                        }

                        document.getElementById('postcode').value = data.zonecode;
                        document.getElementById("address").value = addr;
                        document.getElementById("detailAddress").focus();

                        element_wrap.style.display = 'none';

                        document.body.scrollTop = currentScroll;
                    },

                    onresize : function(size) {
                        element_wrap.style.height = size.height+'px';
                    },
                    width : '100%',
                    height : '100%'
                }).embed(element_wrap);

                element_wrap.style.display = 'block';
            }
        </script>
        
		<script>
            document.getElementById("email_select").addEventListener("change",function(){
                const email_select = document.getElementById("email_select").value;
                const email = document.getElementById("email_domain");
                if(email_select != " "){
                    email.readonly  = true;   
                    email.value = email_select; 
                }else {
                    email.value = null; 
                    email.readonly  = false;   
                }
            });
        </script>

							<br>
							<div class="btnzip"> 
								<div class="zip" style="width: 60%">
									<button type="submit" class="insertbtn">등록하기</button>
								</div>
								<div class="zip" style="width: 40%">
									<a style="font-size: 1.2rem;" href="${pageContext.request.contextPath}/admin?page=1">↩</a>
								</div>
							</div>
						</form>
	<script>
        document.getElementById("birthday").valueAsDate = new Date();
        document.getElementById("ehiredDate").valueAsDate = new Date();
    </script>
    <script type="text/javascript">
        const InputFile = document.getElementById("proimg");
        document.getElementById("proimg").addEventListener("change", function(){
            const fileReader = new FileReader();
            const selectedFile = [...InputFile.files];
            fileReader.readAsDataURL(selectedFile[0]);

            fileReader.onload = function(){
                document.getElementById("showimg").src = fileReader.result;
            }
        });
        </script>  
    

<!-- -------------------------------------------------------------------------------- -->
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>