<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 비동기 댓글 -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/bbs/js/jquery-3.6.1.min.js"></script> --%>
<!-- 스타일 적용 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bbs/contentstyle.css" />
<title>Insert title here</title>
</head>
<body>

    <div class="header">
        <img src="${pageContext.request.contextPath}/imges/logo.PNG" />
        <div class="header-logout">로그아웃 버튼</div>
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
                    <a href="${pageContext.request.contextPath}/bbsPage/download">다운로드&nbsp;&nbsp;<img
                            src="upload/abc7.txt"></a>
                </div>

                <div class="insert" id="insert">
                    <textarea id="inittext"></textarea>
                    <button id="ibtn">댓글달기</button>
                </div>
                <div class="comment" id="comment">
                
               </div>
           </div>
       </div>
   </div>
	
	<script type="text/javascript">
		//뒤로가기 버튼 이벤트------------------------------
		document.getElementById("return").addEventListener("click", function() {
			location.href = "${pageContext.request.contextPath}/bbsPage/bbs";
		});
		//수정하기 버튼 이벤트-------------------------------
		document.getElementById("modify").addEventListener("click", function() {
			location.href = "${pageContext.request.contextPath}/bbsPage/put/${bbsVO.id}";
		});
		//삭제하기 버튼 이벤트-------------------------------
		document.getElementById("delete").addEventListener("click", function() {
			if(confirm('정말로 삭제하시겠습니까?')){
			location.href = "${pageContext.request.contextPath}/bbsPage/delete/${bbsVO.id}";
			}
		});
		
	//비동기 방식으로 댓글 달기
	const commentMain = document.getElementById("comment");
	
	let commentList = [];
	let originList;
	
	window.addEventListener('DOMContentLoaded', (e) => {
		initialize();
	});
	//댓글 불러오기
	function initialize(){
		fetch("${pageContext.request.contextPath}/bbsPage/comment/${bbsVO.id}")
		.then(response => response.json())
		.then(data => {
			//데이터 불러오는지 찍어보기
			console.log(data);
			originList = data;
			for(const obj of data) {
				if(obj.orderId === 0){
					commentList.push(obj);
				}else{
					for(const comp of data){
						if(comp.id == obj.orderId){
							if(comp.innerList == null){
								comp.innerList = [];
							}
							comp.innerList.push(obj);
							break;
						}
					}
				}
			}
			
			for(const obj of commentList) {
				makeCommentList(0,obj);
			}
			
		}).catch(err => {
			console.log(err);
		});
	}
	
		//댓글 모양 잡기
		function makeCommentList(num, item){
		const mainDiv = document.createElement("div");
		mainDiv.style.border = "1px solid black";
		mainDiv.style.padding = "5px";
		mainDiv.style.display = "flex";
		
		let lPad = (40*num) + 5;
		mainDiv.style.paddingLeft = lPad + "px";
		
		const subDiv1 = document.createElement("div");
		subDiv1.style.flex = "1";
		
		const h4 = document.createElement("h4");
		h4.innerText = item.owner;
		const p = document.createElement("p");
		
		let content = (num > 0)?"↳":"";
		p.innerText = content + item.content;
		
		const subDiv2 = document.createElement("div");
		subDiv1.style.width = "60px";
		subDiv1.style.flexDirection = "column";
		
		const commnetModify = document.createElement("button"); //댓글 수정 버튼
		commnetModify.innerText = "수정";

		const commnetDelete = document.createElement("button"); //댓글 삭제 버튼
		commnetDelete.innerText = "삭제";
// 		commnetDelete.style.display ="none";
		
		const initButton = document.createElement("button"); //대댓글 버튼
		initButton.innerText = "댓글";
		
		subDiv1.append(h4);
		subDiv1.append(p);
		
		subDiv2.append(commnetModify);
		subDiv2.append(commnetDelete);
		subDiv2.append(initButton);
		
		mainDiv.append(subDiv1);
		mainDiv.append(subDiv2);
		
		commentMain.append(mainDiv);
		
		
		
		//대댓글 달기(전송, 취소)--------
		initButton.addEventListener("click",function(){
			const writeDiv = document.createElement("div");
			writeDiv.classList.add("insert");
	
			//전송----
			const writeArea = document.createElement("textarea");
			const wbtn = document.createElement("button");
			wbtn.innerText = "전송";
			
			wbtn.addEventListener("click",function(){
				let str = writeArea.value;
				
				const sendObj = {
					bbsId : ${bbsVO.id},
					ownerId : ${personalInfoVO.empno},
					owner : "${personalInfoVO.name}",
					content : str,
					orderId : item.id
				}
				
				fetch("${pageContext.request.contextPath}/bbsPage/comment", {
					method: "POST",
					headers: {
						"Content-Type": "application/json",
					},
					body: JSON.stringify(sendObj)
				})
				.then((response) => response.json())
				.then((data) => {
					commentList = [];
					originList = null;
					document.getElementById("comment").textContent = "";
					initialize();
				});
				
			});
			//취소-----
			const cbtn = document.createElement("button");
			cbtn.innerText = "취소";
			
			cbtn.addEventListener("click",function(){
				writeDiv.remove();
			});
			
			writeDiv.append(writeArea);
			writeDiv.append(wbtn);
			writeDiv.append(cbtn);
			
			mainDiv.after(writeDiv);
		});
		
		if(item.innerList != null){
			for(const innerItem of item.innerList){
				makeCommentList(num+1,innerItem);
			}
		}

	}
		
		//댓글 달기----------------------------
		document.getElementById("ibtn").addEventListener("click", function() {
		let str = document.getElementById("inittext").value;
				
		const sendObj = {
				bbsId : ${bbsVO.id},
				ownerId : ${personalInfoVO.empno},
				owner : "${personalInfoVO.name}",
				content : str,
				orderId : 0
			}

		fetch("${pageContext.request.contextPath}/bbsPage/comment", {
			method: "POST",
			headers: {
				"Content-Type": "application/json",
			},
			body: JSON.stringify(sendObj)
			})
			.then((response) => response.json())
			.then((data) => {
				makeCommentList(0, sendObj);
			})
			.catch(err => {
				console.log(err);
			});
		});
		
// 		//댓글 수정(해당 유저가 쓴 댓글일 경우, 수정/삭제)
// 			let ownerId = commentList.ownerId;
// 			console.log(ownerId);
// 		//해당 댓글의 ownerId가 세션에 들은 아이디(현재 들어온 사람)	
// 			if(ownerId == ${personalInfoVO.empno}) {
// 				//버튼 나타나게
// // 				commnetDelete.style.display ="hidden";
// 				commnetDelete.addEventListener("click",function(){
// 					let yn = confirm("삭제하시겠습니까?");
	
// 					if(yn){
// 						const sendObj = {
// 								id : ${id},
// 								ownerId : ${personalInfoVO.empno}
// 							}
// 						fetch("${pageContext.request.contextPath}/bbsPage/comment/delete", {
// 							method: "DELETE",
// 							headers: {
// 								"Content-Type": "application/json",
// 							},
// 							body: JSON.stringify(sendObj)
// 							})
// 							.then((response) => response.json())
// 							.then((data) => {
// 								makeCommentList(0, sendObj);
// 							})
// 							.catch(err => {
// 								console.log(err);
// 							});
// 					}
// 				)};
// 			}
	
		
	</script>

</body>
</html>