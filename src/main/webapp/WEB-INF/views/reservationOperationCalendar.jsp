<!-- 예약내역 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<link href="css/board.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/maicons.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="vendor/owl-carousel/css/owl.carousel.css">
<link rel="stylesheet" href="vendor/animate/animate.css">
<link rel="stylesheet" href="css/theme.css">
<link rel="stylesheet" href="css/reservationCalendar.css">

<style type="text/css">
@font-face {
	font-family: 'GowunBatang-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'MaruBuri-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/MaruBuri-Regular.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'MaruBuri-Regular';
}
</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta name="copyright" content="MACode ID, https://macodeid.com/">


</head>
<body>

	<!-- Back to top button -->
	<div class="back-to-top"></div>

	<%@include file="header.jsp" %>
	<%@include file="empOperationNav.jsp" %>

	<div class="calendar">
		<div class="header">
			<div class="year-month"></div>
			<h1>${sessionId }</h1>
			<c:if test="${sessionId ne null}">
				<div>
					<button style="width: 150%;"
						onclick="window.open('makeAReservationOperation','window_name','width=1000,height=700,location=no,status=no,scrollbars=yes');">
						예약</button>
				</div>
			</c:if>
			<div class="nav">
				<button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
				<button class="nav-btn go-today" onclick="goToday()">Today</button>
				<button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
			</div>
		</div>
		<div class="main">
			<div class="days">
				<div class="day list-group-item list-group-item-success">일</div>
				<div class="day list-group-item list-group-item-success">월</div>
				<div class="day list-group-item list-group-item-success">화</div>
				<div class="day list-group-item list-group-item-success">수</div>
				<div class="day list-group-item list-group-item-success">목</div>
				<div class="day list-group-item list-group-item-success">금</div>
				<div class="day list-group-item list-group-item-success">토</div>
			</div>
			<div class="dates"></div>
		</div>
	</div>


	<script src="js/reservationOperationCalendar.js"></script>
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="vendor/owl-carousel/js/owl.carousel.min.js"></script>
	<script src="vendor/wow/wow.min.js"></script>
	<script src="js/theme.js"></script>
	<%@include file="footer.jsp"%>
</body>
</html>