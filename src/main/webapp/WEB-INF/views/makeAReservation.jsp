<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <meta name="copyright" content="MACode ID, https://macodeid.com/">
  <title>침, 그리고 찌르다</title>
  <link rel="stylesheet" href="css/maicons.css">
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="vendor/owl-carousel/css/owl.carousel.css">
  <link rel="stylesheet" href="vendor/animate/animate.css">
  <link rel="stylesheet" href="css/theme.css">
</head>
<body>
  <div class="page-section">
    <div class="container">
      <h1 class="text-center wow fadeInUp">예약</h1>

      <form id="reservation_form" class="contact-form mt-5">
        <div class="row mb-3">
          <div class="col-sm-6 py-2 wow fadeInLeft">
            <label for="fullName">아이디</label>
            <input type="text" id="reservationId" name="id" class="form-control" value="${sessionId }" readonly="readonly">
          </div>
          <div class="col-sm-6 py-2 wow fadeInRight">
            <label for="emailAddress">의사 선생님</label>
            <select class="form-control" name="empno" id="reservationEmpno">
            	<c:forEach var="doctor" items="${EmpName }">
            		<option value="${doctor.empno }">${doctor.name }</option>
            	</c:forEach>
            </select>
          </div>
          <div class="col-sm-6 py-2 wow fadeInLeft">
            <label for="date">날짜</label>
            <input type="date" id="reservationDate" name="resdate" class="form-control">
          </div>
          <div class="col-sm-6 py-2 wow fadeInRight">
            <label for="emailAddress">시간</label>
            <input type="time" id="reservationTime" name="restime" class="form-control">
          </div>
          <div class="col-12 py-2 wow fadeInUp">
            <label for="message">하고싶은 말</label>
            <textarea id="reservationMessage" name="rescontent" class="form-control" rows="8" placeholder="남기실 말을 적어주세요 :)"></textarea>
          </div>
        </div>
        <input type="submit" id="reservation_submit" class="btn btn-primary wow zoomIn" value="예약하기">
        <button type="button" class="btn btn-primary wow zoomIn" onclick="window.close()">　취소　</button>
      </form>
    </div>
  </div>

<script src="js/makeAReservation.js"></script>
  
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="vendor/owl-carousel/js/owl.carousel.min.js"></script>
<script src="vendor/wow/wow.min.js"></script>
<script src="js/theme.js"></script>
</body>
</html>