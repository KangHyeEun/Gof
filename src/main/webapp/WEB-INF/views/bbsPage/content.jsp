<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 비동기 댓글 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bbs/js/jquery-3.6.1.min.js"></script>
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
                        <c:if test="${bbsVO.ownerId eq personalInfoVO.empno}">
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
                        </div>
                        <div>
                            <p>작성일 ${bbsVO.createDate}</p>
                        </div>
                    </div>
                </div>

                <div class="content-text">
                    <p>${bbsVO.content}</p>
                </div>

                <div class="content-footer">
                    <h4>첨부파일&nbsp;&nbsp;&nbsp;<span><img src="https://uinnout.com/employee/images/clip.svg"></span></h4>
					<c:forEach var="file" items="${filelist}">
						<a href="${pageContext.request.contextPath}/bbsPage/downloadFile/${file.localname}/${file.servername}">${file.localname}</a><br>
					</c:forEach>
                </div>

				<div id="comment-list">
					<!-- 댓글 달리는 곳 -->
				</div>
				
				<div>
					<!-- 댓글 적는 곳 -->
					<textarea name="comment" id="comment" cols="150" rows="5"></textarea>
					<button id="set-comment">댓글 달기</button>
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
// 						$("#comment-list").append("<div><h4>"+item.owner+"</h4><p>"+item.comment
// 								+"</p></div><button class='comment-delete'>삭제</button>");
						
						//owner_id를 가져옴
						let sownerid = ${personalInfoVO.empno};
						
						const commentList = document.querySelector("#comment-list");
						
						const div = document.createElement("div");
						const owner = document.createElement("h4");
						owner.innerText = item.owner;
						const comment = document.createElement("p");
						comment.innerText = item.comment;
						const createDate = document.createElement("p");
						createDate.innerText = item.createDate;
						
						// 해당 유저가 쓴 댓글일 경우
						//empno == ownerid
						if(item.ownerId == sownerid){
							// 삭제 버튼
							const delete_button = document.createElement("button");
							delete_button.innerText = "삭제";
						
							delete_button.addEventListener("click", function(){
								//alert("삭제되었습니다");
								let yn = confirm("삭제하시겠습니까?");
								//console.log(yn);
								if(yn){
									let comment_data = {id : item.id};
									
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
							
							// 수정 버튼
							const modify_button = document.createElement("button");
							modify_button.innerText = "수정";
							
							modify_button.addEventListener("click", function(){
								const edit_div = document.createElement("div");
								const edit_textarea = document.createElement("textarea");
								edit_textarea.cols = "200";
								edit_textarea.rows = "5";
								
								edit_textarea.value = p.innerText;
								
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
										
										const modify_data = {comment, id:item.id, ownerId:item.ownerId};
										
										$.ajax({
											url:"${pageContext.request.contextPath}/bbsPage/comment/update",
											type:"PATCH",
											data:JSON.stringify(modify_data),
											contentType : "application/json; charset=utf-8",
											dataType : "json",
											success:function(data){
												console.log(data);
												p.innerText = data.comment;
												div.style.display = "block";
												edit_div.remove();
											}
										});
									}
								});
							});
							
							div.append(modify_button);
						}
						
						div.prepend(comment);
						div.prepend(createDate);
						div.prepend(owner);
						
						
						commentList.append(div);
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
					//현재 시간
					let today = new Date();
					
					let year = today.getFullYear();
					let month = ('0' + (today.getMonth() + 1)).slice(-2);
					let day = ('0' + today.getDate()).slice(-2);
					
					let hours = ('0' + today.getHours()).slice(-2); 
					let minutes = ('0' + today.getMinutes()).slice(-2);
					let seconds = ('0' + today.getSeconds()).slice(-2); 

					let dateTimeString = year+'-'+month+'-'+day+hours+':'+minutes+':'+seconds;
					let createDate = dateTimeString;
					
// 					console.log(dateTimeString); //현재 시간 찍힘
					
					let comment_data = {
							comment, 
							bbsId :"${bbsVO.id}",
							ownerId:"${personalInfoVO.empno}",
							owner:"${personalInfoVO.name}",
							createDate
							};
					
					$.ajax({
						url:"${pageContext.request.contextPath}/bbsPage/comment/set",
						type:"POST",
						data:JSON.stringify(comment_data),
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						success:function(data){
							let owner = data.owner;
							
							const commentList = document.querySelector("#comment-list");
							
							const div = document.createElement("div");
							const h4 = document.createElement("h4");
							h4.innerText = data.owner;
							const p = document.createElement("p");
							p.innerText = data.comment;
							
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
							
							// 수정 버튼
							const modify_button = document.createElement("button");
							modify_button.innerText = "수정";
							
							modify_button.addEventListener("click", function(){
								const edit_div = document.createElement("div");
								const edit_textarea = document.createElement("textarea");
								edit_textarea.cols = "200";
								edit_textarea.rows = "5";
								
								edit_textarea.value = p.innerText;
								
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
										
										const modify_data = {comment, id:data.id};
										
										$.ajax({
											url:"${pageContext.request.contextPath}/bbsPage/comment/update",
											type:"PATCH",
											data:JSON.stringify(modify_data),
											contentType : "application/json; charset=utf-8",
											dataType : "json",
											success:function(data){
// 												console.log(data);
												p.innerText = data.comment;
												div.style.display = "block";
												edit_div.remove();
											}
										});
									}
								});
							});
							
							div.append(modify_button);
														
							div.prepend(p);
							div.prepend(h4);
														
							commentList.append(div);
						}
					});
				}else{
					alert("댓글을 달아주세요");
				}
			});
		});			
	
	</script>

</body>
</html>