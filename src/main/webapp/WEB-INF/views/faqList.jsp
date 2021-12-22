<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
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
.faq_div{
	width: 68%; 
	height: 100%;
	line-height: 85px;
	vertical-align: middle;
	margin: 0 auto; 
	font-family: NanumBarunGothic;
	border-bottom: 1px solid #EAEAEA;
	border-bottom-color: #EAEAEA;
	text-align: center;
}
.answer_div{
	width: 68%; 
	height: 100%; 
	padding: 3%;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
	margin: 0 auto; 
	font-family: NanumBarunGothic;
	background-color: #F6F6F6;
	
}
#faq{
	background-color: #5396E4;
	color: white;
}
</style>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <meta name="copyright" content="MACode ID, https://macodeid.com/">
  
</head>
<script type="text/javascript">
	function faq_list(num) {
		if($('#faq_list'+num).next().css('display')=='none'){
			$('#faq_list'+num).next().show();
		}else{
			$('#faq_list'+num).next().hide();
		}
	}
	
</script>
<body>

  <!-- Back to top button -->
  	<div class="back-to-top"></div>
  	<%@include file="header.jsp" %>
	<%@include file="hospitalNav.jsp"%>
    <div>
	    <c:forEach var="faq" items="${faqList }" varStatus="status">
		    <div class="faq_div" id="faq_list${status.index}" onclick="faq_list(${status.index})">
		    	${faq.rn }&nbsp;${faq.ftitle}
		    	<c:choose>
			    	<c:when test="${ varSessionState==4}">
				    	<button class="btn btn-primary" onclick="location.href='faqUpdateForm?fnum=${faq.fnum}'">수정</button>
			    		<button class="btn btn-primary" onclick="location.href='faqDeletePro?fnum=${faq.fnum}'">삭제</button>
		    		</c:when>
		    	</c:choose>
		    
		    </div>
		    <div class="answer_div" id="answer_list" style="display: none;">
		    	${faq.fcontent }
		    </div>
		    <br>
	    </c:forEach>
    </div>
		    
	<c:choose>
		<c:when test="${ varSessionState==4}">
			<div
				style="text-align: right; width: 68%; margin: 0 auto; margin-top: 2%;">
				<button onclick="location.href='faqInsertForm'"
					class="btn btn-info btn-sm">글쓰기</button>
			</div>
		</c:when>
	</c:choose>

</body>
	<%@include file="footer.jsp" %>
</html>