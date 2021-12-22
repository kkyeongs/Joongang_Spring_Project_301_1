let date = new Date();

window.onload = function () { 
	renderCalender();
}

const renderCalender = () => {
    const viewYear = date.getFullYear();
    const viewMonth = date.getMonth();
    const viewDate = date.getDate();

    document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월 예약현황`;

    const prevLast = new Date(viewYear, viewMonth, 0);
    const thisLast = new Date(viewYear, viewMonth + 1, 0);
	
    const PLDate = prevLast.getDate();
    const PLDay = prevLast.getDay();

    const TLDate = thisLast.getDate();
    const TLDay = thisLast.getDay();

    const prevDates = [];
    const thisDates = [...Array(TLDate + 1).keys()].slice(1);
    const nextDates = [];

    if (PLDay !== 6) {
        for (let i = 0; i < PLDay + 1; i++) {
            prevDates.unshift(PLDate - i);
        }
    }

    for (let i = 1; i < 7 - TLDay; i++) {
        nextDates.push(i);
    }

    const dates = prevDates.concat(thisDates, nextDates);
    const firstDateIndex = dates.indexOf(1);
    const lastDateIndex = dates.lastIndexOf(TLDate);
	
    dates.forEach((date, i) => {
        const condition = i >= firstDateIndex && i < lastDateIndex + 1 ? 'this' : 'other';
        let Sdate = String (date);
        let PSdate = Sdate.padStart(2, "0");
        dates[i] = `<div class="date">
                        <span class=${condition} id="${viewYear}-${viewMonth + 1}-${PSdate}">${date}</span>
                    </div>`;
    });

    document.querySelector('.dates').innerHTML = dates.join('');
    
    const today = new Date();
    if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
        for (let date of document.querySelectorAll('.this')) {
            if (+date.innerText === today.getDate()) {
                date.classList.add('today');
                break;
            }
        }
    }
    ajaxData();
}

function ajaxData() {
 	const viewYear = date.getFullYear();
    const viewMonth = date.getMonth() + 1;
	let viewDate = "";

    if (viewMonth == 1 || viewMonth == 2 || viewMonth == 3 || viewMonth == 7 || viewMonth == 8 || viewMonth == 10 || viewMonth == 12) {
			viewDate = "31";
		} else if (viewMonth == 4 || viewMonth == 6 || viewMonth == 9 || viewMonth == 11) {
            viewDate = "30";
		} else if (viewMonth == 2){
			viewDate = "29";
		}
		
	console.log(viewMonth);
    console.log(viewDate);
    
	const param = {"year":viewYear, "month":viewMonth, "date":viewDate}
    $.ajax({
    	data : param,
        url: "reservationRestCalendar",
        type: "POST",
    }).done(function (data) {
        console.log(data);
		ajaxDataList = data;
	    for (let i = 0; i < data.length; i++) {
	        var forDate = data[i].resdate;
	        var str = "";
	        str += `<ul style="margin-bottom: 0px; padding-left: 0px;">`;
	        str += `<a style="cursor: pointer;" onclick="window.open('updateReservation?resnum=${data[i].resnum}','window_name','width=1000,height=700,location=no,status=no,scrollbars=yes')">`
	        str += `${data[i].name} ${data[i].restime} ${data[i].empname}선생`;
	        str += `</a>`;
	        str += `</ul>`;
	        console.log(data[i].resdate);
	        document.getElementById(forDate).innerHTML += str;
	    }
    }).fail(function () {
        alert("에러");
    });
}

const prevMonth = () => {
    date.setDate(1);
    date.setMonth(date.getMonth() - 1);
    console.log(date.getYear());
    console.log(date.getMonth());
    renderCalender();
}

const nextMonth = () => {
    date.setDate(1);
    date.setMonth(date.getMonth() + 1);
    console.log(date.getYear());
    console.log(date.getMonth());
    renderCalender();
}

const goToday = () => {
    date = new Date();
    console.log(date.getYear());
    console.log(date.getMonth());
    renderCalender();
};