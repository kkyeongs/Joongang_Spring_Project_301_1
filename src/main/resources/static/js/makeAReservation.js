const form = document.querySelector("#reservation_form");
const id = document.querySelector("#reservationId");
const date = document.querySelector("#reservationDate");
const time = document.querySelector("#reservationTime");
const content = document.querySelector("#reservationMessage");
const empno = document.querySelector("#reservationEmpno");
const submit = document.querySelector("#reservation_submit");

function doSubmit(event){
    event.preventDefault();
    submitAjax();
}
	
const submitAjax = () => {
    const params = {"id":id.value, "resdate":date.value, "restime":time.value, "rescontent":content.value, "empno":empno.value}
    $.ajax({
		type: "POST",
		url: "makeAReservationSubmit",
		data: params
		}).done(
			function () {
				alert("예약이 완료되었습니다");
				opener.location.reload();
				window.close();
				}
		).fail(
			function() {
				alert("오류가 발생하였습니다");
				history.back();
				}
		);
	}
	
form.addEventListener("submit", doSubmit);