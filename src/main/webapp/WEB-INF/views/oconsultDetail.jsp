<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<script src="https://use.fontawesome.com/160d97aefa.js"></script>
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
function fn_oconsultUpdate(opw){
	if(frm.opw.value!=opw){
		alert("비밀번호가 일치하지 않습니다.");
		frm.opw.focus();
		return false;
	} else return true;
}

function fn_oconsultdel(opw){
	
	var check; // 변수선언
	var frmOpw = frm.opw.value;
	if(${varSessionState == 4} ) {
		check = confirm("정말 삭제하시겠습니까?");
		if(check == true){
			location.href="oconsultDelete?onum=${oconsult.onum}";
		}else{
			frm.opw.value="";
			frm.opw.focus();
		}
		return true;
	}
	if(frmOpw=="" || frmOpw == null){
		alert("비밀번호를 넣어 주세요");
		frm.opw.focus();
		return false;
	}
	
	if(frmOpw!=opw){
		alert("비밀번호가 일치하지 않습니다.");
		frm.opw.focus();
		return false;
	} else {
		check = confirm("정말 삭제하시겠습니까?");
		if(check == true){
			location.href="oconsultDelete?onum=${oconsult.onum}";
		}else{
			frm.opw.value="";
			frm.opw.focus();
		}
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
	
	<div class="container" style="margin: 5% auto;">
			<h2>공개 상담</h2>
			
	<form action="oconsultUpdateForm" method="post" name="frm" onsubmit="return fn_oconsultUpdate(${oconsult.opw })">
			<hr style="border-top: 3px solid #000000">
			<fmt:formatDate value="${oconsult.odate }" var="odate" pattern="yy-MM-dd" />
			<div class="row" style="margin: 5% auto; margin-bottom: 2%">
				<div class="col">
					<h4>제목 : ${oconsult.otitle }</h4>
				</div>
			</div>
			<div class="row" style="margin: 0 auto;">
			
				<div class="col">작성자 : ${oconsult.owriter }</div>
			</div>
			<div class="row row-cols-auto" style="margin: 0 auto;">
				
			 	<input type="hidden" name="rn" value="${oconsult.rn}">
			 	<input type="hidden" name="onum" value="${oconsult.onum}">
				<div class="col">날짜 : ${odate }</div>
				<div class="col">조회수 : ${oconsult.ocount }</div>
				<div class="col"></div>
				<div class="col"></div>
				<div class="col"></div>
				<div class="col"></div>
			</div>
			<hr style="background-color: #fff; border-top: 2px dotted #bbb;">
			<div class="row" style="margin: 2% auto;">
				<div class="col-8">${oconsult.ocontent }</div>
			</div>

		<div style="margin: 3% auto; float: right;">
			<input type="password" name="opw" required="required" maxlength="5" 
				placeholder="글 비밀번호 입력" style="text-align:center" size="13">
					<input type="submit" value="수정" class="btn btn-sm btn-primary">
					<input type="button" value="삭제" onclick="fn_oconsultdel(${oconsult.opw })" class="btn btn-sm btn-primary">
				<input type="button" value="목록" onclick="location.href='oconsultList'" class="btn btn-sm btn-primary">
			<c:choose>
				<c:when test="${varSessionState==4 }">
					<button onclick="location.href='oconsultReplyForm?onum=${oconsult.onum}'" class="btn btn-sm btn-primary">답변</button>
				</c:when>
			</c:choose>
		</div>		
			<br><br>	
	</form>
</div>

</body>
	<%@include file="footer.jsp" %>
</html>