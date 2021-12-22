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
.starwhite{
	font-size:30px;
	color: gray;
	
}
.staryellow{
	font-size:30px;
	color: yellow;
	
}
</style>

  <title>One Health - Medical Center HTML5 Template</title>
</head>
<script type="text/javascript">
function reviewdel() {
	var check;
	check = confirm("정말 삭제하시겠습니까?");
	if(check == true){
		location.href="reviewDelete?rnum=${review.rnum}";
	}else if(check == false){
		return false;
	}
	
	return true;
}
</script>
<body>
	<fmt:formatDate value="${review.rdate }" var="rdate"
				pattern="yy-MM-dd" />
  <!-- Back to top button -->
  <div class="back-to-top"></div>
    <%@include file="header.jsp" %>
    
	<div class="container" style="margin: 5% auto;">
		<div class="row">
			<div class="col" style="text-align: center;">
			<h2><b>치료 후기 게시판</b></h2>
			<hr style="border-color: black">
			</div>
		</div>
		<div class="row" style="text-align: center;">
			<div class="col">
			<h4>${review.rtitle }</h4>
			<hr style="border-color: gray;">
			</div>
		</div>
		<div class="row">
			<div class="col" style="text-align: right;">
			<span><b>ID : ${review.id }</b></span>&nbsp;&nbsp;&nbsp;
			<span>${rdate }</span>
			</div>
			<hr style="border-color: lightgrey;">
		</div>
		<div class="row">
			<div class="col">
			<!-- 선택한 별점 -->
				<c:forEach begin="1" end="${review.star }">
				<span class="staryellow" >★</span>
				</c:forEach>
				<!-- 선택하지 않은 별점 -->
				<c:set var="whitestars" value="${5 - review.star }"/>			
				<c:forEach begin="1" end="${whitestars }">
				<span class="starwhite">☆</span>
				</c:forEach>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col">
			<span>${review.rcontent }</span>
			</div>
		</div>
		
		<div style="margin: 3% auto; float: right;">
				<c:if test="${varSessionId == review.id }">
					<button
						onclick="location.href='reviewUpdateForm?rnum=${review.rnum}'"
						class="btn btn-sm btn-primary">수정</button>
					<button onclick="return reviewdel()"
						class="btn btn-sm btn-primary">삭제</button>
				</c:if>
				<button onclick="location.href='reviewList'"
					class="btn btn-sm btn-primary">목록</button>
		</div>
	</div>

	<%@include file="footer.jsp" %>
</body>
</html>