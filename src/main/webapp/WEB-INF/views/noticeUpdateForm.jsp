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
#notice{
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
	
    <form action="noticeUpdateResult">
    <table style="width: 60%; margin: 0 auto; margin-bottom: 3%; font-family: NanumBarunGothic">
    	<tr><th>글번호</th></tr>
    	<tr><td><input type="hidden" name="nnum" value="${notice.nnum }">${notice.nnum }</td></tr>
		<tr><th>제목</th></tr>
		<tr><td><input type="text" name="ntitle" value="${notice.ntitle }"></td></tr>
		<tr><th>조회수</th></tr>
		<tr><td><input type="hidden" name="ncount" value="${notice.ncount }">${notice.ncount }</td></tr>
		<tr><td>
			<textarea cols="50" rows="10" name="ncontent">${notice.ncontent }</textarea><p></td></tr>
		<tr><td colspan="2">
			<input class="btn btn-primary" type="submit" value="수정완료">
		</td></tr>
		
		<!-- 관리자용 공지사항 수정으로 이동, 조건 어떻게 줘야할지 모루겠다 -->
		<%-- <c:if test=""> --%>
		<tr><td colspan="2">
			<input type="submit" value="수정완료">
		</td></tr>
		<%-- </c:if> --%>
	</table>
	</form>
	<%@include file="footer.jsp" %>

</body>
</html>