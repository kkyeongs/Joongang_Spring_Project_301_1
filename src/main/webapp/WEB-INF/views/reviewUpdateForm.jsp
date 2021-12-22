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
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('img/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>

</head>
<body>

  <!-- Back to top button -->
  <div class="back-to-top"></div>
	<%@include file="header.jsp" %>
	
	<form action="reviewUpdatePro" method="post">
	<div class="container" style="margin: 5% auto;" >
		<h2>게시판 수정</h2>
		<hr style="border-top:3px solid #000000">
		<div class="row" style="margin: 3% auto;">
			<div class="col">
				<label for="ptitle">
					<h5>제목 : </h5> </label>
				<input type="text" name="rtitle" value="${review.rtitle }" style="width: 100%;">
				</div>
		</div>
		<div class="row" style="margin: 3% auto;">
			<div class="col">
				<label for="id">
					<h5>작성자 : </h5> </label>
				<input type="text" name="id" style="width: 100%;" readonly="readonly" value="${varSessionId }">
			</div>
		</div>
		<div class="row" style="margin: 3% auto;">
			<div class="col">
				<label for="ptitle">
				<h5>내용 :</h5> </label>
					<textarea rows="3" name="rcontent" style="width: 100%;">${review.rcontent }</textarea>
			</div>
		</div>
		<div class="row" style="margin: 3% auto;">
			<div class="col">
				<h5 style="display: inline-block;">평점 :</h5>
				<span class="star-input">
					<span class="input">
			    		<input type="radio" name="star" value="1" id="p1">
			    		<label for="p1">1</label>
				    	<input type="radio" name="star" value="2" id="p2">
				    	<label for="p2">2</label>
				    	<input type="radio" name="star" value="3" id="p3">
				    	<label for="p3">3</label>
				    	<input type="radio" name="star" value="4" id="p4">
				    	<label for="p4">4</label>
				    	<input type="radio" name="star" value="5" id="p5">
				    	<label for="p5">5</label>
			  		</span>
			  			<output for="star-input"><b>0</b>점</output>						
				</span>
			</div>
		</div>
		<div style="margin: 0 auto; float: right;">
			<!-- 비어있거나 올바르지 않다면 alert 처리하기 -->
			<input type="hidden" value="${review.rnum }" name="rnum">
			<input type="submit" value="수정하기" class="btn btn-sm btn-primary">
			<!-- 취소하면 정말 취소하시겠습니까 alert 처리하기 -->
			<button type="button" onclick="location.href='reviewList'" class="btn btn-sm btn-primary">취소</button>	
			
		</div>
	</div>
	</form>
	
	<%@include file="footer.jsp" %>
	<script src="js/star.js"></script>
</body>
</html>