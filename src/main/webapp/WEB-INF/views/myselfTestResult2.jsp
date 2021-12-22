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
<!-- <script src="js/pconsultList.js"></script> -->
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

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <meta name="copyright" content="MACode ID, https://macodeid.com/">
  
  <title>One Health - Medical Center HTML5 Template</title>

</head>
<body>
	
  <!-- Back to top button -->
  <div class="back-to-top"></div>
  <%@include file="header.jsp" %>
  <div class="row" style=" margin: 3% auto; width: 65%; text-align: center; font-size: 18px; font-family: NanumBarunGothic;">

            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="myselfTest">심장질환</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; background-color: #5396E4"><a href="myselfTest2" style="color: white;">우울증</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="myselfTest3">공황장애</a></div>
  </div>
  <div class="container" style="margin: 3% auto; width: 65%; text-align: left; font-size: 18px; font-family: NanumBarunGothic;">
  	<div class="row">
  		<div class="col">
  		<span style="font-size: 35px;">${myTest.name }님</span> (${myTest.gender})의 자가진단 결과는 다음과 같습니다.
  		</div>
  	</div>
  	<hr>


		<div class="row stacked" style="margin-bottom: 20px;">
			<div class="col-sm-4" style="text-align: center; background-color: gray; color: white"">
				<div class="cal-widget" style="margin-top: 40px;">
					<div class="cal-title" >TOTAL</div>
					<div class="cal-int" >
						<span id="jumsu" style="font-size: 40px;">${total}</span> 점
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="cal-widget-right">
					<strong>우울증테스트결과 합산점수에 따라 우울증자가진단을 해볼 수 있다.</strong>
					<ul>
						<li>0 ~ 15점 : 일반적인 상태</li>
						<li>16 ~ 30점 : 우울증 초기, 가끔 우울하지만 극복 가능한 상태</li>
						<li>31 ~ 45점 : 심한 우울증이 의심되며 주변 주변 지인들의 도움이 필요</li>
						<li>50점 이상은 전문가의 상담치료가 필요</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col">
				<c:choose>
					<c:when test="${total >=0 and total <= 15 }">
						<p>
							결과 : <span style="color: blue; font-size: 30px;">일반정인 상태 (정상)</span>
							<div class="row">
								<div class="col">
									<span style="color: gray; font-size: 15px;">이럴 경우 대처하는 방안은 다음과 같습니다.(아래 내용 참조)</span>
								</div>
							</div>
								<br>
							<div class="row">
								<div class="col" style="border: 1px dotted gray;">
									<span>  </span><br>
									<ul>
										<li>가벼운 운동을 한다.</li>
										<li>기분을 가볍고 즐겁게 유지한다.</li>
									</ul>
								</div>
							</div>
					</c:when>
					<c:when test="${total >= 16 and total <= 30 }">
						<p>
							결과 : <span style="color: orange; font-size: 30px;">우울증 초기 단계</span>
							<div class="row">
								<div class="col">
									<span style="color: gray; font-size: 15px;">이럴 경우 대처하는 방안은 다음과 같습니다.(아래 내용 참조)</span>
								</div>
							</div>
								<br>
							<div class="row">
								<div class="col" style="border: 1px dotted gray;">
									<span>  </span><br>
									<ul>
										<li>하루일과 중에서 5분이라도 반드시 일정한 시간을 건강을 위해서 쓴다.</li>
										<li>취미활동을 만들어 여가시간을 활발히 보낸다.</li>
										<li>가벼운 운동을 한다.</li>
										<li>주변 사람들과 상담을 통해 심리적 안정을 얻는다.</li>
										<li>한의원을 방문하여 조언을 듣는다.</li>
										<li>심리, 감정과 관련된 독서를 한다.</li>
									</ul>
								</div>
							</div>
					</c:when>
					<c:when test="${total >=31 and total <= 45 }">
						<p>
							결과 : <span style="color: green; font-size: 30px;">우울증 중간 단계</span>
							<div class="row">
								<div class="col">
									<span style="color: gray; font-size: 15px;">이럴 경우 대처하는 방안은 다음과 같습니다.(아래 내용 참조)</span>
								</div>
							</div>
								<br>
							<div class="row">
								<div class="col" style="border: 1px dotted gray;">
									<span> 일상생활 속에서 많은 노력을 하였음에도 불구하고 내 기분을 내가 통제하지 못하는 경우,
									내 기분에 압도되는 경우에는 병원을 찾아 약물치료를 진행하는 것이 좋은지 정확하게 평가를 받아보는 것이 좋다.
									만약 의사가 SSRI등 세로토닌(항우울 작용을 하는 신경전달물질)을 높아지게 하는 약을 권유한다면, 일상생활속
									노력들과 약물치료를 병행하는 것이 좋다.</span><br>
								</div>
							</div>
					</c:when>
					<c:otherwise>
						<p>
							결과 : <span style="color: red; font-size: 30px;"> 심한 우울증 단계</span>
							<div class="row">
								<div class="col">
									<span style="color: gray; font-size: 15px;">이럴 경우 대처하는 방안은 다음과 같습니다.(아래 내용 참조)</span>
								</div>
							</div>
								<br>
							<div class="row">
								<div class="col" style="border: 1px dotted gray;">
									<span> 우울증이 심각하게 진전이 된 상황에서는 환청, 환각 등 망상과 사고장애가 있을 수 있다.
											이때는 약물치료가 매우 필수적이며 의사와 꾸준히 만나 정기적인 치료를 통해 나의 상태를 객관적으로 평가받고
											내가 복용하고 있는 약물의 용량과 종류를 조정하는 과정이 매우 중요하다. 또한 이 단계에서는 일상생활에서 본인이 스스로 일상생활의
											규칙을 찾고, 산책을 하고 운동 하는 등의 노력을 해야한다. </span><br>
									<span> </span>
								</div>
							</div>
					</c:otherwise>
				</c:choose>
				<hr>
			</div>
		</div>
		<div class="row justify-content-md-center" style="text-align: center;">
			<div class="col col-lg-2">
			<button class="btn btn-sm btn-primary" onclick="location.href='pConsultCount'">상담받기</button>
			</div>
			<div class="col col-lg-2">
			<button class="btn btn-sm btn-primary" onclick="location.href='myselfTest2'">다시하기</button>
			</div>
			
		</div>



	</div>
  <%@include file="footer.jsp" %>
</body>
</html>