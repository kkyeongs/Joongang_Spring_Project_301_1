<!-- 회원정보 수정 폼 - 금희 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
input {
	margin: .4rem;
}

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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta name="copyright" content="MACode ID, https://macodeid.com/">

<title>Insert title here</title>
<script type="text/javascript">
	function test() {
		if (!(frm.pw.value == frm.pwChk.value)) {
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}
	}
	const autoHyphen = (target) => {
		target.value = target.value
		.replace(/[^0-9]/, '')
		.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
</script>
</head>
<body>
	<!-- Back to top button -->
	<div class="back-to-top"></div>
	<%@include file="header.jsp"%>

	<div style="text-align: center; margin-top: 100px;">
		<form action="memberUpdatePro" name="frm" onsubmit="return test()">
			<h2>회원정보 수정</h2>
			<p>Edit profile</p>
			<hr style="width: 30%; height: 40px">
			회원 ID <br>
			<input type="hidden" name="id" required="required"
				value="${member.id}">${member.id} <br>
			<div style="margin-top: 2%">
				비밀번호 <br>
				<input type="text" name="pw" required="required"> <br>
			</div>
			<div style="margin-top: 2%">
				비밀번호 확인 <br>
				<input type="text" name="pwChk" required="required"> <br>
			</div>
			<div style="margin-top: 2%">
				이메일 <br> <input type="text" name="email" required="required"
					value="${member.email }"> <br>
			</div>
			<div style="margin-top: 2%">
				이름 <br>
				<input type="text" name="name" required="required"
					value="${member.name }"> <br>
			</div>
			<div style="margin-top: 2%">
				주소 <br>
				<input type="text" name="addr" required="required"
					value="${member.addr }"> <br>
			</div>
			<div style="margin-top: 2%">
				핸드폰 번호 <br>
				<input type="text" name="phone" class="phone" oninput="autoHyphen(this)" maxlength="13" required="required"
					value="${member.phone }"><br>
			</div>
			<input type="submit" value="확인" class="btn btn-sm btn-primary">
		</form>
	</div>
	<%@include file="footer.jsp"%>
<script src="js/memberJoin.js"></script>
</body>
</html>