<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    font-family: 'MaruBuri-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/MaruBuri-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 400;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype');
}
body{
	font-family: 'MaruBuri-Regular';
}
#media{
	background-color: #5396E4;
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
  	<%@include file="header.jsp" %>
	<%@include file="hospitalNav.jsp"%>
    
    <table style="width: 60%; margin: 0 auto; margin-bottom: 3%; font-family: NanumBarunGothic">
    <fmt:formatDate value="${media.mdate }" var="mdate" pattern="yy-MM-dd"/>
		<tr><th>제목</th></tr>
		<tr><td>${media.mtitle }</td></tr>
		<tr><th>날짜</th></tr>
		<tr><td>${mdate }</td></tr>
		<tr><th>조회수</th></tr>
		<tr><td>${media.mcount }</td></tr>
		<tr><td>
		<div>
			<iframe width="575" height="323" src="https://www.youtube.com/embed/${media.link}" 
			title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
			</iframe>
		</div>
		<c:choose>
			<c:when test="${ varSessionState==4}">
				<tr><td colspan="2">
				<button class="btn btn-primary" onclick="location.href='mediaDeletePro?mnum=${media.mnum}'">삭제</button>
				<button class="btn btn-primary" onclick="location.href='mediaUpdate?mnum=${media.mnum}'">수정</button>
			</td></tr>
			</c:when>
		</c:choose>
		
	</table>
	
	<%@include file="footer.jsp" %>

</body>
</html>