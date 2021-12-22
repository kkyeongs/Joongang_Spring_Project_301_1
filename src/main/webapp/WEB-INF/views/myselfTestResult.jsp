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

            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; background-color: #5396E4"><a href="/board/101" style="color: white;">심장질환</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="myselfTest2">우울증</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="myselfTest3">공황장애</a></div>
	</div>
  	<div class="container" style=" margin: 3% auto; width: 65%; text-align: left; font-size: 18px; font-family: NanumBarunGothic;">
  		<div class="row">
  			<div class="col">
  			<span style="font-size: 35px;">${myTest.name }님</span>  (${myTest.gender})의 자가진단 결과는 다음과 같습니다.
  			</div>
  		</div>
  		<hr>
  		<div class="row">
  			<div class="col">
  			현재 본인의 진단 점수 : <span style="background-color: black; color: white;">${total}점</span>
  			</div>
  		</div>

		<div class="row">
			<div class="col">
				<c:choose>
					<c:when test="${total >=1 and total <= 3 }">
						<p>
							결과 : <span style="color: blue;">일시적이거나 가벼운 상태</span>
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
										<li>생활의 조절이 필요하다.</li>
										<li>가벼운 운동을 한다.</li>
										<li>가능하면 기공이 좋다.</li>
										<li>기분을 가볍고 즐겁게 유지한다.</li>
										<li>생각을 원대히 하고, 시야를 넓게 한다.</li>
										<li>미래에 대해서 생각한다.</li>
									</ul>
								</div>
							</div>
					</c:when>
					<c:when test="${total >= 4 and total <= 6 }">
						<p>
							결과 : <span style="color: orange;">1단계에 돌입한 상태</span>
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
										<li>생활의 조절이 필수적이며, 지금대로의 생활 중에서 줄일 수 있는 것은 줄인다.</li>
										<li>가벼운 운동을 한다.</li>
										<li>가능하면 기공이 좋다.</li>
										<li>한의원을 방문하여 조언을 듣는다.</li>
										<li>최소한 1~2회 정도라도 한약을 복용한다.</li>
									</ul>
								</div>
							</div>
					</c:when>
					<c:when test="${total >=7 and total <= 11 }">
						<p>
							결과 : <span style="color: green;">2단계에 돌입한 상태</span>
							<div class="row">
								<div class="col">
									<span style="color: gray; font-size: 15px;">이럴 경우 대처하는 방안은 다음과 같습니다.(아래 내용 참조)</span>
								</div>
							</div>
								<br>
							<div class="row">
								<div class="col" style="border: 1px dotted gray;">
									<span> 상당히 불편하여 본인도 이미 치료의 필요성을 느끼는 상태이나, 의원을 방문하여도 딱히 무슨병이라고 밝혀지지 않아서 좀 어려움을 겪는 경우가 많다. 이때는 서양의학적으로는 질병이라고 판정받지 못하지만, 한의학적으로는 상당히 진행된 질병의 단계이다. 한의원을 방문하여 치료하여야 한다. </span><br>
								</div>
							</div>
					</c:when>
					<c:otherwise>
						<p>
							결과 : <span style="color: red;"> 3단계</span>
							<div class="row">
								<div class="col">
									<span style="color: gray; font-size: 15px;">이럴 경우 대처하는 방안은 다음과 같습니다.(아래 내용 참조)</span>
								</div>
							</div>
								<br>
							<div class="row">
								<div class="col" style="border: 1px dotted gray;">
									<span> 이미 의원에서도 질병으로 판정을 받는 경우가 많다. 하지만, 뚜렷한 호전이 없는 경우가
											대부분이므로 한의학적으로 치료를 한다. 치료의 판정도 서양의학적인 검사 소견의 호전을 같이 참고해야 한다. </span><br>
									<span> </span>
								</div>
							</div>
					</c:otherwise>
				</c:choose>
				<hr>
				<div class="row">
					<div class="col-2" style="background-color: lightgray; text-align: center;">
						1 ~ 3점
					</div>
					<div class="col-4">
						일시적이나 가벼운 상태
					</div>
					<div class="col-2" style="background-color: lightgray; text-align: center;">
						4 ~ 6점
					</div>
					<div class="col-4">
						1단계에 돌입한 상태
					</div>
				</div>
				<div class="row">
					<div class="col-2" style="background-color: lightgray; text-align: center;">
						7 ~ 11점
					</div>
					<div class="col-4">
						2단계에 돌입한 상태
					</div>
					<div class="col-2" style="background-color: lightgray; text-align: center;">
						12점 이상
					</div>
					<div class="col-4">
						3단계
					</div>
				</div>
				<hr>
			</div>
		</div>
		<div class="row justify-content-md-center" style="text-align: center;">
			<div class="col col-lg-2">
			<button class="btn btn-sm btn-primary" onclick="location.href='pConsultCount'">상담받기</button>
			</div>
			<div class="col col-lg-2">
			<button class="btn btn-sm btn-primary" onclick="location.href='myselfTest'">다시하기</button>
			</div>
			
		</div>
		<br>
		<div class="row" style="font-size: 15px; text-align: center; border: 1px solid black;">
        	<div class="col" style="border: 1px solid black;">1단계 : 본인은 별로 인지하지 못함</div>
            <div class="col" style="border: 1px solid black;">2단계 : 본인도 많이 불편함</div>
            <div class="col" style="border: 1px solid black;">3단계 : 심각한 상대</div>
        </div>
        <div class="row">
        	<div class="col" style="">
        	<br>
				<ul style="font-size: 12px; border: 1px dotted red;">
					<li>가족력이 있다.</li>
					<li>스트레스가 많다.</li>
					<li>이유없이 불안하다.</li>
					<li>자주 긴장하는 편이다.</li>
					<li>눈꺼풀이 떨린 적이 있다.</li>
					<li>숨이 시원하지 않다.</li>
					<li>한숨을 자주 쉰다.</li>
					<li>자주 체한다.</li>
					<li>수면 장애가 있다.</li>
					<li>자주 피로한 편이다.</li>
					<li>어깨 허리가 아프다.</li>
					<li>머리가 잘 아프다.</li>
					<li>목을 삐끗한 적이 있다.</li>
					<li>운동을 해도 생각보다 성과가 적다.</li>
				</ul>
			</div>
        	<div class="col">
        	<br>
				<ul style="font-size: 12px; border: 1px dotted red;">
					<li>두통이 심해져 견딜수 없음</li>
					<li>팔저림이 심해짐</li>
					<li>디스크가 생김</li>
					<li>놀람이 심해짐</li>
					<li>가슴이 답답함이 심해짐</li>
					<li>부정맥이 있음</li>
					<li>불면증이 심해짐</li>
					<li>소화불량이 심해짐</li>
					<li>위궤양이 있음</li>
					<li>역류성 식도염이 있음</li>
					<li>흉골위에 압통이 심함</li>
					<li>안구건조가 심해서 눈이 아프다.</li>
					<li>포도막염이 있다.</li>
					<li>어깨가 심하게 아프다.</li>
					<li>한숨 쉬는 정도가 심해서 남들이 지적을 한다.</li>
					<li>동맥경화증이 있다.</li>
					<li>시력이 급격히 저하된다.</li>
				</ul>
			</div>
        	<div class="col">
        	<br>
				<ul style="font-size: 12px; border: 1px dotted red;">
					<li>심장병</li>
					<li>부정맥</li>
					<li>심근경색증</li>
					<li>협심증</li>
					<li>관상동맥질환</li>
					<li>심장관막질환</li>
					<li>고혈압</li>
					<li>동맥경화증</li>
					<li>뇌경색</li>
					<li>중풍</li>
					<li>뇌동맥류</li>
				</ul>
			</div>
        </div>
        <div class="row">
        	<div class="col" >
                	<p><b>한방적 진단 및 치료</b></p>
                    <ul style="font-size: 12px; border: 1px dotted black;">
                        <li>한의사의 망진, 문진(問診), 문진(聞診), 절진 등에 의한 진단</li>
                        <li>한약, 침뜸 기공 등의 한방적 치료를 개인에 맞춘 맞춤치료</li>
                    </ul>
                    <p><b>양방적 진단 및 치료</b></p>
                    <ul style="font-size: 12px; border: 1px dotted black;">
                        <li>EKG, CT, MRI, 초음파검사, 혈액검사 등. 이학적검사 → 정상</li>
                        <li>양방적 치료 : 없음</li>
                    </ul>
                </div>
			<div class="col">
				<p><b>한방적 진단 및 치료</b></p>
				<ul style="font-size: 12px; border: 1px dotted black;">
					<li>한의사의 망진, 문진(問診), 문진(聞診), 절진 등에 의한 진단</li>
					<li>한약, 침뜸 기공 등의 한방적 치료를 개인에 맞춘 맞춤치료</li>
				</ul>
				<p><b>양방적 진단 및 치료</b></p>
				<ul style="font-size: 12px; border: 1px dotted black;">
					<li>EKG, CT, MRI, 초음파검사, 혈액검사 등. 이학적검사 → 정상</li>
					<li>양방적 치료 : 없음</li>
				</ul>
			</div>
			<div class="col">
				<p><b>한방적 진단 및 치료</b></p>
				<ul style="font-size: 12px; border: 1px dotted black;">
					<li>한의사의 망진, 문진(問診), 문진(聞診), 절진 등에 의한 진단</li>
					<li>한약, 침뜸 기공 등의 한방적 치료를 개인에 맞춘 맞춤치료</li>
				</ul>
				<p><b>양방적 진단 및 치료</b></p>
				<ul style="font-size: 12px; border: 1px dotted black;">
					<li>EKG, CT, MRI, 초음파검사, 혈액검사 등. 이학적검사 → 정상</li>
					<li>약물요법 : 혈전용해제, 혈관확장제, 소염진통제</li>
				</ul>
			</div>
			
		</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>