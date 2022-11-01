
//======================================================================

//.js 파일에서 contextPath를 사용하기 위해 jsp 에서 script 태그로 session에 저장
var ctx = getContextPath();
function getContextPath() {
	return sessionStorage.getItem("contextpath");
}

const empno = Number(sessionStorage.getItem("empno"));
const ename = sessionStorage.getItem("ename");

//======================================================================
// ---------------------------------------------------------------------
//calendar
// ---------------------------------------------------------------------
// 현재 날짜를 불러오는 함수 / Fri Oct 14 2022 17:26:25 GMT+0900 (한국 표준시)
const date = new Date();

const renderCalendar = () => {

    // lastDay가 정상작동하는지 테스트를 위한 설정
    // date.setMonth(5);

    // 현재 달의 1일이 무슨 요일인지 알기 위해 임의로 현재 일자를 1로 설정
    date.setDate(1);

    // console.log(date.getDay());
    // console.log("---------------------------");
    // 1~31 을 텍스트로 뽑아서 div에 넣기위한 변수
    const monthDays = document.querySelector(".days");

    // getFullYear() 함수로 1970/01/01 을 시작 기준점으로 계산해줌
    // getMonth() 현재 월의 -1 의 값을 알아냄
    // ,0 자리는 일 자리수인데 1이면 1일이지만 0이면 이전달의 마지막 일을 알려준다.
    const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0).getDate();

    // 이전 달의 마지막일을 현재달의 바로전날의 개념으로 구함
    const prevLastDay = new Date(date.getFullYear(), date.getMonth(), 0).getDate();

    // 현재 요일(달마다의 첫 요일을 구하기 위함)
    const firstDayindex = date.getDay();

    // 현재 달의 마지막일의 요일 구하기
    const lastDayIndex = new Date(date.getFullYear(), date.getMonth() + 1, 0).getDay();
    // console.log("lastDayIndex : "+lastDayIndex);

    const nextDays = 7 - lastDayIndex - 1;

    // console.log(lastDay);
    // 0~6 일~토
    // console.log("Day : "+date.getDay());
    // 현재 시간 (단위:초)
    // console.log("Time : "+date.getTime());
    // 현재 월 -1 의 값 출력됨
    // console.log("Month : "+date.getMonth());
    // 현재 시
    // console.log("Hours : "+date.getHours());
    // 현재 분
    // console.log("Minutes : "+date.getMinutes());
    // 현재 일자
    // console.log("Date : "+date.getDate());

    // getMonth() 함수를 이용해서 인덱스로 아래의 월별 이름을 추출 가능
    const months = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];

    // 정적으로 넣어본 5월
    // document.querySelector(".date h1").innerHTML = months[4];
    // document.querySelector(".date h1").innerHTML = months[date.getMonth()];

//	헤더에 년도와 월 표시
    let dateH1 = document.querySelector(".date h1");

    dateH1.innerHTML = "";
    dateH1.innerHTML = date.getFullYear() + "년 ";
    dateH1.innerHTML += months[date.getMonth()];

    const longDays = ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"];

    const todayMove = new Date();
//	헤더에 오늘 날짜 표시
    document.querySelector(".date p").innerHTML = todayMove.getFullYear() + "년 "
                                                + (todayMove.getMonth()+1) + "월 "
                                                + todayMove.getDate() + "일 "
                                                + longDays[todayMove.getDay()];

    // .toDateString 날짜를 문자열로 변환해주는 기능
    // document.querySelector(".date p").innerHTML = new Date().toDateString();

// 일자 출력을 위한 변수
    let days = "";
// 아래 세개는 날짜(xxxx-xx-xx)를 이름으로 하는 클래스명을 위한 변수    
    let prevClass;
    let currentClass;
    let nextClass;
    let holidayStyle;

//style="color: blue;"

// 이전 달 마지막 주 일자 (회색)
    for (let x = firstDayindex; x > 0; x--) {
//		해당 날짜를 클래스 이름으로
		prevClass = "";
		if (date.getMonth() == 0) {
			prevClass += (date.getFullYear()-1) + "-" + 12 + "-" + (prevLastDay - x + 1);
		}
		else {
			prevClass += date.getFullYear() + "-" + date.getMonth() + "-" + (prevLastDay - x + 1);
		}
//		토,일 구하기
		holidayStyle = "";
		holidayStyle = new Date(date.getFullYear(), date.getMonth()-1, (prevLastDay - x + 1)).getDay();
		
//		일요일이면
		if(holidayStyle == 0) {
			days += `<div class="${prevClass} prev-date" style="color:red"><div><div><span>${prevLastDay - x + 1}</span></div></div><div class="overCnt"><span></span></div></div>`;
//		토요일이면
		} else if(holidayStyle == 6) {
			days += `<div class="${prevClass} prev-date" style="color:blue"><div><div><span>${prevLastDay - x + 1}</span></div></div><div class="overCnt"><span></span></div></div>`;
//		평일이면
		} else {
			days += `<div class="${prevClass} prev-date"><div><div><span>${prevLastDay - x + 1}</span></div></div><div class="overCnt"><span></span></div></div>`;
		}
    }
// 이번 달 일자
    for (let i = 1; i <= lastDay; i++) {
//		해당 날짜를 클래스 이름으로
		currentClass = "";
		currentClass += date.getFullYear() + "-" + (date.getMonth()+1) + "-" + i;
			
        // 1~마지막날 중 오늘 날짜와 같고 지금쓰고 있는 date의 달이 실제 날짜의 달과 같으면
        if (i === new Date().getDate() && date.getMonth() === new Date().getMonth()
        		&& date.getFullYear() === new Date().getFullYear()) {
//			토,일 구하기
			holidayStyle = "";
			holidayStyle = new Date(date.getFullYear(), date.getMonth(), i).getDay();
		
//			일요일이면
			if(holidayStyle == 0) {
				days += `<div class="${currentClass} today" style="color:red"><div><div><span>${i}</span></div></div><div class="overCnt"><span></span></div></div>`;
//			토요일이면
			} else if(holidayStyle == 6) {
				days += `<div class="${currentClass} today" style="color:blue"><div><div><span>${i}</span></div></div><div class="overCnt"><span></span></div></div>`;
//			평일이면
			} else {
				days += `<div class="${currentClass} today"><div><div><span>${i}</span></div></div><div class="overCnt"><span></span></div></div>`;
			}
            
        } else {
//			토,일 구하기
			holidayStyle = "";
			holidayStyle = new Date(date.getFullYear(), date.getMonth(), i).getDay();
		
//			일요일이면
			if(holidayStyle == 0) {
            	days += `<div class="${currentClass}" style="color:red"><div><div><span>${i}</span></div></div><div class="overCnt"><span></span></div></div>`;
//			토요일이면
			} else if(holidayStyle == 6) {
            	days += `<div class="${currentClass}" style="color:blue"><div><div><span>${i}</span></div></div><div class="overCnt"><span></span></div></div>`;
//			평일이면
			} else {
            	days += `<div class="${currentClass}"><div><div><span>${i}</span></div></div><div class="overCnt"><span></span></div></div>`;
			}
        }
    }
// 이전 달 첫째 주 일자 (회색)
    for (let j = 1; j <= nextDays; j++) {
//		해당 날짜를 클래스 이름으로
        nextClass = "";
        if ((date.getMonth()+2) == 13) {
			nextClass += (date.getFullYear()+1) + "-" + 1 + "-" + j;
		}
		else {
			nextClass += date.getFullYear() + "-" + (date.getMonth()+2) + "-" + j;
		}
//		토,일 구하기
		holidayStyle = "";
		holidayStyle = new Date(date.getFullYear(), date.getMonth()+1, j).getDay();
		
//		일요일이면
		if(holidayStyle == 0) {
        	days += `<div class="${nextClass} next-date" style="color:red"><div><div><span>${j}</span></div></div><div class="overCnt"><span></span></div></div>`;
//		토요일이면
		} else if(holidayStyle == 6) {
        	days += `<div class="${nextClass} next-date" style="color:blue"><div><div><span>${j}</span></div></div><div class="overCnt"><span></span></div></div>`;
//		평일이면
		} else {
        	days += `<div class="${nextClass} next-date"><div><div><span>${j}</span></div></div><div class="overCnt"><span></span></div></div>`;
		}
    }

    monthDays.innerHTML = "";
    monthDays.innerHTML = days;

// ---------------------------------------------------------------------
//월별 border-bottom 없애려고...
// ---------------------------------------------------------------------

	let daysArray = document.querySelector(".days").children;
	
	if(daysArray[28]==undefined){
		for(let k = 27; k > 20; k--){
			daysArray[k].style.borderBottom = "none";
		}
		for(let g = 0; g < daysArray.length; g++){
			daysArray[g].style.height = "16.73vh";
		}
	}else if(daysArray[35]==undefined){
		for(let k = 34; k > 27; k--){
			daysArray[k].style.borderBottom = "none";
		}
		for(let g = 0; g < daysArray.length; g++){
			daysArray[g].style.height = "13.37vh";
		}
	}else {
		for(let k = daysArray.length-1; k > daysArray.length-8; k--){
			daysArray[k].style.borderBottom = "none";
		}
	}
	
// ---------------------------------------------------------------------
//일자 클릭시 이벤트
//target 프로퍼티와 currentTarget 프로퍼티 비교
//먼저 target 은 이벤트가 처음 발생한 대상을 가리킨다.
//반면에 currentTarget은 이벤트가 버블링 혹은 캡처링 되는 과정에서 현재 이벤트가 위치하고 있는 대상을 가리킨다.
// ---------------------------------------------------------------------

	const daysEle = document.querySelectorAll(".days > div");
	const daysDivsEle = document.querySelectorAll(".days > div > div:first-child");

	for (let index = 0; index < daysEle.length; index++) {
//	    마우스클릭
	    daysEle.item(index).addEventListener("mousedown", function(_e) {
//			target : 클릭한 영역의 class
			targetdaysEle = _e.target.className;
		    this.style.backgroundColor = "#746bf5";
	    });
//		마우스떼기
		document.addEventListener("mouseup", function(){
//			처음 선택했던 영역을 벗어난 후에 마우스를 떼면 찾기가 힘들기때문에 mousedown한 영역 전체의 효과를 없애주는 것
//			하위에 잘못 먹힐 수 있기때문에 아래에서 > 로 하위에만 적용
			for (let index1 = 0; index1 < daysDivsEle.length; index1++){
//				.days div에만 배경색을 없애는 것은
//				.days div 하위의 태그에 배경색이 있다면 없애지않고
//				배경색이 없다면 상위 태그에서 상속을 받을 것이기 때문이라고 생각했다. 
				daysEle.item(index1).style.backgroundColor = "";
			}
		});
	}
	
// ---------------------------------------------------------------------
//월, 주, 일 클릭시 버튼 효과
// ---------------------------------------------------------------------
	
//	const btnDiv = document.querySelectorAll(".btnDiv p");
//	
//	for (let index = 1; index < btnDiv.length; index++) {
//		btnDiv.item(index).addEventListener("click", function() {
//			for (let index1 = 1; index1 < btnDiv.length; index1++) {
//				btnDiv.item(index1).classList.add("btnColor");
//				btnDiv.item(index1).classList.remove("btnClick");
//			}
//			this.classList.add("btnClick");
//			this.classList.remove("btnColor");
//		});
//	}
	
// ---------------------------------------------------------------------
//날짜 클릭시 일정 입력 팝업
// ---------------------------------------------------------------------

//	일자 클릭시 현재 날짜가 아닌 클릭한 날짜가 입력됨
//	일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
	for (let index = 0; index < daysEle.length; index++) {
//		daysEle.item(index).addEventListener("click",function(){
		daysEle.item(index).addEventListener("click",function(){
			let dates = daysEle.item(index).classList[0].split("-");
			let years = dates[0];	// 년
			let months = dates[1];	// 월
			let days = dates[2];	// 일
			if (months < 10){
				months = "0"+months;
			}
			if (days < 10){
				days = "0"+days;
			}
			
			let hours = date.getHours();		// 시
			let minutes = date.getMinutes();	// 분
			if (hours < 10){
				hours = "0"+hours;
			}
			if (minutes < 10){
				minutes = "0"+minutes;
			}
			
//			클릭한 날짜와 현재 시간을 입력창의 일시에 입력시켜주기 위한 변수
			let clickDate = years + "-" + months + "-" + days + "T" + hours + ":" + minutes;
			
			document.getElementById("calStart").value = clickDate;
			document.getElementById("calEnd").value = clickDate;

			document.querySelector(".schedule-wrap").style.display = "flex";
		});
	}
	
//	일정추가 클릭시 현재 날짜와 현재 시간의 내용이 들어감
	document.getElementById("btnScheAdd").addEventListener("click", function(){
		const newDate = new Date();
		let years = newDate.getFullYear();	// 년
		let months = newDate.getMonth()+1;	// 월
		let days = newDate.getDate();	// 일
		if (months < 10){
			months = "0"+months;
		}
		if (days < 10){
			days = "0"+days;
		}
		
		let hours = newDate.getHours();		// 시
		let minutes = newDate.getMinutes();	// 분
		if (hours < 10){
			hours = "0"+hours;
		}
		if (minutes < 10){
			minutes = "0"+minutes;
		}
		
//		클릭한 날짜와 현재 시간을 입력창의 일시에 입력시켜주기 위한 변수
		let clickDate = years + "-" + months + "-" + days + "T" + hours + ":" + minutes;
		
		document.getElementById("calStart").value = clickDate;
		document.getElementById("calEnd").value = clickDate;

		document.querySelector(".schedule-wrap").style.display = "flex";
	});

	
// ---------------------------------------------------------------------
//비동기 통신
// ---------------------------------------------------------------------

	let dateRange = {calStart:daysEle.item(0).classList[0],
					calEnd:daysEle.item(daysEle.length-1).classList[0]};

	fetch(ctx+"/calendar/restData",{
		method : "POST",
		headers : { "Content-type" : "application/json"},
		body : JSON.stringify(dateRange)
	}).then(response => response.json(), _e => console.log("error!!!"))
	.then(_data => {
		
//		----------------------------------------------------------------------
//		일자에 일정 출력
//		----------------------------------------------------------------------

		let list = _data;
		let innerSpan;
//		console.log(list[0]);
//		{
//		    "calId": 1,
//		    "calTitle": "제목 없음",
//		    "calPlace": "회의실A",
//		    "calStart": "2022-10-9 05:00",
//		    "calEnd": "2022-10-10 13:00",
//		    "calAllday": "0",
//		    "calShow": "0",
//		    "calNotice": "0",
//		    "calContent": "내용 없음",
//		    "empno": 220401,
//		    "checkAdmin": 0,
//		    "approval": 0
//		}
		
//		달력에 직접적으로 보이는 부분
		for(let index = 0; index < daysEle.length; index++) {
			for(let index1 = 0; index1 < list.length; index1++) {
				let calDate = list[index1].calStart.split(" ");
				let calTime = calDate[1];	// 시간
				calDate = calDate[0];		// 날짜
				let calHour = calTime.split(":");
				let calMinute = calHour[1];	// 분
				calHour = calHour[0];		// 시간
//				console.log("calHour : " + Number(calHour) + " / calMinute : " + calMinute);
//				div의 클래스에 있는 값과 DB에서 추출한 날짜 값과 같으면 해당 div에 DB값 넣기
				if (daysEle.item(index).classList[0] == calDate) {
					let scheduleDiv = document.getElementsByClassName(calDate)[0].children[0];
					let div = document.createElement("div");
					let span = document.createElement("span");
					span.classList.add("schedule_"+list[index1].calId);
					
					innerSpan = "";
					innerSpan += calTime + " " + list[index1].calTitle;
					span.innerHTML += innerSpan;
					div.append(span);
					scheduleDiv.append(div);
				}
			}
		}
		
		return _data;
		
	}).then(_data => {
		
//		 ---------------------------------------------------------------------
//		 일정 클릭시 일정목록 팝업
//		 ---------------------------------------------------------------------

		let list = _data;
		let innerSpan;

//		console.log(document.querySelectorAll(".days > div > div:first-child > div:not(.days > div > div:first-child > div:first-child)"));
//		console.log(document.querySelectorAll(".days > div > div:first-child > div:not(.days > div > div:first-child > div:first-child)").length);
//		날짜 div 안에서 제일 위의 일자 div와 제일아래 +count div 를 제외한 일정에 대한 클릭 발생시
		let innerDiv = document.querySelectorAll(".days > div > div:first-child > div:not(.days > div > div:first-child > div:first-child)");
		for (let index = 0; index < innerDiv.length; index++){
			innerDiv[index].addEventListener("click",function(e){
			
//				클릭한 위치에 팝업창 생성
//		 		---------------------------------------------------------------------
		
//				일정추가 팝업이 뜨지않게 이벤트 버블링 방지
				e.stopPropagation();
//				console.log(this);
				
				let valueX = e.clientX;
				let valueY = e.clientY;
//				뷰포트의 길이에서 클릭한 x좌표를 뺀 길이가 팝업창 가로길이인 250보다 작아지면 x좌표에서 그 값만큼 빼준다.
				if ((window.innerWidth-valueX) < 250) {
					valueX -= (250-(window.innerWidth-valueX));
				}
//				세로길이는 박스 크기로 계산하면 안맞아서 임의로 값을 늘려줌
				if ((window.innerHeight-valueY) < 250) {
					valueY -= (300-(window.innerHeight-valueY));
				}
//				일정 클릭시 position: absolute 상태인 schedule-info 의 위치를 정해주어 팝업처럼 뜨게함 
				document.querySelector(".schedule-info").style.left = valueX+"px";
				document.querySelector(".schedule-info").style.top = valueY+"px";
				document.querySelector(".schedule-info-wrap").style.display = "block";
				
				
//				클릭한 곳에 있는 일정을 모두 표시하는 팝업
//		 		---------------------------------------------------------------------
				
//				일정 팝업의 제목
				let scheList = document.querySelector(".schedule-list");
//				일정 팝업의 목록
				let scheTitle = document.querySelector(".schedule-title");
				scheList.textContent = "";	// 팝업에 내용 넣기전에 초기화
				let childEle = "";
//				클릭한 곳의 상위 요소로 가서 하위요소의 개수를 구한다 => 클릭한 곳의 일정 개수를 구하기 위함
//				innerDiv[index].parentElement.children.length (일자 div도 포함되어있어서 1부터 시작)
				let scheParentToChild = innerDiv[index].parentElement.children;
				let delBtn = "";
				delBtn = "×"
//				일자에 있는 일정들 팝업에 복사
				for (let index1 = 1; index1 < scheParentToChild.length; index1++) {
					const innerSpan = document.createElement("span");
					innerSpan.classList.add("innerScheBtn");
					innerSpan.innerHTML = delBtn;
//					element 복제, 하위 요소도 복제하기 위해 true 값 설정
					childEle = scheParentToChild[index1].cloneNode(true);
					childEle.append(innerSpan);
					childEle.children[0].classList.add("innerSchedule");
					scheList.append(childEle);
				}
//				기존 일정에서 displayNone 처리 되었던것을 팝업에서 해제
				for (let index1 = 0; index1 < scheList.children.length; index1++) {
					scheList.children[index1].classList.remove("displayNone");
				}
//				클릭한 곳의 날짜
				let clickToday = innerDiv[index].parentElement.parentElement.classList[0];
//				클릭한 곳의 날짜 자르기
				let clickTodayCut = clickToday.split("-");
//				클릭한 곳의 날짜로 요일 구하기
				clickTodayDay = new Date(clickTodayCut[0], clickTodayCut[1]-1, clickTodayCut[2]).getDay();
//				클릭한 팝업창의 제목 초기화
				scheTitle.children[0].textContent = "";
//				클릭한 곳의 날짜와 요일 삽입
				scheTitle.children[0].innerHTML = clickToday + " " + longDays[clickTodayDay];
				
				
				
//	 	---------------------------------------------------------------------
//		일정 팝업에서 제목 혹은 x 키 누를시 이벤트 발생 기능 및 상세목록 조회,수정,삭제
//		---------------------------------------------------------------------

				const scheInfo = document.querySelector(".scheInfo-content > ul");
				
				function tagCreate(category, value) {
					
					if (category == "종료일") {
						let li = document.query
					}
					else {
						let li = document.createElement("li");
						let span1 = document.createElement("span");
						let span2 = document.createElement("span");
							
						span1.innerHTML = "";
						span1.innerHTML = category;
						li.append(span1);
						
						span2.innerHTML = "";
						span2.innerHTML = value;
						li.append(span2);
						
						scheInfo.append(li);
					}
					
				}
//				팝업 눌러졌는지 체크
				if (scheList.children.length != 0) {
					for (let index1 = 0; index1 < scheList.children.length; index1++) {
						
//						일정목록 팝업에서 제목 눌렀을때 이벤트
//	 	---------------------------------------------------------------------
						scheList.children[index1].children[0].addEventListener("click", function(){
//							idValue : schedule_xx 에서 xx 값 추출 (id값)
							const idValue = this.classList[0].split("_")[1];
							scheParentToChild[index1].cloneNode(true)
							
							for (let index2 = 0; index2 < list.length; index2++) {
//								일정 list에서 id값과 클릭한 일정의 id값이 같을때
								if (list[index2].calId == idValue) {
									scheInfo.innerHTML = "";
									
									if (list[index2].calTitle != "" && list[index2].calTitle != null && list[index2].calTitle != undefined) {
										tagCreate("제목", list[index2].calTitle);
									} else {
										tagCreate("제목", "제목 없음");
									}
									if (list[index2].ename != "" && list[index2].ename != null && list[index2].ename != undefined) {
										tagCreate("작성자", list[index2].ename);
									}
									if (list[index2].calPlace != "" && list[index2].calPlace != null && list[index2].calPlace != undefined) {
										tagCreate("장소", list[index2].calPlace);
									}
									if (list[index2].calContent != "" && list[index2].calContent != null && list[index2].calContent != undefined) {
										tagCreate("내용", list[index2].calContent);
									}
									if (list[index2].calStart != "" && list[index2].calStart != null && list[index2].calStart != undefined &&
										list[index2].calEnd != "" && list[index2].calEnd != null && list[index2].calEnd != undefined) {
										if (list[index2].calStart == list[index2].calEnd) {
											tagCreate("일시", list[index2].calStart);
										}
										else {
											tagCreate("일시", list[index2].calStart + " ~ " + list[index2].calEnd);
										}
									}
									console.log(list[index2].calRange);
									if (list[index2].calRange != 0 && list[index2].calRange != null && list[index2].calRange != undefined) {
										tagCreate("전체일정", list[index2].calRange);
									}
//									
//									if (list[index2].calShow != "" && list[index2].calShow != null && list[index2].calRange != undefined) {
//										tagCreate("비공개", list[index2].calShow);
//									}
									
//									if (list[index2].calAllday != "" && list[index2].calAllday != null && list[index2].calAllday != undefined) {
//										tagCreate("종일", list[index2].calAllday);
//									}
//									if (list[index2].calNotice != "" && list[index2].calNotice != null && list[index2].calNotice != undefined) {
//										tagCreate("공지", list[index2].calNotice);
//									}



//									일정 상세목록 수정 버튼 눌렀을때
//	 			---------------------------------------------------------------------

									
									console.log(list[index2].empno);
									console.log(empno);
									
//									일정 상세목록 삭제 버튼 눌렀을때
//	 			---------------------------------------------------------------------
									document.querySelector(".scheInfo-btn > a:last-child").addEventListener("click", function(e){
//										list의 사원번호와 접속한 유저의 사원번호 비교
										if (list[index2].empno == empno) {
											if (confirm("정말로 삭제하시겠습니까?")) {
												location.href = ctx+"/calendar/deleteData/"+list[index2].calId;
											}
//											삭제 취소 클릭시 돌아감
											else {
												location.href = ctx+"/calendar";
											}
										}
//										접속한 유저가 작성한 글이 아닐때
										else {
											alert("권한이 없습니다.");
											location.href = ctx+"/calendar";
										}
									});
									
									
									
//									//---------------------------------------------------------------------
//									//일정 등록
//									//일정 팝업에서 controller로 가기전 날짜 데이터 비교하여 시작일이 종료일보다 늦지않도록 검사
//									//---------------------------------------------------------------------
//									
//									//button[type="button"] 형태의 button 클릭시 날짜값을 넘겨서 렌더링 함수를 컨트롤
//									const transferBtn = document.getElementById("btn");
//									transferBtn.addEventListener("click", function(){
//										const scheForm = document.querySelector(".schedule form");
//										
//										const calStart = document.getElementById("calStart").value;
//										const calEnd = document.getElementById("calEnd").value;
//										
//										const calStartYear = new Date(calStart).getFullYear();
//										const calStartMonth = new Date(calStart).getMonth();
//										const calStartDate = new Date(calStart).getDate();
//										const calEndYear = new Date(calEnd).getFullYear();
//										const calEndMonth = new Date(calEnd).getMonth();
//										const calEndDate = new Date(calEnd).getDate();
//										
//										if (calStartYear > calEndYear) {
//										    alert("날짜가 잘못 입력되었습니다.");
//										}
//										else if (calStartMonth > calEndMonth) {
//										    alert("날짜가 잘못 입력되었습니다.");
//										}
//										else if (calStartDate > calEndDate) {
//										    alert("날짜가 잘못 입력되었습니다.");
//										}
//										else {
//										    scheForm.setAttribute("action", ctx+"/calendar/insertData");
//										    document.querySelector("#realBtn").click();
//										}
//									});


								}
							}
//							console.log(list[0]);
//							console.log(_data);
							
							document.querySelector(".schedule-info-wrap").style.display = "none";
							document.querySelector(".scheInfo-detail-wrap").style.display = "flex";
						});
//	 	---------------------------------------------------------------------
						
						
//						일정목록 x 버튼 눌렀을때 이벤트
//	 	---------------------------------------------------------------------
						scheList.children[index1].children[1].addEventListener("click", function(_e){
//							idValue : schedule_xx 에서 xx 값 추출 (id값)
							const idValue = this.previousElementSibling.classList[0].split("_")[1];
							
							console.log("일정의 삭제버튼");
							for (let index2 = 0; index2 < list.length; index2++) {
//								일정 list 중에서 id를 색인하여 내가 클릭한 일정의 id값(idValue)과 같은지 비교 
								if (list[index2].calId == idValue) {
//									내가 클릭한 일정의 작성자와 현재 접속한 유저가 같은지 비교
									if (list[index2].empno == empno) {
										if (confirm("정말로 삭제하시겠습니까?")) {
											location.href = ctx+"/calendar/deleteData/"+list[index2].calId;
										}
//										삭제 취소 클릭시 돌아감
										else {
											location.href = ctx+"/calendar";
										}
									}
//									해당 글의 작성자가 아닐 경우 권한 없음의 알림창 띄움
									else {
										alert("권한이 없습니다.");
										location.href = ctx+"/calendar";
									}
								}
							}
						});
//	 	---------------------------------------------------------------------
						
						
					}
				}
			});
		}
		
		return _data;
		
	}).then(_data => {
		

		
//	 	---------------------------------------------------------------------
//		일정 팝업에서 x 키 누를시 삭제 기능
//		---------------------------------------------------------------------
//		console.log(document.querySelectorAll(".schedule-list > div > span:last-child"));
//		document.querySelectorAll(".innerScheBtn")[0].addEventListener("click", function(){
//			console.log(this);
//		});

		return _data;
		
	}).then(_data => {
	
//////////////////////////////////////////////////////////////////////////////////////////
////media query///////media query///////media query///////media query///////media query///
//////////////////////////////////////////////////////////////////////////////////////////

	// ---------------------------------------------------------------------
	// matchMedia()	
	// min-height: 981px
	// ---------------------------------------------------------------------

	//	일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
//		매치함수 생성
		function funcHeight981(x) {
//		  980px -> 981px 로 갈때
		  if (x.matches) {
//			월별 border-bottom 없애려고...에서 사용한 변수 사용
//			let daysArray = document.querySelector(".days").children;
		
			if(daysArray[28]==undefined){		// 월의 일자가 28개 이하일때
//				console.log("1001px : 28번째");
//				981px : 5개 -> 980px: 4개 -> 690px: 3개
				for (let index = 0; index < daysEle.length; index++) {
					let scheDiv = daysEle.item(index).children;
//					각 일자에 들어있는 일정 개수 + 일자(1개) 만큼 반복
//					일자가 28개일때는 981px 이상에서 일정 다섯 개만 보여야하므로 0~5까지는 none 안함 (0번째는 일자 div)
					for (let index1 = 6; index1 < scheDiv.item(0).children.length; index1++) {
//						scheDiv.item(0).children.item(index1).style.display = "none";
						scheDiv.item(0).children.item(index1).classList.add("displayNone");
					}
				}
				
//				 ---------------------------------------------------------------------
//				 overCnt 일정이 6개(일자까지 7개) 이상일 때 +1 카운트 수 출력해주는 로직
//				 ---------------------------------------------------------------------

//				일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
//					(daysEle(일자) > div 첫번째 > div => 일정 들어가는 곳)
					let scheDiv1 = daysEle.item(index).children.item(0).children;
//					(daysEle(일자) > div 두번째 > span => count값 들어가는 곳)
					let scheDiv2 = daysEle.item(index).children.item(1).children;
					let divCount = "";
					if (scheDiv1.length > 6) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
						divCount = "+";	// count값 앞에 +표시
						divCount += scheDiv1.length - 6;	// 7개 이상일때 화면에 보일 6개를 제외한 개수 (+divCount)
						scheDiv2.item(0).append(divCount);	// 일자의 아래쪽 div에 span 태그 추가
						
					}else if (scheDiv1.length <= 6) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
					}
				}
				
			}else if(daysArray[35]==undefined){	// 월의 일자가 35개 이하일때
//				console.log("1001px : 35번째");
//				981px : 4개 -> 980px: 3개 -> 690px: 2개
				for (let index = 0; index < daysEle.length; index++) {
					let scheDiv = daysEle.item(index).children;
//					각 일자에 들어있는 일정 개수 + 일자(1개) 만큼 반복
//					일자가 35개일때는 981px 이상에서 일정 네 개만 보여야하므로 0~4까지는 none 안함 (0번째는 일자 div)
					for (let index1 = 5; index1 < scheDiv.item(0).children.length; index1++) {
//						scheDiv.item(0).children.item(index1).style.display = "none";
						scheDiv.item(0).children.item(index1).classList.add("displayNone");
					}
				}
				
//				 ---------------------------------------------------------------------
//				 overCnt 일정이 5개(일자까지 6개) 이상일 때 +1 카운트 수 출력해주는 로직
//				 ---------------------------------------------------------------------

//				일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
//					(daysEle(일자) > div 첫번째 > div => 일정 들어가는 곳)
					let scheDiv1 = daysEle.item(index).children.item(0).children;
//					(daysEle(일자) > div 두번째 > span => count값 들어가는 곳)
					let scheDiv2 = daysEle.item(index).children.item(1).children;
					let divCount = "";
					if (scheDiv1.length > 5) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
						divCount = "+";	// count값 앞에 +표시
						divCount += scheDiv1.length - 5;	// 6개 이상일때 화면에 보일 5개를 제외한 개수 (+divCount)
						scheDiv2.item(0).append(divCount);	// 일자의 아래쪽 div에 span 태그 추가
						
					}else if (scheDiv1.length <= 5) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
					}
				}
				
			}else {								// 월의 일자가 42개 이하일때
//				console.log("1001px : 42번째");
//				981px : 3개 -> 980px: 2개 -> 690px: 1개
//					(daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
					let scheDiv = daysEle.item(index).children;
//					각 일자에 들어있는 일정 개수 + 일자(1개) 만큼 반복
//					일자가 42개일때는 981px 이상에서 일정 세 개만 보여야하므로 0~3까지는 none 안함 (0번째는 일자 div)
					for (let index1 = 4; index1 < scheDiv.item(0).children.length; index1++) {
//						scheDiv.item(0).children.item(index1).style.display = "none";
						scheDiv.item(0).children.item(index1).classList.add("displayNone");
					}
				}
				
//				 ---------------------------------------------------------------------
//				 overCnt 일정이 4개(일자까지 5개) 이상일 때 +1 카운트 수 출력해주는 로직
//				 ---------------------------------------------------------------------

//				일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
//					(daysEle(일자) > div 첫번째 > div => 일정 들어가는 곳)
					let scheDiv1 = daysEle.item(index).children.item(0).children;
//					(daysEle(일자) > div 두번째 > span => count값 들어가는 곳)
					let scheDiv2 = daysEle.item(index).children.item(1).children;
					let divCount = "";
					if (scheDiv1.length > 4) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
						divCount = "+";	// count값 앞에 +표시
						divCount += scheDiv1.length - 4;	// 5개 이상일때 화면에 보일 4개를 제외한 개수 (+divCount)
						scheDiv2.item(0).append(divCount);	// 일자의 아래쪽 div에 span 태그 추가
						
					}else if (scheDiv1.length <= 4) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
					}
				}
				
			}
		    
		  }
		}
		
////////////////////////////////////////////////////////////////////////////////////////

	// ---------------------------------------------------------------------
	// matchMedia()	
	// max-height: 980px <-> 981px
	// ---------------------------------------------------------------------

	//	일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
//		매치함수 생성
		function funcHeight980(x) {
//		  981px -> 980px 로 갈때
		  if (x.matches) {
//			월별 border-bottom 없애려고...에서 사용한 변수 사용
//			let daysArray = document.querySelector(".days").children;
		
			if(daysArray[28]==undefined){		// 월의 일자가 28개 이하일때
//				console.log("880px : 28번째");
//				981px : 5개 -> 980px: 4개 -> 690px: 3개
				for (let index = 0; index < daysEle.length; index++) {
					let scheDiv = daysEle.item(index).children;
//					각 일자에 들어있는 일정 개수 + 일자(1개) 만큼 반복
//					일자가 28개일때는 980px 이하에서 일정 네 개만 보여야하므로 0~4까지는 none 안함 (0번째는 일자 div)
					for (let index1 = 5; index1 < scheDiv.item(0).children.length; index1++) {
//						scheDiv.item(0).children.item(index1).style.display = "none";
						scheDiv.item(0).children.item(index1).classList.add("displayNone");
					}
				}
				
//				 ---------------------------------------------------------------------
//				 overCnt 일정이 5개(일자까지 6개) 이상일 때 +1 카운트 수 출력해주는 로직
//				 ---------------------------------------------------------------------

//				일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
//					(daysEle(일자) > div 첫번째 > div => 일정 들어가는 곳)
					let scheDiv1 = daysEle.item(index).children.item(0).children;
//					(daysEle(일자) > div 두번째 > span => count값 들어가는 곳)
					let scheDiv2 = daysEle.item(index).children.item(1).children;
					let divCount = "";
					if (scheDiv1.length > 5) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
						divCount = "+";	// count값 앞에 +표시
						divCount += scheDiv1.length - 5;	// 6개 이상일때 화면에 보일 5개를 제외한 개수 (+divCount)
						scheDiv2.item(0).append(divCount);	// 일자의 아래쪽 div에 span 태그 추가
						
					}else if (scheDiv1.length <= 5) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
					}
				}
				
			}else if(daysArray[35]==undefined){	// 월의 일자가 35개 이하일때
//				console.log("880px : 35번째");
//				981px : 4개 -> 980px: 3개 -> 690px: 2개
				for (let index = 0; index < daysEle.length; index++) {
					let scheDiv = daysEle.item(index).children;
//					각 일자에 들어있는 일정 개수 + 일자(1개) 만큼 반복
//					일자가 35개일때는 980px 이하에서 일정 세 개만 보여야하므로 0~3까지는 none 안함 (0번째는 일자 div)
					for (let index1 = 4; index1 < scheDiv.item(0).children.length; index1++) {
//						scheDiv.item(0).children.item(index1).style.display = "none";
						scheDiv.item(0).children.item(index1).classList.add("displayNone");
					}
				}
				
//				 ---------------------------------------------------------------------
//				 overCnt 일정이 4개(일자까지 5개) 이상일 때 +1 카운트 수 출력해주는 로직
//				 ---------------------------------------------------------------------

//				일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
//					(daysEle(일자) > div 첫번째 > div => 일정 들어가는 곳)
					let scheDiv1 = daysEle.item(index).children.item(0).children;
//					(daysEle(일자) > div 두번째 > span => count값 들어가는 곳)
					let scheDiv2 = daysEle.item(index).children.item(1).children;
					let divCount = "";
					if (scheDiv1.length > 4) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
						divCount = "+";	// count값 앞에 +표시
						divCount += scheDiv1.length - 4;	// 5개 이상일때 화면에 보일 4개를 제외한 개수 (+divCount)
						scheDiv2.item(0).append(divCount);	// 일자의 아래쪽 div에 span 태그 추가
						
					}else if (scheDiv1.length <= 4) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
					}
				}
				
			}else {								// 월의 일자가 42개 이하일때
//				console.log("980px : 42번째");
//				981px : 3개 -> 980px: 2개 -> 690px: 1개
//					(daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
					let scheDiv = daysEle.item(index).children;
//					각 일자에 들어있는 일정 개수 + 일자(1개) 만큼 반복
//					일자가 42개일때는 980px 이하에서 일정 두 개만 보여야하므로 0~2까지는 none 안함 (0번째는 일자 div)
					for (let index1 = 3; index1 < scheDiv.item(0).children.length; index1++) {
//						scheDiv.item(0).children.item(index1).style.display = "none";
						scheDiv.item(0).children.item(index1).classList.add("displayNone");
					}
				}
				
//				 ---------------------------------------------------------------------
//				 overCnt 일정이 3개(일자까지 4개) 이상일 때 +1 카운트 수 출력해주는 로직
//				 ---------------------------------------------------------------------

//				일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
//					(daysEle(일자) > div 첫번째 > div => 일정 들어가는 곳)
					let scheDiv1 = daysEle.item(index).children.item(0).children;
//					(daysEle(일자) > div 두번째 > span => count값 들어가는 곳)
					let scheDiv2 = daysEle.item(index).children.item(1).children;
					let divCount = "";
					if (scheDiv1.length > 3) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
						divCount = "+";	// count값 앞에 +표시
						divCount += scheDiv1.length - 3;	// 4개 이상일때 화면에 보일 3개를 제외한 개수 (+divCount)
						scheDiv2.item(0).append(divCount);	// 일자의 아래쪽 div에 span 태그 추가
						
					}else if (scheDiv1.length <= 3) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
					}
				}
				
			}
		    
		  }
		  
//		  981px -> 980px 로 갈때 none 시켰던거 block으로 원복
		  else {
			if(daysArray[28]==undefined){		// 월의 일자가 28개 이하일때
//				console.log("원복 980px : 28번째");
//				1200px : 5개 <- 880px: 4개 <- 690px: 3개
				for (let index = 0; index < daysEle.length; index++) {
					let scheDiv = daysEle.item(index).children;
//					각 일자에 들어있는 일정 개수 + 일자(1개) 만큼 반복
//					4개에서 5개로 가는 것이기때문에 0~5만 block처리
					for (let index1 = 0; index1 < 6; index1++) {
						if(scheDiv.item(0).children.item(index1) != null) {
							if(index1 == 0) {	// 첫 번째 div
//								scheDiv.item(0).children.item(0).style.display = "flex";
								scheDiv.item(0).children.item(index1).classList.remove("displayNone");
							}
							else {
//								scheDiv.item(0).children.item(index1).style.display = "block";
								scheDiv.item(0).children.item(index1).classList.remove("displayNone");
							}
						}
					}
					for (let index1 = 6; index1 < scheDiv.item(0).children.length; index1++) {
						if(scheDiv.item(0).children.item(index1) != null) {
//							scheDiv.item(0).children.item(index1).style.display = "none";
							scheDiv.item(0).children.item(index1).classList.add("displayNone");
						}
					}
				}
				
//				 ---------------------------------------------------------------------
//				 overCnt 일정이 6개(일자까지 7개) 이상일 때 +1 카운트 수 출력해주는 로직
//				 ---------------------------------------------------------------------

//				일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
//					(daysEle(일자) > div 첫번째 > div => 일정 들어가는 곳)
					let scheDiv1 = daysEle.item(index).children.item(0).children;
//					(daysEle(일자) > div 두번째 > span => count값 들어가는 곳)
					let scheDiv2 = daysEle.item(index).children.item(1).children;
					let divCount = "";
					if (scheDiv1.length > 6) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
						divCount = "+";	// count값 앞에 +표시
						divCount += scheDiv1.length - 6;	// 7개 이상일때 화면에 보일 6개를 제외한 개수 (+divCount)
						scheDiv2.item(0).append(divCount);	// 일자의 아래쪽 div에 span 태그 추가
						
					}else if (scheDiv1.length <= 6) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
					}
				}
				
			}else if(daysArray[35]==undefined){	// 월의 일자가 35개 이하일때
//				console.log("원복 980px : 35번째");
//				1200px : 4개 <- 880px: 3개 <- 690px: 2개
				for (let index = 0; index < daysEle.length; index++) {
					let scheDiv = daysEle.item(index).children;
//					각 일자에 들어있는 일정 개수 + 일자(1개) 만큼 반복
//					3개에서 4개로 가는 것이기때문에 0~4만 block처리
					for (let index1 = 0; index1 < 5; index1++) {
						if(scheDiv.item(0).children.item(index1) != null) {
							if(index1 == 0) {	// 첫 번째 div
//								scheDiv.item(0).children.item(0).style.display = "flex";
								scheDiv.item(0).children.item(index1).classList.remove("displayNone");
							}
							else {
//								scheDiv.item(0).children.item(index1).style.display = "block";
								scheDiv.item(0).children.item(index1).classList.remove("displayNone");
							}
						}
					}
					for (let index1 = 5; index1 < scheDiv.item(0).children.length; index1++) {
						if(scheDiv.item(0).children.item(index1) != null) {
//							scheDiv.item(0).children.item(index1).style.display = "none";
							scheDiv.item(0).children.item(index1).classList.add("displayNone");
						}
					}
				}
				
//				 ---------------------------------------------------------------------
//				 overCnt 일정이 5개(일자까지 6개) 이상일 때 +1 카운트 수 출력해주는 로직
//				 ---------------------------------------------------------------------

//				일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
//					(daysEle(일자) > div 첫번째 > div => 일정 들어가는 곳)
					let scheDiv1 = daysEle.item(index).children.item(0).children;
//					(daysEle(일자) > div 두번째 > span => count값 들어가는 곳)
					let scheDiv2 = daysEle.item(index).children.item(1).children;
					let divCount = "";
					if (scheDiv1.length > 5) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
						divCount = "+";	// count값 앞에 +표시
						divCount += scheDiv1.length - 5;	// 6개 이상일때 화면에 보일 5개를 제외한 개수 (+divCount)
						scheDiv2.item(0).append(divCount);	// 일자의 아래쪽 div에 span 태그 추가
						
					}else if (scheDiv1.length <= 5) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
					}
				}
				
			}else {								// 월의 일자가 42개 이하일때
//				console.log("원복 980px : 42번째");
//				1200px : 3개 <- 880px: 2개 <- 690px: 1개
//					(daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
					let scheDiv = daysEle.item(index).children;
//					각 일자에 들어있는 일정 개수 + 일자(1개) 만큼 반복
//					2개에서 3개로 가는 것이기때문에 0~3만 block처리
					for (let index1 = 0; index1 < 4; index1++) {
						if(scheDiv.item(0).children.item(index1) != null) {
							if(index1 == 0) {	// 첫 번째 div
//								scheDiv.item(0).children.item(0).style.display = "flex";
								scheDiv.item(0).children.item(index1).classList.remove("displayNone");
							}
							else {
//								scheDiv.item(0).children.item(index1).style.display = "block";
								scheDiv.item(0).children.item(index1).classList.remove("displayNone");
							}
						}
					}
					for (let index1 = 4; index1 < scheDiv.item(0).children.length; index1++) {
						if(scheDiv.item(0).children.item(index1) != null) {
//							scheDiv.item(0).children.item(index1).style.display = "none";
							scheDiv.item(0).children.item(index1).classList.add("displayNone");
						}
					}
				}
				
//				 ---------------------------------------------------------------------
//				 overCnt 일정이 4개(일자까지 5개) 이상일 때 +1 카운트 수 출력해주는 로직
//				 ---------------------------------------------------------------------

//				일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
//					(daysEle(일자) > div 첫번째 > div => 일정 들어가는 곳)
					let scheDiv1 = daysEle.item(index).children.item(0).children;
//					(daysEle(일자) > div 두번째 > span => count값 들어가는 곳)
					let scheDiv2 = daysEle.item(index).children.item(1).children;
					let divCount = "";
					if (scheDiv1.length > 4) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
						divCount = "+";	// count값 앞에 +표시
						divCount += scheDiv1.length - 4;	// 5개 이상일때 화면에 보일 4개를 제외한 개수 (+divCount)
						scheDiv2.item(0).append(divCount);	// 일자의 아래쪽 div에 span 태그 추가
						
					}else if (scheDiv1.length <= 4) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
					}
				}
				
			}
		    
		  }
		}
		
		
//////////////////////////////////////////////////////////////////////////////////////////

	// ---------------------------------------------------------------------
	// matchMedia()	
	// max-height: 690px <-> 691px
	// ---------------------------------------------------------------------

	//	일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
//		매치함수 생성
		function funcHeight780(x) {
//		  691px -> 690px 로 갈때
		  if (x.matches) {
//			월별 border-bottom 없애려고...에서 사용한 변수 사용
//			let daysArray = document.querySelector(".days").children;
		
			if(daysArray[28]==undefined){		// 월의 일자가 28개 이하일때
//				console.log("690px : 28번째");
//				5개 -> 880px: 4개 -> 690px: 3개
				for (let index = 0; index < daysEle.length; index++) {
					let scheDiv = daysEle.item(index).children;
//					각 일자에 들어있는 일정 개수 + 일자(1개) 만큼 반복
//					일자가 28개일때는 690px 이하에서 일정 세 개만 보여야하므로 0~3까지는 none 안함 (0번째는 일자 div)
					for (let index1 = 4; index1 < scheDiv.item(0).children.length; index1++) {
//						scheDiv.item(0).children.item(index1).style.display = "none";
						scheDiv.item(0).children.item(index1).classList.add("displayNone");
					}
				}
				
//				 ---------------------------------------------------------------------
//				 overCnt 일정이 4개(일자까지 5개) 이상일 때 +1 카운트 수 출력해주는 로직
//				 ---------------------------------------------------------------------

//				일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
//					(daysEle(일자) > div 첫번째 > div => 일정 들어가는 곳)
					let scheDiv1 = daysEle.item(index).children.item(0).children;
//					(daysEle(일자) > div 두번째 > span => count값 들어가는 곳)
					let scheDiv2 = daysEle.item(index).children.item(1).children;
					let divCount = "";
					if (scheDiv1.length > 4) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
						divCount = "+";	// count값 앞에 +표시
						divCount += scheDiv1.length - 4;	// 5개 이상일때 화면에 보일 4개를 제외한 개수 (+divCount)
						scheDiv2.item(0).append(divCount);	// 일자의 아래쪽 div에 span 태그 추가
						
					}else if (scheDiv1.length <= 4) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
					}
				}
				
			}else if(daysArray[35]==undefined){	// 월의 일자가 35개 이하일때
//				console.log("690px : 35번째");
//				4개 -> 880px: 3개 -> 690px: 2개
				for (let index = 0; index < daysEle.length; index++) {
					let scheDiv = daysEle.item(index).children;
//					각 일자에 들어있는 일정 개수 + 일자(1개) 만큼 반복
//					일자가 35개일때는 690px 이하에서 일정 두 개만 보여야하므로 0~2까지는 none 안함 (0번째는 일자 div)
					for (let index1 = 3; index1 < scheDiv.item(0).children.length; index1++) {
//						scheDiv.item(0).children.item(index1).style.display = "none";
						scheDiv.item(0).children.item(index1).classList.add("displayNone");
					}
				}
				
//				 ---------------------------------------------------------------------
//				 overCnt 일정이 3개(일자까지 4개) 이상일 때 +1 카운트 수 출력해주는 로직
//				 ---------------------------------------------------------------------

//				일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
//					(daysEle(일자) > div 첫번째 > div => 일정 들어가는 곳)
					let scheDiv1 = daysEle.item(index).children.item(0).children;
//					(daysEle(일자) > div 두번째 > span => count값 들어가는 곳)
					let scheDiv2 = daysEle.item(index).children.item(1).children;
					let divCount = "";
					if (scheDiv1.length > 3) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
						divCount = "+";	// count값 앞에 +표시
						divCount += scheDiv1.length - 3;	// 4개 이상일때 화면에 보일 3개를 제외한 개수 (+divCount)
						scheDiv2.item(0).append(divCount);	// 일자의 아래쪽 div에 span 태그 추가
						
					}else if (scheDiv1.length <= 3) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
					}
				}
				
			}else {								// 월의 일자가 42개 이하일때
//				console.log("690px : 42번째");
//				3개 -> 880px: 2개 -> 690px: 1개
//					(daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
					let scheDiv = daysEle.item(index).children;
//					각 일자에 들어있는 일정 개수 + 일자(1개) 만큼 반복
//					일자가 42개일때는 690px 이하에서 일정 한 개만 보여야하므로 0~1까지는 none 안함 (0번째는 일자 div)
					for (let index1 = 2; index1 < scheDiv.item(0).children.length; index1++) {
//						scheDiv.item(0).children.item(index1).style.display = "none";
						scheDiv.item(0).children.item(index1).classList.add("displayNone");
					}
				}
				
//				 ---------------------------------------------------------------------
//				 overCnt 일정이 2개(일자까지 3개) 이상일 때 +1 카운트 수 출력해주는 로직
//				 ---------------------------------------------------------------------

//				일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
//					(daysEle(일자) > div 첫번째 > div => 일정 들어가는 곳)
					let scheDiv1 = daysEle.item(index).children.item(0).children;
//					(daysEle(일자) > div 두번째 > span => count값 들어가는 곳)
					let scheDiv2 = daysEle.item(index).children.item(1).children;
					let divCount = "";
					if (scheDiv1.length > 2) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
						divCount = "+";	// count값 앞에 +표시
						divCount += scheDiv1.length - 2;	// 3개 이상일때 화면에 보일 2개를 제외한 개수 (+divCount)
						scheDiv2.item(0).append(divCount);	// 일자의 아래쪽 div에 span 태그 추가
						
					}else if (scheDiv1.length <= 2) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
					}
				}
				
			}
		    
		  }
		  
//		  880px -> 881px 로 갈때 none 시켰던거 block으로 원복
		  else {
			if(daysArray[28]==undefined){		// 월의 일자가 28개 이하일때
//				console.log("원복 690px : 28번째");
//				5개 <- 880px: 4개 <- 690px: 3개
				for (let index = 0; index < daysEle.length; index++) {
					let scheDiv = daysEle.item(index).children;
//					각 일자에 들어있는 일정 개수 + 일자(1개) 만큼 반복
//					3개에서 4개로 가는 것이기때문에 0~4만 block처리
					for (let index1 = 0; index1 < 5; index1++) {
						if(scheDiv.item(0).children.item(index1) != null) {
							if(index1 == 0) {	// 첫 번째 div
//								scheDiv.item(0).children.item(0).style.display = "flex";
								scheDiv.item(0).children.item(index1).classList.remove("displayNone");
							}
							else {
//								scheDiv.item(0).children.item(index1).style.display = "block";
								scheDiv.item(0).children.item(index1).classList.remove("displayNone");
							}
						}
					}
					for (let index1 = 5; index1 < scheDiv.item(0).children.length; index1++) {
						if(scheDiv.item(0).children.item(index1) != null) {
//							scheDiv.item(0).children.item(index1).style.display = "none";
							scheDiv.item(0).children.item(index1).classList.add("displayNone");
						}
					}
				}
				
//				 ---------------------------------------------------------------------
//				 overCnt 일정이 5개(일자까지 6개) 이상일 때 +1 카운트 수 출력해주는 로직
//				 ---------------------------------------------------------------------

//				일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
//					(daysEle(일자) > div 첫번째 > div => 일정 들어가는 곳)
					let scheDiv1 = daysEle.item(index).children.item(0).children;
//					(daysEle(일자) > div 두번째 > span => count값 들어가는 곳)
					let scheDiv2 = daysEle.item(index).children.item(1).children;
					let divCount = "";
					if (scheDiv1.length > 5) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
						divCount = "+";	// count값 앞에 +표시
						divCount += scheDiv1.length - 5;	// 6개 이상일때 화면에 보일 5개를 제외한 개수 (+divCount)
						scheDiv2.item(0).append(divCount);	// 일자의 아래쪽 div에 span 태그 추가
						
					}else if (scheDiv1.length <= 5) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
					}
				}
				
			}else if(daysArray[35]==undefined){	// 월의 일자가 35개 이하일때
//				console.log("원복 690px : 35번째");
//				4개 <- 880px: 3개 <- 690px: 2개
				for (let index = 0; index < daysEle.length; index++) {
					let scheDiv = daysEle.item(index).children;
//					각 일자에 들어있는 일정 개수 + 일자(1개) 만큼 반복
//					2개에서 3개로 가는 것이기때문에 0~3만 block처리
					for (let index1 = 0; index1 < 4; index1++) {
						if(scheDiv.item(0).children.item(index1) != null) {
							if(index1 == 0) {	// 첫 번째 div
//								scheDiv.item(0).children.item(0).style.display = "flex";
								scheDiv.item(0).children.item(index1).classList.remove("displayNone");
							}
							else {
//								scheDiv.item(0).children.item(index1).style.display = "block";
								scheDiv.item(0).children.item(index1).classList.remove("displayNone");
							}
						}
					}
					for (let index1 = 4; index1 < scheDiv.item(0).children.length; index1++) {
						if(scheDiv.item(0).children.item(index1) != null) {
//							scheDiv.item(0).children.item(index1).style.display = "none";
							scheDiv.item(0).children.item(index1).classList.add("displayNone");
						}
					}
				}
				
//				 ---------------------------------------------------------------------
//				 overCnt 일정이 4개(일자까지 5개) 이상일 때 +1 카운트 수 출력해주는 로직
//				 ---------------------------------------------------------------------

//				일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
//					(daysEle(일자) > div 첫번째 > div => 일정 들어가는 곳)
					let scheDiv1 = daysEle.item(index).children.item(0).children;
//					(daysEle(일자) > div 두번째 > span => count값 들어가는 곳)
					let scheDiv2 = daysEle.item(index).children.item(1).children;
					let divCount = "";
					if (scheDiv1.length > 4) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
						divCount = "+";	// count값 앞에 +표시
						divCount += scheDiv1.length - 4;	// 5개 이상일때 화면에 보일 4개를 제외한 개수 (+divCount)
						scheDiv2.item(0).append(divCount);	// 일자의 아래쪽 div에 span 태그 추가
						
					}else if (scheDiv1.length <= 4) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
					}
				}
				
			}else {								// 월의 일자가 42개 이하일때
//				console.log("원복 690px : 42번째");
//				3개 <- 880px: 2개 <- 690px: 1개
//					(daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
					let scheDiv = daysEle.item(index).children;
//					각 일자에 들어있는 일정 개수 + 일자(1개) 만큼 반복
//					1개에서 2개로 가는 것이기때문에 0~2만 block처리
					for (let index1 = 0; index1 < 3; index1++) {
						if(scheDiv.item(0).children.item(index1) != null) {
							if(index1 == 0) {	// 첫 번째 div
//								scheDiv.item(0).children.item(0).style.display = "flex";
								scheDiv.item(0).children.item(index1).classList.remove("displayNone");
							}
							else {
//								scheDiv.item(0).children.item(index1).style.display = "block";
								scheDiv.item(0).children.item(index1).classList.remove("displayNone");
							}
						}
					}
					for (let index1 = 3; index1 < scheDiv.item(0).children.length; index1++) {
						if(scheDiv.item(0).children.item(index1) != null) {
//							scheDiv.item(0).children.item(index1).style.display = "none";
							scheDiv.item(0).children.item(index1).classList.add("displayNone");
						}
					}
				}
				
//				 ---------------------------------------------------------------------
//				 overCnt 일정이 3개(일자까지 4개) 이상일 때 +1 카운트 수 출력해주는 로직
//				 ---------------------------------------------------------------------

//				일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
				for (let index = 0; index < daysEle.length; index++) {
//					(daysEle(일자) > div 첫번째 > div => 일정 들어가는 곳)
					let scheDiv1 = daysEle.item(index).children.item(0).children;
//					(daysEle(일자) > div 두번째 > span => count값 들어가는 곳)
					let scheDiv2 = daysEle.item(index).children.item(1).children;
					let divCount = "";
					if (scheDiv1.length > 3) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
						divCount = "+";	// count값 앞에 +표시
						divCount += scheDiv1.length - 3;	// 4개 이상일때 화면에 보일 3개를 제외한 개수 (+divCount)
						scheDiv2.item(0).append(divCount);	// 일자의 아래쪽 div에 span 태그 추가
						
					}else if (scheDiv1.length <= 3) {
						scheDiv2.item(0).innerHTML = divCount;	// 일자의 아래쪽 div의 span을 초기화
					}
				}
				
			}
		    
		  }
		}
		
		
//		아래의 780px, 980px, 981px 함수 호출의 순서를 뒤집으면 881 이상 구간에서 div가 block 되지않는 현상있음...
		
//		MediaQueryList 객체 생성
		const media780 = window.matchMedia("(max-height: 780px)")
//		런타임시에 매치함수 호출
		funcHeight780(media780);
//		상태 변경 리스너로 매치함수를 추가한다. 
		media780.addListener(funcHeight780);
		
//		MediaQueryList 객체 생성
//		const media880 = window.matchMedia("(max-height: 880px) and (min-height: 691px)")
		const media980 = window.matchMedia("(max-height: 980px)")
//		런타임시에 매치함수 호출
		funcHeight980(media980);
//		상태 변경 리스너로 매치함수를 추가한다. 
		media980.addListener(funcHeight980);
		
//		MediaQueryList 객체 생성
		const media981 = window.matchMedia("(min-height: 981px)");
//		런타임시에 매치함수 호출
		funcHeight981(media981);
//		상태 변경 리스너로 매치함수를 추가한다. 
		media981.addListener(funcHeight981);
		
		
//////////////////////////////////////////////////////////////////////////////////////////
////media query///////media query///////media query///////media query///////media query///
//////////////////////////////////////////////////////////////////////////////////////////
		
		
	});
	
// ---------------------------------------------------------------------
}
// ---------------------------------------------------------------------
	
	
// ---------------------------------------------------------------------
//왼쪽 상단 이동 버튼
// ---------------------------------------------------------------------

// 이동 버튼 클릭시 효과를 위한 변수
const btnMove = document.querySelectorAll(".btnMove i");
// 이전 이벤트 타겟을 위한 저장 변수
let targetbtn;

// ---------------------------------------------------------------------
// 마우스 떼기
const mouseUp = (click) => {
	document.addEventListener("mouseup", function(_e){
		
	//	mousedown 영역(target)과 mouseup 영역이 같다면
		if (targetbtn === _e.target.classList.item(2)){
				click.classList.remove("btnClick");
				click.classList.add("btnColor");
	//	처음 눌렀던 버튼에 btnClick 클래스가 있으면 제거
		} else if (click.classList.item(3) == "btnClick") {
			document.getElementsByClassName(targetbtn).item(0).classList.remove("btnClick");
			document.getElementsByClassName(targetbtn).item(0).classList.add("btnColor");
		}
	});
}
// ---------------------------------------------------------------------

// 이전 년도 버튼
const prevs = document.querySelector(".prevs");

prevs.addEventListener("click", () => {
	date.setDate(1);
    date.setFullYear(date.getFullYear() - 1);
    renderCalendar();
});

// 이전 년도 버튼 효과
//마우스클릭
prevs.addEventListener("mousedown", function(_e) {
	targetbtn = "";
	targetbtn = _e.target.classList.item(2);
	this.classList.add("btnClick");
	this.classList.remove("btnColor");
});

//마우스떼기
mouseUp(prevs);

// ---------------------------------------------------------------------

// 이전 달 버튼
const prev = document.querySelector(".prev");

prev.addEventListener("click", () => {
	date.setDate(1);
    date.setMonth(date.getMonth() - 1);
    console.log("이전달 : " + date.getMonth());
    renderCalendar();
});


// 이전 달 버튼 효과
//마우스클릭
prev.addEventListener("mousedown", function(_e) {
	targetbtn = "";
	targetbtn = _e.target.classList.item(2);
	this.classList.add("btnClick");
	this.classList.remove("btnColor");
});

//마우스떼기
mouseUp(prev);

// ---------------------------------------------------------------------

// 다음 달 버튼
const next = document.querySelector(".next");

next.addEventListener("click", () => {
	date.setDate(1);
    date.setMonth(date.getMonth() + 1);
    console.log("다음달 : " + date.getMonth());
    
//    현재 년도로부터 30년 후 까지만 사용 가능
	if((date.getFullYear()) >= (new Date().getFullYear()+30)){
		alert("지원하는 날짜 범위를 벗어났습니다.");
		date.setDate(1);
    	date.setMonth(date.getMonth() - 1);
	}
    renderCalendar();
});

// 다음 달 버튼 효과
//마우스클릭
next.addEventListener("mousedown", function(_e) {
	targetbtn = "";
	targetbtn = _e.target.classList.item(2);
	this.classList.add("btnClick");
	this.classList.remove("btnColor");
});

//마우스떼기
mouseUp(next);

// ---------------------------------------------------------------------

// 다음 년도 버튼
const nexts = document.querySelector(".nexts");

nexts.addEventListener("click", () => {
	date.setDate(1);
    date.setFullYear(date.getFullYear() + 1);
    
//    현재 년도로부터 30년 후 까지만 사용 가능
	if((date.getFullYear()) >= (new Date().getFullYear()+30)){
		alert("지원하는 날짜 범위를 벗어났습니다.");
		date.setDate(1);
		date.setFullYear(date.getFullYear() - 1);
	}
    renderCalendar();
});

// 다음 년도 버튼 효과
//마우스클릭
nexts.addEventListener("mousedown", function(_e) {
	targetbtn = "";
	targetbtn = _e.target.classList.item(2);
	this.classList.add("btnClick");
	this.classList.remove("btnColor");
});

//마우스떼기
mouseUp(nexts);

// ---------------------------------------------------------------------

//---------------------------------------------------------------------
//오늘 날짜로 이동
//---------------------------------------------------------------------

document.querySelector(".todayMove").addEventListener("click", () =>{
    date.setFullYear(new Date().getFullYear());
    date.setMonth(new Date().getMonth());
    renderCalendar();
});

// ---------------------------------------------------------------------

//---------------------------------------------------------------------
//일정 등록
//일정 팝업에서 controller로 가기전 날짜 데이터 비교하여 시작일이 종료일보다 늦지않도록 검사
//---------------------------------------------------------------------

//button[type="button"] 형태의 button 클릭시 날짜값을 넘겨서 렌더링 함수를 컨트롤
const transferBtn = document.getElementById("btn");
transferBtn.addEventListener("click", function(){
	const scheForm = document.querySelector(".schedule form");
	
	const calStart = document.getElementById("calStart").value;
	const calEnd = document.getElementById("calEnd").value;
	
	const calStartYear = new Date(calStart).getFullYear();
	const calStartMonth = new Date(calStart).getMonth();
	const calStartDate = new Date(calStart).getDate();
	const calEndYear = new Date(calEnd).getFullYear();
	const calEndMonth = new Date(calEnd).getMonth();
	const calEndDate = new Date(calEnd).getDate();
	
	if (calStartYear > calEndYear) {
	    alert("날짜가 잘못 입력되었습니다.");
	}
	else if (calStartMonth > calEndMonth) {
	    alert("날짜가 잘못 입력되었습니다.");
	}
	else if (calStartDate > calEndDate) {
	    alert("날짜가 잘못 입력되었습니다.");
	}
	else {
	    scheForm.setAttribute("action", ctx+"/calendar/insertData");
	    document.querySelector("#realBtn").click();
	}
});

// ---------------------------------------------------------------------

//---------------------------------------------------------------------
//렌더링 시 년,월 값 정의
//렌더링시 일정을 추가해서 controller로 갔다오거나 refresh 되었을때 초기값으로 돌아가서
//년,월이 특정 값에 고정되는 문제점을 해결하기 위해서 f5시 localStrage에 값을 저장하는 방식을 사용함
//---------------------------------------------------------------------

const localFullYear = localStorage.getItem("localFullYear");
const localMonth = localStorage.getItem("localMonth");
const dateYear = date.getFullYear();
const dateMonth = date.getMonth()

//	최초 실행시
if (localFullYear == null || localMonth == null) {
	
	date.setFullYear(new Date().getFullYear());
	date.setMonth(new Date().getMonth());

	localStorage.setItem("localFullYear", date.getFullYear());
	localStorage.setItem("localMonth", date.getMonth());

	renderCalendar();
}
//	년, 월 변화가 없는 경우
else if (localFullYear == date.getFullYear() && localMonth == date.getMonth()) {
    renderCalendar();
}
//	년, 월 변화가 있는 경우
else {
	const localFullYear1 = localStorage.getItem("localFullYear");
	const localMonth1 = localStorage.getItem("localMonth");

//	1일 기준으로 년,월 수정
	date.setDate(1);
	date.setMonth(Number(localMonth1));
	date.setFullYear(Number(localFullYear1));

    renderCalendar();
}
//     	f5 누를시 렌더링하기 위한 값 구하기

function refreshFunc() {
	window.onbeforeunload = function (e) {
//		새로고침 전 수정
		localStorage.setItem("localFullYear", date.getFullYear());	// 새로고침 되기전에 값 저장
    	localStorage.setItem("localMonth", date.getMonth());		// 새로고침 되기전에 값 저장
    	
//		return 0; // 새로고침시 확인하는 알림창을 띄워준다.
	};
}



//시점의 문제가 있는 것으로 보여 keyCode로 해봤지만 이 문제는 아니고 페이지 이동시의 새로고침에는 이벤트 발생되지않아 위의 것으로 원복 
//window.addEventListener("keydown", function(e){
//	if (e.keyCode == 27) {
//		
//		let testYear = localStorage.getItem("localFullYear");
//		let testMonth = localStorage.getItem("localMonth");
//	
//		console.log("새로고침 이전");
//		console.log(". " + testYear);
//		console.log(". " + testMonth);
//		console.log("1. " + date.getFullYear());
//		console.log("2. " + date.getMonth());
//		console.log("3. " + localStorage.getItem("localFullYear"));
//		console.log("4. " + localStorage.getItem("localMonth"));
//		console.log("5. " + testYear);
//		console.log("6. " + testMonth);
//		console.log("----------------");
//		
//		let tempYear = localStorage.getItem("localFullYear");
//		let tempMonth = localStorage.getItem("localMonth");
//		
////		
////		localStorage.removeItem("localFullYear");
////		localStorage.removeItem("localMonth");
//		
//		localStorage.setItem("localFullYear", tempYear);	// 새로고침 되기전에 값 저장
//		localStorage.setItem("localMonth", tempYear);		// 새로고침 되기전에 값 저장
//	}
//});



// ---------------------------------------------------------------------

// ---------------------------------------------------------------------

// ---------------------------------------------------------------------

//======================================================================

//======================================================================















