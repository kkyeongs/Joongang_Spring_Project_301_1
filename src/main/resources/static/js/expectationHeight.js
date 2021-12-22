const form = document.querySelector("#height_form");
const gender = document.querySelector("#gender");
const age = document.querySelector("#age");
const Fheight = document.querySelector("#Fheight");
const Mheight = document.querySelector("#Mheight");
let Bheight = 0;

function doSubmit(event) {
    event.preventDefault();
    content();
}

function content() {
    var str = "";
    str += `<div id="content">`;
    str += `<br><br>`;
    str += `당신의 성별은 ${gender.value}<br>`;
    str += `당신의 나이는 ${age.value}<br>`;
    str += `당신의 아버지의 키는 ${Fheight.value}<br>`;
    str += `당신의 어머니의 키는 ${Mheight.value}<br>`;
    
    Calculation();
    str += `당신의 예상 키는 ${Bheight}`;
    str += `<br><br><br>`;
    str += `</div>`;

    document.querySelector("#contents").innerHTML = str;
}

function Calculation() {
    if(gender.value === "남자") {
        if((Number(Fheight.value) + Number(Mheight.value)) /2 > 190) {
            Bheight = 195;
        } else if((Number(Fheight.value) + Number(Mheight.value)) /2 > 185) {
            Bheight = 190;
        } else if((Number(Fheight.value) + Number(Mheight.value)) /2 > 180) {
            Bheight = 185;
        } else if((Number(Fheight.value) + Number(Mheight.value)) /2 > 180) {
            Bheight = 180;
        } else if((Number(Fheight.value) + Number(Mheight.value)) /2 > 175) {
            Bheight = 175;
        } else if((Number(Fheight.value) + Number(Mheight.value)) /2 > 170) {
            Bheight = 170;
        } else if((Number(Fheight.value) + Number(Mheight.value)) /2 > 165) {
            Bheight = 165;
        } else {
            Bheight = 160;
        }
    } else if(gender.value === "여자") {
        if((Number(Fheight.value) + Number(Mheight.value)) /2 > 190) {
            Bheight = 185;
        } else if((Number(Fheight.value) + Number(Mheight.value)) /2 > 185) {
            Bheight = 180;
        } else if((Number(Fheight.value) + Number(Mheight.value)) /2 > 180) {
            Bheight = 175;
        } else if((Number(Fheight.value) + Number(Mheight.value)) /2 > 180) {
            Bheight = 170;
        } else if((Number(Fheight.value) + Number(Mheight.value)) /2 > 175) {
            Bheight = 165;
        } else if((Number(Fheight.value) + Number(Mheight.value)) /2 > 170) {
            Bheight = 160;
        } else if((Number(Fheight.value) + Number(Mheight.value)) /2 > 165) {
            Bheight = 155;
        } else {
            Bheight = 150;
        }
    }
    return Bheight;
}

form.addEventListener("submit", doSubmit);