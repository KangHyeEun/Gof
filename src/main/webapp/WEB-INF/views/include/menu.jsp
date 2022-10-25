<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/menu/default.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap" rel="stylesheet">
    
    <style>

	
	</style>

            <nav class="nav">
                <div class="menuwrap">
                    <ul class="menu">
                        <li><a href="MoveToHome">홈</a></li>
                    </ul>

                    <ul class="menu">
                        <li><a href="#">내 정보</a></li>
                    </ul>

                    <ul onclick="show_sub()" class="dropmenu">
                        <li>근태 관리</li>
                        <li class="drop_down_pointer"><span class="menu-up btn-display">▲</span><span
                                class="menu-down">▼</span></li>
                        <li>
                            <ul class="sub">
                                <li><a href="${pageContext.request.contextPath}/Commuting?page=1&&year=0&&month=0">근무 기록</a></li>
                                <li><a href="${pageContext.request.contextPath}/Holiday?page=1&&year=0">휴가 신청</a></li>
                            </ul>
                        </li>
                    </ul>

                    <ul onclick="show_sub1()" class="dropmenu1">
                        <li>게시판</li>
                        <li class="drop_down_pointer"><span class="menu-up1 btn-display">▲</span><span
                                class="menu-down1">▼</span></li>
                        <li>
                            <ul class="sub1">
                                <li><a href="#">공지 사항</a></li>
                                <li><a href="${pageContext.request.contextPath}/bbsPage/bbs">사내 게시판</a></li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="menu">
                        <li><a href="${pageContext.request.contextPath}/orgChart2">조직도</a></li>
                    </ul>

                    <ul onclick="show_sub2()" class="dropmenu2">
                        <li>쪽지</li>
                        <li class="drop_down_pointer"><span class="menu-up2 btn-display">▲</span><span
                                class="menu-down2">▼</span></li>
                        <li>
                            <ul class="sub2">
                                <li><a href="${pageContext.request.contextPath}/message">받은 쪽지함</a></li>
                                <li><a href="${pageContext.request.contextPath}/message/message2">보낸 쪽지함</a></li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="menu">
                        <li><a href="${pageContext.request.contextPath }/calendar">캘린더</a></li>
                    </ul>

                    <ul onclick="show_sub3()" class="dropmenu3">
                        <li>관리자</li>
                        <li class="drop_down_pointer"><span class="menu-up3 btn-display">▲</span><span
                                class="menu-down3">▼</span></li>
                        <li>
                            <ul class="sub3">
                                <li><a href="${pageContext.request.contextPath}/admin">인사 관리</a></li>
                                <li><a href="${pageContext.request.contextPath}/holidayAdmin">휴가 관리</a></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- <ul class="menu">
                        <li><a href="#">로그아웃</a></li>
                    </ul> -->
                </div>
            </nav>
    
    <script src="${pageContext.request.contextPath}/menu/dropDown.js"></script>


