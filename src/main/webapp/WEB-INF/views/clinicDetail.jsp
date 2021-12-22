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

<script type="text/javascript">

	function updateEnable(){
		var originContent = document.getElementById("originContent");
		var test = document.getElementById("updateClinic");
		originContent.type="text";
		$('#originContent').prop('readonly',false);
		$('#updateClinic').attr('onclick','').unbind('click');
		$('#updateClinic').prop('type','submit');
		$('#updateClinic').html('수정등록');
		return false;
	}
	function deletePro(){
		var check = confirm("해당 진료내역을 삭제하시겠습니까?");
		
		if(check==true){
			var temp = $('#cnum').val();
			location.href="deletePro?cnum="+temp;
		}
	}
</script>

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
#clinicWriteProA{
	color:white;
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
	
	<form action="clinicUpdatePro" method="post">
	<div class="container" style="margin: 5% auto;" >
		<h2>진료 내역</h2>
		<hr style="border-top:3px solid #000000">
		<div class="row" style="margin: 3% auto;">
			<div class="col">
					<h5>환자 이름 :</h5> 
				<input readonly="readonly"   value= "${name}" style="width: 100%;">
				<input type="hidden"  name="id" value= "${clinic.id}" style="width: 100%;">
			</div>
		</div>
		<div class="row" style="margin: 3% auto;">
			<div class="col">
					<h5>담당의 : </h5>
				<input type="text" name="ename" value="${ename}" style="width: 100%;" readonly="readonly">
				
			</div>
		</div>
		<div class="row" style="margin: 3% auto;">
			<div class="col">
				<h5>진료 내역 :</h5>
					<input id="originContent" name="ccontent" readonly="readonly"  value="${clinic.ccontent }" style="width:100%; height:45%;">
					
			</div>
		</div>
		<input type="hidden" value="${clinic.cnum }" id="cnum" name = "cnum">
		<input type="hidden" value="${clinic.empno }" name="empno">
		<input type="hidden" value="${sessionDept }" name="dept">
		<input type="hidden" value="${result }" name="result">
		<div id="buttons" style="margin: 0 auto; float: right;">
			<button type="button" class="btn-sm btn-primary" id="updateClinic" onclick="return updateEnable()">수정</button>
			<button type="button" class="btn-sm btn-primary" id="deleteClinic" onclick="return deletePro()">삭제</button>
		</div>
		
	</div>
	</form>
	
	
	
	<%@include file="footer.jsp" %>
</body>
</html>