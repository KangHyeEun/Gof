
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

    let dateH1 = document.querySelector(".date h1");

    dateH1.innerHTML = "";
    dateH1.innerHTML = date.getFullYear() + "년 ";
    dateH1.innerHTML += months[date.getMonth()];

    const longDays = ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"];

    const todayMove = new Date();

    document.querySelector(".date p").innerHTML = todayMove.getFullYear() + "년 "
                                                + (todayMove.getMonth()+1) + "월 "
                                                + todayMove.getDate() + "일 "
                                                + longDays[todayMove.getDay()];

    // .toDateString 날짜를 문자열로 변환해주는 기능
    // document.querySelector(".date p").innerHTML = new Date().toDateString();

    let days = "";

    for (let x = firstDayindex; x > 0; x--) {
        days += `<div class="prev-date"><span>${prevLastDay - x + 1}</span></div>`;
    }

    for (let i = 1; i <= lastDay; i++) {
        // 1~마지막날 중 오늘 날짜와 같고 지금쓰고 있는 date의 달이 현재 달과 같으면
        if (i === new Date().getDate() && date.getMonth() === new Date().getMonth()
        		&& date.getFullYear() === new Date().getFullYear()) {
            days += `<div class="today"><span>${i}</span></div>`;
        } else {
            days += `<div><span>${i}</span></div>`;
        }
    }

    for (let j = 1; j <= nextDays; j++) {
        days += `<div class="next-date"><span>${j}</span></div>`;
    }

    monthDays.innerHTML = "";
    monthDays.innerHTML = days;
    
    
// ---------------------------------------------------------------------
//border-bottom 없애려고...
// ---------------------------------------------------------------------

	let daysBorder = document.querySelector(".days").children;
	console.log(daysBorder);
	console.log(daysBorder[2]);
	console.log(daysBorder.length);
	console.log(daysBorder[35]!=undefined);
	console.log(daysBorder[35]==undefined);
	
	if(daysBorder[35]==undefined){
		for(let k = 34; k > 27; k--){
			daysBorder[k].style.borderBottom = "none";
		}
		for(let g = 0; g < daysBorder.length; g++){
			daysBorder[g].style.height = "116px";
		}
	}else {
		for(let k = daysBorder.length-1; k > daysBorder.length-8; k--){
			daysBorder[k].style.borderBottom = "none";
		}
	}

}

document.querySelector(".prev").addEventListener("click", () => {
    date.setMonth(date.getMonth() - 1);
    renderCalendar();
});

document.querySelector(".next").addEventListener("click", () => {
    date.setMonth(date.getMonth() + 1);
    renderCalendar();
});

renderCalendar();

document.querySelector(".todayMove").addEventListener("click", () =>{
    date.setFullYear(new Date().getFullYear());
    date.setMonth(new Date().getMonth());
    renderCalendar();
});



