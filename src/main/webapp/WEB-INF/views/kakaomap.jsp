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
#kmap{
	background-color: #5396E4;
	color: white;
}
</style>

<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <meta name="copyright" content="MACode ID, https://macodeid.com/">
<title>KaKao 지도</title>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="hospitalNav.jsp"%>
	<div style="margin: auto; margin-top: 3%; text-align: center; border-bottom: 1px solid #ddd; padding-bottom: 2rem; margin-bottom: 3rem; position: relative; width: 700px;" > <h2>오시는 길</h2> </div>

	<div id="map" style="width:700px; height:400px; margin: auto;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey="></script>

	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.556396670428946, 126.94519695864987),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
	
	<div style=" margin: auto; text-align: center;   border-bottom: 1px solid #ddd; padding: 3rem 0; width: 700px; height: 3%">
		<p style="color: #000; font-weight: 500; line-height: 50px; float: left; font-family: NanumBarunGothic; "><img src="img/map/map_ic.png"> 마포구 대흥동 중앙정보처리학원</p>
		<div style="float: right; width: 30%;">
			<p>	
				<span> 
					<img src="img/map/tel_ic.png"  style="float: left; height: 21%; width: 21%; margin-left: 30%;"><b style="float: left; text-align: left"> TEL<br>"02-1111-1234"</b>
					
				</span>
			</p>
		</div>
	 </div>
	 
<%@include file="footer.jsp" %>
</body>
</html>