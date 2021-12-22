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
<link rel="stylesheet" href="vendor/owl-carousel/css/owl.carousel.css">
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
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/MaruBuri-Regular.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 400;
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix')
		format('embedded-opentype'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff')
		format('woff'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf')
		format('truetype');
}

body {
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
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta name="copyright" content="MACode ID, https://macodeid.com/">
</head>

<body>
	<!-- Back to top button -->
	<div class="back-to-top"></div>
	<%@include file="header.jsp"%>

	<form action="oconsultUpdate" method="post">
		<input type="hidden" name="onum" value="${oconsult.onum }">
		
		<div class="container" style="margin: 5% auto;">
			<h2>공개상담글 수정</h2>
			<hr style="border-top: 3px solid #000000">
			<div class="row" style="margin: 3% auto;">
				<div class="col">
					<label for="otitle">
						<h5>제목 :</h5>
					</label> <input type="text" name="otitle" value="${oconsult.otitle }" 
						style="width: 100%;" required="required"> <!-- value가 dto가 oconsult인 otitle에 들어가>컨트롤러에서 oconsult로 뭉탱이로 받아 -->
				</div>
			</div>
			<div class="row" style="margin: 3% auto;">
				<div class="col">
					<label for="owriter">
						<h5>작성자 :</h5>
					</label> <input type="text" name="owriter" value="${oconsult.owriter }"
						style="width: 100%;" readonly="readonly">
				</div>
			</div>
			<div class="row" style="margin: 3% auto;">
				<div class="col">
					<label for="ocontent">
						<h5>내용 :</h5>
					</label>
					<pre><textarea rows="3" name="ocontent" style="width: 100%;" required="required">
					${oconsult.ocontent}</textarea></pre>
				</div>
			</div>

			<div style="margin: 0 auto; float: right;">
				
				<input type="submit" value="확인" class="btn btn-sm btn-primary">
				<input type="button" value="취소" onclick="return fn_oconsultcan()" class="btn btn-sm btn-primary"></input>
			</div>
		</div>
	</form>
	<%@include file="footer.jsp"%>
</body>
</html>