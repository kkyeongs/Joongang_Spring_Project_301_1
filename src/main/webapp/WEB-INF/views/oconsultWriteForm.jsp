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
</style>
<script type="text/javascript">
function fn_oconsultcan(){
	var check;
	check = confirm("정말 취소하시겠습니까?");
	if(check == true){
		location.href="oconsultList"
	}
}
</script>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <meta name="copyright" content="MACode ID, https://macodeid.com/">
</head>

<body>

  <!-- Back to top button -->
  <div class="back-to-top"></div>
	<%@include file="header.jsp" %>
	
	<form action="oconsultWrite" >
	<div class="container" style="margin: 5% auto;" >
		<h2>게시물 등록</h2>
		<hr style="border-top:3px solid #000000">
		<div class="row" style="margin: 3% auto;">
			<div class="col">
				<label for="otitle">
					<h5>제목 : </h5> </label>
				<input type="text" name="otitle" placeholder="제목을 입력하세요" style="width: 100%;" required="required">
				<!--???  <input type="hidden" name="onum" value="1"> -->
				</div>
		</div>
		<div class="row" style="margin: 3% auto;">
			<div class="col">
				<label for="id">
					<h5>작성자 : </h5> </label>
				<input type="text" name="owriter" placeholder="작성자를 입력하세요" style="width: 100%;" required="required" >
			</div>
		</div>
		<div class="row" style="margin: 3% auto;">
			<div class="col">
				<label for="otitle">
				<h5>내용 :</h5> </label>
					<textarea rows="3" name="ocontent" placeholder="내용을 입력하세요" style="width: 100%;" required="required"></textarea>
			</div>
		</div>
	
		<div style="margin: 0 auto; float: right;">
			<input type="password" name="opw" placeholder="글 비밀번호 입력하세요" required="required">
			<input type="submit" value="작성완료" class="btn btn-sm btn-primary">
			<!-- 취소하면 정말 취소하시겠습니까 alert 처리하기 -->
			<button type="button" onclick="return fn_oconsultcan()" class="btn btn-sm btn-primary">취소</button>	
			
		</div>
	</div>
	</form>

	<%@include file="footer.jsp" %>
</body>
</html>