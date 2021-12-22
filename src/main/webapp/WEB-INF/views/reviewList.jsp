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
.container1{
	background: white;
	text-align:center;
	width: 80%;
	height: 735px;
	margin: 1% auto;
	margin-bottom: 91px;
}
.reviewgl{
	background: white;
	width: 365px;
	height: 32%;
	margin: 20px 20px 20px 90px;
	display: inline-block;
	float: left;
	border: 1px solid gray;
	word-break:break-all;
	
}
.reviewgl a{
	text-decoration: none;
	width:inherit;
	height:auto;
	float: inherit;
	text-align:left;
	text-overflow:ellipsis;
	display: block;
	position: absolute;
	padding: 20px;
	word-break:break-all;
	color: black;
	vertical-align: baseline;
}
.starwhite{
	color: gray;
	
}
.staryellow{
	color: yellow;
	
}
.blueborder{
	border-color: blue;
}
</style>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <meta name="copyright" content="MACode ID, https://macodeid.com/">
  
  
</head>
<script type="text/javascript">

function a_mouseover(index){
	var id = document.getElementById("reviewgl"+index);
	
	$(id).mouseover(function(){
	    $(id).css("border-color", "blue");
	  });

	  $(id).mouseout(function(){

	    $(id).css("border-color", "grey");

	  });
		
	}
	
</script>
<body>

  <!-- Back to top button -->
  <div class="back-to-top"></div>
	<%@include file="header.jsp" %>
	<div class="row" style=" margin: 3% auto; width: 65%; text-align: center; font-size: 18px; font-family: NanumBarunGothic;">
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="pConsultCount" >온라인상담</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="oconsultList">공개상담</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; background-color: #5396E4;" ><a href="reviewList" style="color: white;">치료후기</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="mediaList">강연&방송</a></div>
    </div>
    <div style="text-align: center;">
	<div class="container1" align="center">
	<c:forEach var="review" items="${reviewList}" varStatus="status">
	<fmt:formatDate value="${review.rdate }" var="rdate" pattern="yy-MM-dd"/>
		<div class="reviewgl"  id="reviewgl${status.index}" onmouseover="a_mouseover(${status.index})">
			<a href="reviewDetail?rnum=${review.rnum }" id="Abutton" >
				<h5 style="color: black; display: inline-block;"><b>${review.id }님의 후기</b></h5>
				<p class="stars" style="float: right; margin-bottom: 0px;">
					<!-- 선택한 별점 -->
					<c:forEach begin="1" end="${review.star }">
					<span class="staryellow" >★</span>
					</c:forEach>
					<!-- 선택하지 않은 별점 -->
					<c:set var="whitestars" value="${5 - review.star }"/>			
					<c:forEach begin="1" end="${whitestars }">
					<span class="starwhite">☆</span>
					</c:forEach>
						
				</p>
				<span style="font-size: 20px; display: block; color: gray">${review.rtitle}</span>		
				
				<hr>
				<h6>${review.rcontent }</h6><br>
				<p style="vertical-align: bottom; position: absolute;">${rdate }</p>
			</a>
		</div>
	</c:forEach>
	
	</div>
	</div>
		<div style="margin: 0 auto; text-align: center; display: block;" >
		<c:if test="${pg.startPage > pg.pageBlock}">
			<a class="btn btn-primary btn-sm" href="reviewList?currentPage=${pg.startPage - pg.pageBlock }">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
			<a class="btn btn-primary btn-sm" href="reviewList?currentPage=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${pg.endPage > pg.totalPage }">
			<a class="btn btn-primary btn-sm" href="reviewList?currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
		</c:if>
		</div> 
		
		<c:if test="${varSessionId != null }">
		<div style="text-align: right; width: 68%; margin: 0 auto; margin-top: 2%; " >
			<button onclick="location.href='reviewInsertForm'" class="btn btn-info btn-sm">글쓰기</button>
		</div>
		</c:if>
	
	
	
	
	<%@include file="footer.jsp" %>
</body>
</html>