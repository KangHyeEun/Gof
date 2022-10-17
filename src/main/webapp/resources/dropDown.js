// 근태 관리
const menu = document.querySelector(".dropmenu");
const subBar = document.querySelector(".sub");

let subToggle = true;

function show_sub(){
  if(subToggle){
    subBar.style.height="80px";
    subToggle = !subToggle;
  }else{
    subBar.style.height="0px";
    subToggle = !subToggle;
  }
}

// 게시판
const menu1 = document.querySelector(".dropmenu1");
const subBar1 = document.querySelector(".sub1");

let  subToggle1 = true;
function show_sub1(){
  if(subToggle1){
    subBar1.style.height="80px";
    subToggle1 = !subToggle1;
  }else{
    subBar1.style.height="0px";
    subToggle1 = !subToggle1;
  }
}

// 쪽지
const menu2 = document.querySelector(".dropmenu2");
const subBar2 = document.querySelector(".sub2");

let  subToggle2 = true;
function show_sub2(){
  if(subToggle2){
    subBar2.style.height="80px";
    subToggle2 = !subToggle2;
  }else{
    subBar2.style.height="0px";
    subToggle2 = !subToggle2;
  }
}

// 관리자
const menu3 = document.querySelector(".dropmenu3");
const subBar3 = document.querySelector(".sub3");

let  subToggle3 = true;
function show_sub3(){
  if(subToggle3){
    subBar3.style.height="80px";
    subToggle3 = !subToggle3;
  }else{
    subBar3.style.height="0px";
    subToggle3 = !subToggle3;
  }
}



