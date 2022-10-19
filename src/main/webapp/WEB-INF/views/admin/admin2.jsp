<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/admin2.css">
<title>Insert title here</title>
</head>
<body>

	<div class="container-wrap">
		<div class="header">
			<img src="${pageContext.request.contextPath}/imges/logo.PNG" />
			<div class="header-logout">로그아웃 버튼</div>
		</div>
		<div class="container">
			<jsp:include page="../include/menu.jsp"></jsp:include>
			<div class="container-inner-bbs">
				<div class="inner-div-bbs">
					<!-- 각자 필요한 부분 넣기 -->
					<div class="scroll"
						style="overflow: auto; width: 100%; height: 100%">
						<div class="intro">
							<h2>신규 직원 등록</h2>
							<br />
							<p>⏏홈>관리자>인사관리>직원 개별 등록</p>
						</div>
						<form action="${pageContext.request.contextPath}/" class="form1">
							<div class="personal-wrap">
								<div class="prodiv">
									<img id="showimg"
										src="${pageContext.request.contextPath}/imges/user.png">
									<label for="proimg" id="img">사진등록</label><input type="file"
										name="proimg" id="proimg" accept="image/*">
								</div>
								<div id="personal">
									<table>
										<tr>
											<td class="label">이름<span>*</span></td>
											<td><input type="text" name="name" id="name" required></td>
											<td class="label">성별<span>*</span></td>
											<td><input type="radio" name="gender" id="gender"
												value="M"> 남자 <input type="radio" name="gender"
												id="gender" value="F"> 여자</td>
										</tr>
										<tr>
											<td class="label">생년월일<span>*</span></td>
											<td colspan='3'><input type="date" name="bitrhday"
												id="bitrhday" required></td>
										</tr>
										<tr>
											<td class="label">이메일<span>*</span></td>
											<td colspan='3'><input type="text" name="email_id"
												id="email_id" required> @ <input type="text"
												name="email_domain" id="email_domain" required /> <select
												class="select" id="email_select" required>
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
												required></td>
											<td id="noB" class="label">비밀번호<span>*</span></td>
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
											<td><input type="text" name="edepartment"
												id="edepartment"></td>
											<td class="label">직책<span>*</span></td>
											<td><input type="text" name="eposition" id="eposition"
												required></td>
											<td class="label">재직 상태<span>*</span></td>
											<td><input type="text" name="estatus" id="estatus"
												required placeholder="재직,휴가,퇴직"></td>
										</tr>
										<tr>
											<td class="label">고용 형태<span>*</span></td>
											<td><input type="text" name="ehiredType" id="ehiredType"
												required placeholder="정규직, 비정규직"></td>
											<td class="label">총 연차 수<span>*</span></td>
											<td><input type="text" name="total_holiday"
												id="total_holiday" required></td>
											<td class="label">관리자 여부</td>
											<td><input type="checkbox" name="check_admin"
												id="check_admin"></td>
										</tr>
										<tr>
											<td class="label">입사일<span>*</span></td>
											<td colspan='5'><input type="date" name="ehiredDate"
												id="ehiredDate" required></td>
										</tr>
										<tr>
											<td class="label">전화번호</td>
											<td colspan='2'><input type="number" name="telNumber"
												id="telNumber" placeholder="000-000-0000"></td>
											<td class="label">핸드폰<span>*</span></td>
											<td colspan='2'><input type="number" name="phone_number"
												id="phone_number" required placeholder="000-000-0000"></td>
										</tr>
										<tr>
											<td id="noB" class="label">주소</td>
											<td id="noB" colspan='5'>
												<div>
													<input type="text" id="postcode" placeholder="우편번호">
													<input type="button" onclick="execDaumPostcode()"
														value="우편번호 찾기"><br> <input type="text"
														id="address" placeholder="주소"> <input type="text"
														id="detailAddress" placeholder="상세주소"> <input
														type="text" id="extraAddress" placeholder="참고항목">
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
									src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                    email.disabled = true;   
                    email.value = email_select; 
                }else {
                    email.value = null; 
                    email.disabled = false;   
                }
            });
        </script>
							
							<br>
							<button class="insertbtn">등록하기</button>
						</form>
						<script>
        document.getElementById("email_select").addEventListener("click",function(){
            
        });

        document.getElementById("bitrhday").valueAsDate = new Date();
        document.getElementById("ehiredDate").valueAsDate = new Date();
        const InputFile = document.getElementById("proimg");
        document.getElementById("proimg").addEventListener("change", function(){
            const fileReader = new FileReader();
            const selectedFile = [...InputFile.files];
            fileReader.readAsDataURL(selectedFile[0]);

            fileReader.onload = function(){
                document.getElementById("showimg").src = fileReader.result;
            }
        });

        // const fileInput = document.getElementById("proimg");

        // const hadleFile = (e) => {
        //     const selectedFile = [...fileInput.files];
        //     const fileReader = new FileReader();
        // }
    </script>

						<!-- ------------------------------------------------------------- -->
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>