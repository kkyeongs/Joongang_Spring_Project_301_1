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
<link rel="stylesheet"href="vendor/owl-carousel/css/owl.carousel.css">
<link rel="stylesheet" href="vendor/animate/animate.css">
<link rel="stylesheet" href="css/theme.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="vendor/owl-carousel/js/owl.carousel.min.js"></script>
<script src="vendor/wow/wow.min.js"></script>
<script src="js/theme.js"></script>
<style type="text/css">
@font-face {
    font-family: 'GowunBatang-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'MaruBuri-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/MaruBuri-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
	font-family: 'MaruBuri-Regular';
}

#punchOperation{
	border: 1px solid; padding: 15px; border-color: #DCD3D5; background-color: #5396E4;
}
#punchOperationA{
	color: white;
}
</style>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <meta name="copyright" content="MACode ID, https://macodeid.com/">
  
  
</head>
<body>
	
	 <!-- Back to top button -->
  <div class="back-to-top"></div>
  <%@ include file="header.jsp" %>
  <%@ include file="empOperationNav.jsp" %>
  <div style="text-align: center;">
  <c:choose>
  <c:when test="${varSessionState==4}">
  		<button class="btn btn-primary ml-lg-3"
  				style="background-color: #5F5F5F; text-align:center;"><a href="qrMaker" style="color:white;">QR생성</a></button>
  		<button class="btn btn-primary ml-lg-3"
  				style="background-color: #5F5F5F; text-align:center;"><a href="punchList" style="color:white;">출퇴근 기록부 조회</a></button>
  		
  </c:when>
  </c:choose>
  <c:choose>
  <c:when test="${varSessionState!=4 }">
	    <button class="btn btn-primary ml-lg-3"
				style="background-color: #5F5F5F; text-align: center;"><a href="punchOnQR" style="color:white;">출근</a></button>
  		<button class="btn btn-primary ml-lg-3"
				style="background-color: #5F5F5F; text-align: center;"><a href="punchOffQR" style="color:white;">퇴근</a></button>
  		<p/>!!!!!!!!!!!!!!!!!!신중히 누르세요!!!!!!!!!!!!!!!!
  </c:when>
  </c:choose>
  </div>
  <%@ include file="footer.jsp" %>
</body>
</html>