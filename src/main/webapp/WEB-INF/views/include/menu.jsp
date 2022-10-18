<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/menu/default.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap" rel="stylesheet">
    
    
    <div class="left_sub_menu">
        <div class="logo_box">

        </div>
        <nav>
            <div class="menuwrap">
                <ul class="menu">
                    <li><a href="#">홈</a></li>
                </ul>

                <ul class="menu">
                    <li><a href="#">내 정보</a></li>
                </ul>

                <ul onclick="show_sub()" class="dropmenu">
                    <li>근태 관리</li>
                    <li class="drop_down_pointer">▼</li>
                    <li>
                        <ul class="sub">
                            <li><a href="${pageContext.request.contextPath}/commuting">근무 기록</a></li>
                            <li><a href="${pageContext.request.contextPath}/holiday">휴가 신청</a></li>
                        </ul>
                    </li>
                </ul>

                <ul onclick="show_sub1()" class="dropmenu1">
                    <li>게시판</li>
                    <li class="drop_down_pointer">▼</li>
                    <li>
                        <ul class="sub1">
                            <li><a href="#">공지 사항</a></li>
                            <li><a href="#">사내 게시판</a></li>
                        </ul>
                    </li>
                </ul>

                <ul class="menu">
                    <li><a href="#">조직도</a></li>
                </ul>

                <ul onclick="show_sub2()" class="dropmenu2">
                    <li>쪽지</li>
                    <li class="drop_down_pointer">▼</li>
                    <li>
                        <ul class="sub2">
                            <li><a href="#">받은 쪽지함</a></li>
                            <li><a href="#">보낸 쪽지함</a></li>
                        </ul>
                    </li>
                </ul>

                <ul class="menu">
                    <li><a href="#">캘린더</a></li>
                </ul>

                <ul onclick="show_sub3()" class="dropmenu3">
                    <li>관리자</li>
                    <li class="drop_down_pointer">▼</li>
                    <li>
                        <ul class="sub3">
                            <li><a href="#">인사 관리</a></li>
                            <li><a href="#">휴가 관리</a></li>
                        </ul>
                    </li>
                </ul>

                <ul class="menu">
                    <li><a href="#">로그아웃</a></li>
                </ul>
            </div>
        </nav>
    </div>
    
    <script src="${pageContext.request.contextPath}/menu/dropDown.js"></script>


