
//======================================================================
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
		prevClass += date.getFullYear() + "-" + date.getMonth() + "-" + (prevLastDay - x + 1);
//		토,일 구하기
		holidayStyle = "";
		holidayStyle = new Date(date.getFullYear(), date.getMonth()-1, (prevLastDay - x + 1)).getDay();
		
//		일요일이면
		if(holidayStyle == 0) {
			days += `<div class="${prevClass} prev-date" style="color:red"><div><div><span>${prevLastDay - x + 1}</span></div></div><div class="overCnt"></div></div>`;
//		토요일이면
		} else if(holidayStyle == 6) {
			days += `<div class="${prevClass} prev-date" style="color:blue"><div><div><span>${prevLastDay - x + 1}</span></div></div><div class="overCnt"></div></div>`;
//		평일이면
		} else {
			days += `<div class="${prevClass} prev-date"><div><div><span>${prevLastDay - x + 1}</span></div></div><div class="overCnt"></div></div>`;
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
				days += `<div class="${currentClass} today" style="color:red"><div><div><span>${i}</span></div></div><div class="overCnt"></div></div>`;
//			토요일이면
			} else if(holidayStyle == 6) {
				days += `<div class="${currentClass} today" style="color:blue"><div><div><span>${i}</span></div></div><div class="overCnt"></div></div>`;
//			평일이면
			} else {
				days += `<div class="${currentClass} today"><div><div><span>${i}</span></div></div><div class="overCnt"></div></div>`;
			}
            
        } else {
//			토,일 구하기
			holidayStyle = "";
			holidayStyle = new Date(date.getFullYear(), date.getMonth(), i).getDay();
		
//			일요일이면
			if(holidayStyle == 0) {
            	days += `<div class="${currentClass}" style="color:red"><div><div><span>${i}</span></div></div><div class="overCnt"></div></div>`;
//			토요일이면
			} else if(holidayStyle == 6) {
            	days += `<div class="${currentClass}" style="color:blue"><div><div><span>${i}</span></div></div><div class="overCnt"></div></div>`;
//			평일이면
			} else {
            	days += `<div class="${currentClass}"><div><div><span>${i}</span></div></div><div class="overCnt"></div></div>`;
			}
        }
    }
// 이전 달 첫째 주 일자 (회색)
    for (let j = 1; j <= nextDays; j++) {
//		해당 날짜를 클래스 이름으로
        nextClass = "";
		nextClass += date.getFullYear() + "-" + (date.getMonth()+2) + "-" + j;
//		토,일 구하기
		holidayStyle = "";
		holidayStyle = new Date(date.getFullYear(), date.getMonth()+1, j).getDay();
		
//		일요일이면
		if(holidayStyle == 0) {
        	days += `<div class="${nextClass} next-date" style="color:red"><div><div><span>${j}</span></div></div><div class="overCnt"></div></div>`;
//		토요일이면
		} else if(holidayStyle == 6) {
        	days += `<div class="${nextClass} next-date" style="color:blue"><div><div><span>${j}</span></div></div><div class="overCnt"></div></div>`;
//		평일이면
		} else {
        	days += `<div class="${nextClass} next-date"><div><div><span>${j}</span></div></div><div class="overCnt"></div></div>`;
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

//	    daysEle.item(index).addEventListener("mouseup", function(_e) {
////			mousedown 영역(target)과 mouseup 영역이 같다면 
//			console.log(targetdaysEle);
//			console.log(_e.target.className);
//			if (targetdaysEle === _e.target.className){
//				this.style.backgroundColor = "";
////			만약에 다르면 클릭시의 영역에 대한 효과 제거
//			} else {
//				console.log(targetdaysEle);
//				console.log(_e.target.className);
//				document.getElementsByClassName(targetdaysEle).item(0).style.backgroundColor = "";
////				console.log(targetdaysEle);
////				console.log();
////				for (let index1 = 0; index1 < daysDivsEle.length; index1++){
////					document.getElementsByClassName(targetdaysEle).item(0).children.item(index1).style.backgroundColor = "";
////				}
//			}
////			for (let index1 = 0; index1 < daysDivsEle.length; index1++){
////				daysEle.item(index).daysDivsEle.item(index1).addEventListener("mouseup", function(_e) {
////					console.log(this);
////				});
////			}
//	    });
	}
	
// ---------------------------------------------------------------------
//월, 주, 일 클릭시 버튼 효과
// ---------------------------------------------------------------------
	
	const btnDiv = document.querySelectorAll(".btnDiv p");
	
	for (let index = 0; index < btnDiv.length; index++) {
		btnDiv.item(index).addEventListener("click", function() {
			for (let index1 = 0; index1 < btnDiv.length; index1++) {
				btnDiv.item(index1).classList.add("btnColor");
				btnDiv.item(index1).classList.remove("btnClick");
			}
			this.classList.add("btnClick");
			this.classList.remove("btnColor");
		});
	}
	
// ---------------------------------------------------------------------
//날짜 클릭시 일정 입력 팝업
// ---------------------------------------------------------------------

//	일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
	for (let index = 0; index < daysEle.length; index++) {
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
			let clickDate = years + "-"+ months + "-"+ days + "T" + hours + ":" + minutes;

			document.getElementById("calStart").value = clickDate;
			document.getElementById("calEnd").value = clickDate;

			document.querySelector(".schedule-wrap").style.display = "flex";
		});
	}
	
// ---------------------------------------------------------------------
//overCnt 3개 이상일 때 +카운트 수 출력해주는 로직
// ---------------------------------------------------------------------






// ---------------------------------------------------------------------
//renderCalendar(); 함수 호출시 DB에서 일정 가져와서 달력에 표시
// ---------------------------------------------------------------------
	
//	console.log(${list});
	
	
//000000000000000000000000000000000000000000000000000000000000000000000000000000000000
//000000000000000000000000000000000000000000000000000000000000000000000000000000000000
//000000000000000000000000000000000000000000000000000000000000000000000000000000000000
// 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류
//일단 보류
// ---------------------------------------------------------------------
//날짜 클릭시 일정 입력 팝업
//입력하여 DB로 저장뒤 id값 받아와서 날짜+id 값으로 class 만들어서 드래그 만들어야 될듯...
//아니면 선택한게 몇번째 엘리먼트인지 구할수 있다면 그 숫자로 nth-child(index)로 설정할 수도 있을듯
// ---------------------------------------------------------------------
//
//    document.querySelector("#btn").addEventListener("click", function(){
//// 		document.querySelector(".schedule-wrap").style.display = "none";
//// 		location.href = "${pageContext.request.contextPath}/calendar";
//	});
//	
////	일정 3개 이상 됐을때 +count 표시해주기 위한 변수
//	let thisDiv;
//	let countDiv;
//	let addDiv;
//	
////	일자 클릭시 이벤트에서 만든 변수 사용 (daysEle => (".days > div"))
//    for (let index = 0; index < daysEle.length; index++) {
//    	daysEle.item(index).addEventListener("click",function(e){
////     		클릭한 일자에 대한 클래스 이름
//    	 	const thisTarget = e.target.classList.item(0);
//    	 	console.log(thisTarget);
////     	 	클래스 이름에 맞는 태그
//    	    thisDiv = document.getElementsByClassName(thisTarget).item(0);
//    		console.log(thisDiv);
//    		if (thisTarget != null && thisDiv != null){
//        		let divTag = document.createElement("div");
//        		let pTag = document.createElement("p");
//        		
//        		pTag.innerText = "하이하이";
//        		divTag.append(pTag);
//        		divTag.classList.add(thisTarget+"-inner");
//        		divTag.classList.add("inner");
//        		
//        		thisDiv.append(divTag);
//			}
//			
////			document.querySelectorAll(".divs > div > div").item(3).remove();
////			하루 일정에 세개 이상이 되면 +count 표시를 해주는 div 추가
////			계산은 일자가 표시되어있는 div 포함해서 일정은 2개까지만 들어가고 계산은 +1로써
////			div 3개 초과이면 div 생성, 일정 기준으로는 2개 초과이면 div 생성 이라는 의미
////			thisDiv == daysEle.item(index)
//			countDiv = daysEle.item(index).children.length;
//			if (countDiv > 3) {
//				console.log("------");
//				console.log(countDiv);
//				console.log("------");
//				thisDiv.children.item(countDiv-1).remove();
////				thisDiv.children.item(3).remove();
//				countDiv -= 3;
//				addDiv = "";
////				addDiv += `<div class="dd"><span>dd</span></div>`;
////				addDiv += `<div class="${thisTarget}-${index}"><span>+${countDiv}</span></div>`;
//
////				thisDiv 안에 div중 일자,일정,countDiv 4개를 제외하고 display: none
//				for(let index1 = 4; index1 < thisDiv.children.lenght; index1++){
//					thisDiv.children.item(index1).style.display = "none";
//				}
//			}else if (countDiv > 2) {
////				thisDiv 안에 div중 일자,일정,countDiv 4개를 제외하고 display: none
//				for(let index1 = 3; index1 < thisDiv.children.lenght; index1++){
//					thisDiv.children.item(index1).style.display = "none";
//				}
//			}else if (countDiv > 1) {
////				thisDiv 안에 div중 일자,일정,countDiv 4개를 제외하고 display: none
//				for(let index1 = 2; index1 < thisDiv.children.lenght; index1++){
//					thisDiv.children.item(index1).style.display = "none";
//				}
//			}
//			
//			thisDiv.innerHTML += addDiv;
////			for (let index = 0; index < daysEle.length; index++){
////				화면에 보이는 일일 중(.days div) 어떤 하나의 일정이 3개 이상이 되었을때
////				console.log(daysEle.item(index).children.length);
////			}
//			
////			console.log("----------------------------------------");
////			console.log(daysEle.length);
////			console.log(daysEle.item(0));
////			console.log(daysEle.item(0).children.length);
////			console.log(daysEle.item(0).children.item(0));
////			console.log(daysEle.item(0).children.item(0).children);
////			console.log("----------------------------------------");
//
////---------------------------------------------------------------------
//
//    	});
//    }
// 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류 보류
//000000000000000000000000000000000000000000000000000000000000000000000000000000000000
//000000000000000000000000000000000000000000000000000000000000000000000000000000000000
//000000000000000000000000000000000000000000000000000000000000000000000000000000000000

// ---------------------------------------------------------------------
//일자에 일정 출력
// ---------------------------------------------------------------------

//	.js 파일에서 contextPath를 사용하기 위해 jsp 에서 script 태그로 session에 저장
	var ctx = getContextPath();
	function getContextPath() {
		return sessionStorage.getItem("contextpath");
	}
//	window.addEventListener("DOMContentLoaded", function(_e){
//	});
//	console.log(daysEle.length);
//	console.log(daysEle.item(0).classList[0]); // 첫 날
//	console.log(daysEle.item(daysEle.length-1).classList[0]); // 마지막 날
		
	let dateRange = {calStart:daysEle.item(0).classList[0],
					calEnd:daysEle.item(daysEle.length-1).classList[0]};
	
	fetch(ctx+"/calendar/restData",{
		method : "POST",
		headers : { "Content-type" : "application/json"},
		body : JSON.stringify(dateRange)
	}).then(response => response.json(), _e => console.log("error!!!"))
	.then(_data => {
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
					
					innerSpan = "";
					innerSpan += calTime + " " + list[index1].calTitle;
					span.innerHTML += innerSpan;
					div.append(span);
					scheduleDiv.append(div);
				}
			}
		}
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
    date.setMonth(date.getMonth() - 1);
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
    date.setMonth(date.getMonth() + 1);
//    현재 년도로부터 30년 후 까지만 사용 가능
	if((date.getFullYear()) >= (new Date().getFullYear()+30)){
		alert("지원하는 날짜 범위를 벗어났습니다.");
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
    date.setFullYear(date.getFullYear() + 1);
//    현재 년도로부터 30년 후 까지만 사용 가능
	if((date.getFullYear()) >= (new Date().getFullYear()+30)){
		alert("지원하는 날짜 범위를 벗어났습니다.");
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

// 첫 시작 시 렌더링
renderCalendar();
// 오늘 날짜로 이동
document.querySelector(".todayMove").addEventListener("click", () =>{
    date.setFullYear(new Date().getFullYear());
    date.setMonth(new Date().getMonth());
    renderCalendar();
});

// ---------------------------------------------------------------------

//======================================================================

//======================================================================


































