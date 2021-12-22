const form = document.querySelector("#reservation_form");
const id = document.querySelector("#reservationId");
const date = document.querySelector("#reservationDate");
const time = document.querySelector("#reservationTime");
const content = document.querySelector("#reservationMessage");
const ename = document.querySelector("#reservationEname");
const submit = document.querySelector("#reservation_submit");
const resnum = document.querySelector("#reservationNum");
const button = document.querySelector("#reservation_Delete");

function doSubmit(event){
    event.preventDefault();
    submitAjax();
}

function submitAjax() {
    const params = {"resnum":resnum.value, "id":id.value, "resdate":date.value, "restime":time.value, "rescontent":content.value, "empname":ename.value}
    $.ajax(
		{
		type: "GET",
		url: "updateDoReservationSubmit",
		data: params,
		}).done(
			function (data) {
			alert("수정이 완료되었습니다");
			opener.location.reload();
			window.close();
			}
		).fail(function() {
			alert("오류가 발생하였습니다");
			history.back();
			}
		)
	}
	
button.onclick= function(event) {
    event.preventDefault();
    deleteAjax();
}

function deleteAjax() {
    const params = {"resnum":resnum.value}
    $.ajax(
		{
		type: "GET",
		url: "deleteDoReservation",
		data: params,
		}).done(
			function (data) {
				alert("삭제가 완료되었습니다");
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
