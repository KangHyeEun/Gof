
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

// 이전 달 마지막 주 일자 (회색)
    for (let x = firstDayindex; x > 0; x--) {
		prevClass = "";
		prevClass += date.getFullYear() + "-" + date.getMonth() + "-" + (prevLastDay - x + 1);
        days += `<div class="prev-date ${prevClass}"><span>${prevLastDay - x + 1}</span></div>`;
    }
// 이번 달 일자
    for (let i = 1; i <= lastDay; i++) {
        // 1~마지막날 중 오늘 날짜와 같고 지금쓰고 있는 date의 달이 현재 달과 같으면
        if (i === new Date().getDate() && date.getMonth() === new Date().getMonth()
        		&& date.getFullYear() === new Date().getFullYear()) {
	        currentClass = "";
			currentClass += date.getFullYear() + "-" + (date.getMonth()+1) + "-" + i;
            days += `<div class="today ${currentClass}"><span>${i}</span></div>`;
        } else {
	        currentClass = "";
			currentClass += date.getFullYear() + "-" + (date.getMonth()+1) + "-" + i;
            days += `<div class="${currentClass}"><span>${i}</span></div>`;
        }
    }
// 이전 달 첫째 주 일자 (회색)
    for (let j = 1; j <= nextDays; j++) {
        nextClass = "";
		nextClass += date.getFullYear() + "-" + (date.getMonth()+2) + "-" + j;
        days += `<div class="next-date ${nextClass}"><span>${j}</span></div>`;
    }

    monthDays.innerHTML = "";
    monthDays.innerHTML = days;
    
    
// ---------------------------------------------------------------------
//월별 border-bottom 없애려고...
// ---------------------------------------------------------------------

	let daysArray = document.querySelector(".days").children;
//	for (let arr = 0; arr < daysArray.length; arr++){
//		console.log("daysArray : " + daysArray[arr].innerHTML);
//	}
//	console.log(daysArray);
//	console.log(daysArray[2]);
//	console.log(daysArray.length);
//	console.log(daysArray[35]!=undefined);
//	console.log(daysArray[35]==undefined);
	
	if(daysArray[35]==undefined){
		for(let k = 34; k > 27; k--){
			daysArray[k].style.borderBottom = "none";
		}
		for(let g = 0; g < daysArray.length; g++){
//			daysArray[g].style.height = "116px";
			daysArray[g].style.height = "14.2vh";
		}
	}else {
		for(let k = daysArray.length-1; k > daysArray.length-8; k--){
			daysArray[k].style.borderBottom = "none";
		}
	}
// ---------------------------------------------------------------------

}

// 이전 년도 버튼
document.querySelector(".prevs").addEventListener("click", () => {
    date.setFullYear(date.getFullYear() - 1);
    renderCalendar();
});
// 이전 달 버튼
document.querySelector(".prev").addEventListener("click", () => {
    date.setMonth(date.getMonth() - 1);
    renderCalendar();
});
// 다음 달 버튼
document.querySelector(".next").addEventListener("click", () => {
    date.setMonth(date.getMonth() + 1);
//    현재 년도로부터 30년 후 까지만 사용 가능
	if((date.getFullYear()) >= (new Date().getFullYear()+30)){
		alert("지원하는 날짜 범위를 벗어났습니다.");
    	date.setMonth(date.getMonth() - 1);
	}
    renderCalendar();
});
// 다음 년도 버튼
document.querySelector(".nexts").addEventListener("click", () => {
    date.setFullYear(date.getFullYear() + 1);
//    현재 년도로부터 30년 후 까지만 사용 가능
	if((date.getFullYear()) >= (new Date().getFullYear()+30)){
		alert("지원하는 날짜 범위를 벗어났습니다.");
		date.setFullYear(date.getFullYear() - 1);
	}
    renderCalendar();
});
// 첫 시작 시 렌더링
renderCalendar();
// 오늘 날짜로 이동
document.querySelector(".todayMove").addEventListener("click", () =>{
    date.setFullYear(new Date().getFullYear());
    date.setMonth(new Date().getMonth());
    renderCalendar();
});

    
// ---------------------------------------------------------------------
//일자 클릭시 이벤트
// ---------------------------------------------------------------------


let daysEle = document.querySelectorAll(".days div");
//let isPressed = false;

console.log(daysEle);
for (let index = 0; index < daysEle.length; index++) {
//	마우스떼기
    daysEle[index].addEventListener("mouseup", function(){
//	    isPressed = false;
		this.style.backgroundColor = "";
    });
//    마우스클릭
    daysEle[index].addEventListener("mousedown", function(){
//	    isPressed = true;
	    this.style.backgroundColor = "#746bf5";
    });
}



