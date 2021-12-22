<!-- 마이 페이지 > '내 정보' :금희 -->
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

#myInfo{
	border: 1px solid; padding: 15px; border-color: #DCD3D5; background-color: #5396E4;
}
#myInfoA{
	color: white;
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta name="copyright" content="MACode ID, https://macodeid.com/">

<script type="text/javascript">
	function test() {
		if(!(frm.pw.value == frm.pwChk.value)){
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}
	}
	
	function delChk() {
<<<<<<< HEAD
=======
		alert("탈퇴 왜 안나와")
>>>>>>> 910300b29223f3d7d32206073860a969e077f2d3
		var check;
		check = confirm("정말 탈퇴하시겠습니까?");
		if(check == true){
			location.href="memberDelete?id=${member.id}";
		}else if(check == false){
			return false;
		}
	}

</script>
</head>
<body>
	<!-- Back to top button -->
	<div class="back-to-top"></div>
	<%@include file="header.jsp"%>
<<<<<<< HEAD
	<%@ include file="myPageNav.jsp"%>
=======
>>>>>>> 910300b29223f3d7d32206073860a969e077f2d3

	<div style="text-align: center; margin-top: 100px;">
		<form action="memberUpdateForm" name="frm" onsubmit="return test()">
			<c:choose>
			    <c:when test="${empty result}">
			    </c:when>
			    <c:when test="${result eq '-1'}">
			        <script type="text/javascript">
			        	alert("회원정보 수정에 실패하였습니다.");
			        </script>
			    </c:when>
			    <c:otherwise>
			        <script type="text/javascript">
			        	alert("회원정보가 수정되었습니다.");
			        </script>
			    </c:otherwise>
			</c:choose>
			<h2>내 정보</h2>
			<p>My Info</p>
			<hr style="width: 30%; height: 40px">
			회원 ID <br> <input type="text" name="id" value="${member.id}"
				readonly="readonly"><br>
			<div style="margin-top: 2%">
				이메일 <br> <input type="text" name="email"
					value="${member.email }" readonly="readonly"> <br>
			</div>
			<div style="margin-top: 2%">
				이름 <br> <input type="text" name="name" value="${member.name }"
					readonly="readonly"> <br>
			</div>
			<div style="margin-top: 2%">
				주소 <br> <input type="text" name="addr" value="${member.addr }"
					readonly="readonly"> <br>
			</div>
			<div style="margin-top: 2%">
				핸드폰 번호 <br> <input type="text" name="phone"
					value="${member.phone }" readonly="readonly"><br>
			</div>

			<div style="margin-top: 4%">
				<input type="submit" value="수정" class="btn btn-sm btn-primary">
				<input type="button" value="탈퇴"  onclick="delChk()"
					class="btn btn-sm btn-primary">
			</div>
		</form>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>