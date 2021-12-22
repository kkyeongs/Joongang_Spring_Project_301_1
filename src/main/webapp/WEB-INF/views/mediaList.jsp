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

	
	<div class="row tm-mb-90 tm-gallery" style="margin: 0 8%;">
            <c:forEach var="media" items="${mediaList }" varStatus="status">
            <fmt:formatDate value="${media.mdate }" var="mdate" pattern="yy-MM-dd"/>
        		<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
        			<figure class="effect-ming tm-video-item">
        				<a href="mediaDetail?mnum=${media.mnum }">
        					<img src="https://img.youtube.com/vi/${media.link}/mqdefault.jpg" alt="Image" class="img-fluid" >
        				</a>
        			<figcaption>
        				<h6>${media.mtitle }
        				<a href="mediaDetail?mnum=${media.mnum }">자세히 보기</a></h6>
        			</figcaption>
        			</figure>
        			<div>
	                    <span>${mdate }</span>
	                    <span>조회수 ${media.mcount }</span>
                	</div>
                </div>
        	</c:forEach>
        </div> 
         <div style="margin: 0 auto; text-align: center;">
	<c:if test="${pg.startPage > pg.pageBlock}">
		<a class="btn btn-primary btn-sm" href="mediaList?currentPage=${pg.startPage - pg.pageBlock }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a class="btn btn-primary btn-sm" href="mediaList?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage > pg.totalPage }">
		<a class="btn btn-primary btn-sm" href="mediaList?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	</c:if>
	</div>
	<c:choose>
		<c:when test="${ varSessionState==4}">
			<div
				style="text-align: right; width: 68%; margin: 0 auto; margin-top: 2%;">
				<button onclick="location.href='mediaInsertForm'"
					class="btn btn-info btn-sm">글쓰기</button>
			</div>
		</c:when>
	</c:choose>

	<%@include file="footer.jsp" %>
</body>
</html>