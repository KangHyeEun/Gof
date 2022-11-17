<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 비동기 댓글 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.1.min.js"></script>
<!-- 스타일 적용 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bbs/contentstyle.css" />

<title>Insert title here</title>
</head>
<body>

    <div class="header">
        <img src="${pageContext.request.contextPath}/resources/imges/logo.PNG" />
		<div class="header-logout">
			<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
		</div>
    </div>
    <div class="container">
        <jsp:include page="../include/menu.jsp"></jsp:include>
        <div class="container-inner-bbs">
            <div class="inner-div-bbs">
                <div class="content-title">
                    <h3>사내 게시판</h3>
                </div>

                <div class="content-nav">
                        <button id="return">목록</button>
                    <div class="adminbtn">
                        <c:if test="${bbsVO.ownerId eq personalInfoVO.empno || personalInfoVO.empno == 220102}">
                            <button id="modify">수정</button>
                            <button id="delete">삭제</button>
                        </c:if>
                    </div>
                </div>

                <div class="content-head">
                    <h3><span>[${bbsVO.category}]</span> &nbsp; ${bbsVO.title}</h3>
                    <div class="head-inner">
                        <div class="first-inner">
                            <p>작성자 ${bbsVO.owner}</p>
                            <p>부서 ${eVO.edepartment}</p>
                            <p>직위 ${eVO.eposition}</p>
                        </div>
                        <div class="second-inner">
                            <p>작성일 ${bbsVO.createDate}</p>
                        </div>
                    </div>
                </div>

                <div class="content-text" id="textarea">
                    ${bbsVO.content}
                </div>

                <div class="content-footer">
                    <h4>첨부파일<span><img src="https://uinnout.com/employee/images/clip.svg"></span></h4>
						<div>
							<h4>${countFiles} 개</h4>
						</div>
						<div>
							<c:forEach var="file" items="${filelist}">
								<a href="${pageContext.request.contextPath}/bbsPage/downloadFile/${file.localname}/${file.servername}">${file.localname}</a><br>
							</c:forEach>							
						</div>
                </div>
				
				<div class="comment-area">
					<!-- 댓글 적는 곳 -->
					<textarea name="comment" id="comment"></textarea>
					<button id="set-comment">등록</button>
				</div>
				
				<div id="comment-list">
					<!-- 댓글 달리는 곳 -->
				</div>
           </div>
       </div>
   </div>
	
<script type="text/javascript">

		//뒤로가기 버튼 이벤트------------------------------
		document.getElementById("return").addEventListener("click", function() {
			location.href = "${pageContext.request.contextPath}/bbsPage/bbs";
		});
		
		//댓글 불러오기-----------------------------------------------
		$(function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/bbsPage/comment/get/${bbsVO.id}",
				type:"GET",
				dataType : "json",
				success : function(data){
					console.log(data);
					for(const item of data){
						//owner_id를 가져옴
						let ownerid = ${personalInfoVO.empno};
						const commentList = document.querySelector("#comment-list");
						const div1 = document.createElement("div");
						div1.setAttribute("id", "comment-wrap");
						const div2 = document.createElement("div");
						div2.setAttribute("class", "comment-upper");
						const div3 = document.createElement("div");
						div3.setAttribute("class", "comment-upper-left");
						const span = document.createElement("span");
						span.setAttribute("class", "comment-upper-left-round");
						const div4 = document.createElement("div");
						div4.setAttribute("class", "comment-upper-right");
						const div5 = document.createElement("div");
						div5.setAttribute("id", "comment-context");
						const owner = document.createElement("p");
						owner.innerText = item.owner;
						const eposition = document.createElement("p");
						eposition.innerText = item.eposition;
						
						if(item.edepartment == "영업"){
							span.style.backgroundColor = "#41abab";
						}else if(item.edepartment == "인사"){
							span.style.backgroundColor = "purple";
						}else if(item.edepartment == "회계"){
							span.style.backgroundColor = "#272454";
						}else if(item.edepartment == "마케팅"){
							span.style.backgroundColor = "orange";
						}else {
							span.style.backgroundColor = "green";
						}
						
						const edepartment = document.createElement("p");
						edepartment.innerText = item.edepartment;
						const comment_p = document.createElement("p");
						comment_p.innerText = item.comment;
						const createDate = document.createElement("p");
						createDate.innerText = item.createDate;
						
						// 해당 유저가 쓴 댓글일 경우
						if(item.ownerId == ownerid){
							// 삭제 버튼
							const delete_button = document.createElement("button");
							delete_button.innerText = "삭제";
						
							delete_button.addEventListener("click", function(){
								let yn = confirm("삭제하시겠습니까?");
								if(yn){
									let comment_data = {id : item.id};
									$.ajax({
										url:"${pageContext.request.contextPath}/bbsPage/comment/delete",
										type:"DELETE",
										data:JSON.stringify(comment_data),
										contentType : "application/json; charset=utf-8",
										dataType : "html",
										success:function(data){
											div1.remove();
										}
									});
								}
							});
							div4.append(delete_button);
							
							// 수정 버튼
							const modify_button = document.createElement("button");
							modify_button.innerText = "수정";
							
							modify_button.addEventListener("click", function(){
								const edit_div = document.createElement("div");
								const edit_textarea = document.createElement("textarea");
								edit_textarea.setAttribute("id", "edit_textarea");
								edit_textarea.value = comment_p.innerText;
								const button_div = document.createElement("div");
								button_div.setAttribute("id", "button_div");
								const edit_modify = document.createElement("button");
								edit_modify.innerText = "수정완료";
								const edit_cancel = document.createElement("button");
								edit_cancel.innerText = "취소";
								edit_div.append(edit_textarea);
								edit_div.append(button_div);
								button_div.append(edit_modify);
								button_div.append(edit_cancel);
								div5.after(edit_div);
								div5.style.display = "none";
								
								// 취소 버튼 클릭 시 이벤트
								edit_cancel.addEventListener("click", function(){
									div5.style.display = "block";
									edit_div.remove();
								});
								
								// 수정완료 버튼 클릭 시 이벤트
								edit_modify.addEventListener("click", function(){
// 									alert("수정완료 버튼 클릭");
									if(confirm("수정하시겠습니까")){
										let comment = edit_textarea.value;
										const modify_data = {comment, 
															id:item.id,
															ownerId:item.ownerId};
										$.ajax({
											url:"${pageContext.request.contextPath}/bbsPage/comment/update",
											type:"PATCH",
											data:JSON.stringify(modify_data),
											contentType : "application/json; charset=utf-8",
											dataType : "json",
											success:function(data){
												console.log(data);
												comment_p.innerText = data.comment;
												div5.style.display = "block";
												edit_div.remove();
											}
										});
// 										location.reload();
									}
								});
							});
							div4.append(modify_button);
						}
						commentList.append(div1);
						div1.append(div2);
						div2.append(div3);
						div2.append(div4);
 							
						div3.append(span);
						div3.append(owner);
						div3.append(eposition);
						span.append(edepartment);
						
						div4.prepend(createDate);
						
						div1.append(div5);
						div5.append(comment_p);
						
					}
				}
			});

			//삭제 버튼 이벤트
			$("#delete").click(function(){
				if(confirm("정말로 삭제하시겠습니까")){
					location.href = "${pageContext.request.contextPath}/bbsPage/delete/${bbsVO.id}";
				}
			});
			//수정 버튼 이벤트
			$("#modify").click(function(){
				location.href ="${pageContext.request.contextPath}/bbsPage/put/${bbsVO.id}";
			});
			
			//댓글 달기
			$("#set-comment").click(function(){
				let comment = $("#comment").val();
				
				if(comment.length > 0){
					let comment_data = {
							comment, 
							bbsId :"${bbsVO.id}",
							ownerId:"${personalInfoVO.empno}",
							owner:"${personalInfoVO.name}",
							edepartment:"${eVO.edepartment}",
							eposition:"${eVO.eposition}"
							};
					$.ajax({
						url:"${pageContext.request.contextPath}/bbsPage/comment/set",
						type:"POST",
						data:JSON.stringify(comment_data),
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success:function(data){
							//웹 컴포넌트 고려 시도 그러나 시간이 없었다. reload로 대체
// 							location.reload();
							console.log(data);

							let owner = data.owner;
							
							const commentList = document.querySelector("#comment-list");
							
							const div = document.createElement("div");
							const owner1 = document.createElement("p");
							owner1.innerText = data.owner;
							const comment1 = document.createElement("p");
							comment1.innerText = data.comment;
							const comment_modify = document.createElement("p");
							const edp = document.createElement("p");
							edp.innerText = data.edepartment;
							
							// 삭제 버튼
							const delete_button = document.createElement("button");
							delete_button.innerText = "삭제";
							
							delete_button.addEventListener("click", function(){
								//alert("삭제되었습니다");
								let yn = confirm("삭제하시겠습니까?");
								//console.log(yn);
								if(yn){
									let comment_data = {id : data.id};
										
									$.ajax({
										url:"${pageContext.request.contextPath}/bbsPage/comment/delete",
										type:"DELETE",
										data:JSON.stringify(comment_data),
										contentType : "application/json; charset=utf-8",
										dataType : "html",
										success:function(data){
											div.remove();
										}
									});
								}
							});
								
							div.append(delete_button);
							
							// 수정 버튼&수정 textarea
							const modify_button = document.createElement("button");
							modify_button.innerText = "수정";
							
							modify_button.addEventListener("click", function(){
								const edit_div = document.createElement("div");
								const edit_textarea = document.createElement("textarea");
								edit_textarea.cols = "200";
								edit_textarea.rows = "5";
								
								edit_textarea.value = comment1.innerText;
								
								const edit_modify = document.createElement("button");
								edit_modify.innerText = "수정완료";
								const edit_cancel = document.createElement("button");
								edit_cancel.innerText = "취소";
								
								edit_div.append(edit_textarea);
								edit_div.append(edit_modify);
								edit_div.append(edit_cancel);
								
								div.after(edit_div);
								div.style.display = "none";
								
								// 취소 버튼 클릭 시 이벤트
								edit_cancel.addEventListener("click", function(){
									div.style.display = "block";
									edit_div.remove();
								});
								
								// 수정완료 버튼 클릭 시 이벤트
								edit_modify.addEventListener("click", function(){
									//alert("수정완료 버튼 클릭");
									if(confirm("수정하시겠습니까")){
										let comment = edit_textarea.value;
										
										const modify_data = {
												comment,
												id:data.id,
												bbsId :"${bbsVO.id}",
												ownerId:"${personalInfoVO.empno}",
												owner:"${personalInfoVO.name}"
												};
										
										$.ajax({
											url:"${pageContext.request.contextPath}/bbsPage/comment/update",
											type:"PATCH",
											data:JSON.stringify(modify_data),
											contentType : "application/json; charset=utf-8",
											dataType : "json",
											success:function(data){
												//수정된 내용
												console.log(data);
												//수정 댓글 내용 : data.commnet
												console.log(data.comment);
												comment1.innerText = data.comment;
												div.style.display = "block";
												edit_div.remove();
											}
										});
									}
								});
							});
							
							div.append(modify_button);
							div.prepend(comment1);
							div.prepend(owner1);
							div.prepend(edp);
														
							commentList.append(div);
							
// 							location.reload();
						}
					});
				}else{
					alert("댓글을 입력해주세요");
				}
			});
		});			
	
	</script>

</body>
</html>