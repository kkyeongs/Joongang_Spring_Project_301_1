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
<!-- <script src="js/pconsultList.js"></script> -->
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
	
	<div class="row" style=" margin: 3% auto; width: 65%; text-align: center; font-size: 18px; font-family: NanumBarunGothic;">

            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="pConsultCount" >온라인상담</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5;  background-color: #5396E4 "><a href="oconsultList" style="color: white;">공개상담</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="reviewList">치료후기</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="mediaList">강연&방송</a></div>

    </div>
	
	<table style="width: 68%; margin: 0 auto; margin-bottom: 1%">
		<thead>
			<tr style="font-family: NanumBarunGothic">
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>	
		</thead>
		<tbody>
		
		<c:forEach var="listOconsult" items="${listOconsult}" >
		<fmt:formatDate value="${listOconsult.odate }" var="odate" pattern="yy-MM-dd"/>
			<tr style="font-family: NanumBarunGothic">
				<td style="width: 100px;">${listOconsult.rn2}</td>
				<td>${listOconsult.owriter }</td>
				<!-- 제목 -->
				<td style="width: 500px; text-align: left;">
						<!-- oconsultDetail.jsp가 아닌 무조건 oconsultDetail 컨트롤러로 먼저 간다 -->
						<c:forEach begin="1" end="${listOconsult.oindent }">-</c:forEach>
					<a href="oconsultDetail?onum=${listOconsult.onum}" style="color: black;">${listOconsult.otitle }</a>
				</td>
				<td style="width: 180px;">${odate }</td>
				<td style="width: 100px;">${listOconsult.ocount }</td>
			</tr>
		</c:forEach>
		</tbody>		
	</table>

	<div style="margin: 0 auto; text-align: center;">
	<c:if test="${pg.startPage > pg.pageBlock}">
		<a class="btn btn-primary btn-sm" href="oconsultList?currentPage=${pg.startPage - pg.pageBlock }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a class="btn btn-primary btn-sm" href="oconsultList?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage > pg.totalPage }">
		<a class="btn btn-primary btn-sm" href="oconsultList?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	</c:if>
	</div>
	
	<div
		style="text-align: right; width: 68%; margin: 0 auto; margin-top: 2%;">
		<button onclick="location.href='oconsultWriteForm'"
			style="font-family: NanumBarunGothic;" class="btn btn-info btn-sm">글쓰기</button>
	</div>

	<%@include file="footer.jsp"%>

</body>
</html>