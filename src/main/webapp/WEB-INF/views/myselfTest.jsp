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
    font-family: 'GowunBatang-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'MaruBuri-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/MaruBuri-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
	font-family: 'MaruBuri-Regular';
}
</style>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <meta name="copyright" content="MACode ID, https://macodeid.com/">
  
</head>
<body>

  <!-- Back to top button -->
  <div class="back-to-top">
  </div>
    <%@include file="header.jsp" %>
    <div class="row" style=" margin: 3% auto; width: 65%; text-align: center; font-size: 18px; font-family: NanumBarunGothic;">

            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; background-color: #5396E4"><a href="/board/101" style="color: white;">심장질환</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="myselfTest2">우울증</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="myselfTest3">공황장애</a></div>
	</div>
	<form action="TestResult" method="post">
	<div class="row" style="margin: 3% auto; width: 65%; text-align: center; font-size: 18px; font-family: NanumBarunGothic;">
		<div class="container">
			<div class="row justify-content-md-center">
				<div class="col-4" style="background-color: lightgray">성별
				</div>
				<div class="col-4" style="text-align: left;"><input type="radio" value="남자" name="gender">남자 &nbsp;
															<input type="radio" value="여자" name="gender">여자
				</div>
				
			</div>
			<div class="row justify-content-md-center">
				<div class="col-2"></div>
				<div class="col-4" style="background-color: lightgray">연령
				</div>
				<div class="col-5" style="font-size: 16px; text-align: left;">
									<input type="radio" value="10대" name="age">10대
									<input type="radio" value="20대" name="age">20대
									<input type="radio" value="30대" name="age">30대
									<input type="radio" value="40대" name="age">40대
									<input type="radio" value="50대" name="age">50대
									<input type="radio" value="60대" name="age">60대
									<input type="radio" value="70대" name="age">70대
				</div>
				
				<div class="col"></div>
				
			</div>
			<div class="row justify-content-md-center">
				<div class="col-4" style="background-color: lightgray">이름
				</div>
				<div class="col-4" style="text-align: left;"><input type="text" name="name">
				</div>
			</div>
		</div>
		
	</div>
	
	<div class="row" style="margin: 3% auto; width: 65%; text-align: center; font-size: 18px; font-family: NanumBarunGothic;">
		<hr>
		<table style="text-align: center; margin: 0 auto;">
			<tbody>
				<tr>
					<th class="left" style="text-align: left;">1. 두통</th>
				</tr>
				<tr >
					<td class="left_n" style="text-align: left;">
						<p>
							<input type="radio" name="myTest1"
								value="0">없다.
						</p>
						<p>
							<input type="radio" name="myTest1"
								value="1">은은하게 띵하거나 맑지 않고 무거운 느낌이 가끔 있다.
						</p>
						<p>
							<input  type="radio" name="myTest1"
								value="2">정도는 약하지만 늘 맑지 않고 항상 약간 아프다.
						</p>
						<p>
							<input type="radio" name="myTest1"
								value="3">심한 두통이 자주 있다.(일주일에 한 번 이상)
						</p>
						<p>
							<input type="radio" name="myTest1"
								value="4">극렬한 두통이 자주 오랫동안 계속되고 눈이 잘 충혈된다.
						</p>
						<p>
							<input  type="radio" name="myTest1"
								value="5">진통제로도 두통이 잘 가라않지 않는다.
						</p>
					</td>
				</tr>
				<br><br>
				<tr>
					<th class="left" style="text-align: left;">2. 현훈(어지럼증)</th>
				</tr>
				<tr>
					<td class="left_n" style="text-align: left;">
						<p>
							<input type="radio" name="myTest2"
								value="0">없다.
						</p>
						<p>
							<input  type="radio" name="myTest2"
								value="1">아주 순간적으로 띵~하거나 선이 조금 흔들리는 느낌이 있으며, 눈떨림이 가끔 있다.
						</p>
						<p>
							<input type="radio" name="myTest2"
								value="2">자세 이동 없이 가끔 눈앞이 어찔하다.
						</p>
						<p>
							<input type="radio" name="myTest2"
								value="3">기억력감퇴와 어지러움이 있다.
						</p>
						<p>
							<input type="radio" name="myTest2"
								value="4">자주 어지러우나 보행에 문제는 없다.
						</p>
						<p>
							<input  type="radio" name="myTest2"
								value="5">심하게 어지러워서 보행 시에 불편함을 느낄 때가 있다.
						</p>
						<p>
							<input  type="radio" name="myTest2"
								value="6">누워 있어도 어지러울 때가 자주 있다.
						</p>
					</td>
				</tr>
				<tr>
					<th class="left" style="text-align: left;">3. 이명(귀울림)</th>
				</tr>
				<tr>
					<td class="left_n" style="text-align: left;">
						<p>
							<input type="radio" name="myTest3"
								value="0">없다
						</p>
						<p>
							<input  type="radio" name="myTest3"
								value="1">귀가 멍하면서 한쪽 귀에서 이상한 소리가 약하게 날 때가 있다.
						</p>
						<p>
							<input  type="radio" name="myTest3"
								value="2">귀에서 소리가 자주 난다. 손으로 귀를 눌러도 소리가 줄지 않는다.
						</p>
						<p>
							<input  type="radio" name="myTest3"
								value="3">소리가 끊이지 않고 나며 그 소리가 작지 않다.
						</p>
						<p>
							<input  type="radio" name="myTest3"
								value="4">귀를 손으로 누르면 소리가 감소한다.
						</p>
						<p>
							<input  type="radio" name="myTest3"
								value="5">이명이 있고, 허리와 무릎이 시리다.
						</p>
					</td>
				</tr>
				<tr>
					<th class="left" style="text-align: left;">4. 어깨결림</th>
				</tr>
				<tr>
					<td class="left_n" style="text-align: left;">
						<p>
							<input type="radio" name="myTest4"
								value="0">없다
						</p>
						<p>
							<input type="radio" name="myTest4"
								value="1">가끔 어깨가 결리고 통증이 있다.
						</p>
						<p>
							<input type="radio" name="myTest4"
								value="2">어깨가 자주 결리고 통증이 있고 뒷목이 뻣뻣하다.
						</p>
						<p>
							<input type="radio" name="myTest4"
								value="3">어깨가 뭉치고 어깨 관절이 아프며 팔의 운동에 장애가 있다.
						</p>
					</td>
				</tr>
				<tr>
					<th class="left" style="text-align: left;">5. 항강통(목의 통증)</th>
				</tr>
				<tr>
					<td class="left_n" style="text-align: left;">
						<p>
							<input type="radio" name="myTest5"
								value="0">없다
						</p>
						<p>
							<input type="radio" name="myTest5"
								value="1">목이 가끔 뻣뻣하다
						</p>
						<p>
							<input type="radio" name="myTest5"
								value="2">목이 자주 뻣뻣하며 뒷머리가 무겁고 아프다.
						</p>
						<p>
							<input type="radio" name="myTest5"
								value="3">기상 후 목이 움직이기가 힘든 적이 있다.
						</p>
						<p>
							<input type="radio" name="myTest5"
								value="4">뒷목이 뻣뻣하고 통증이 있으며 손저림이나 팔저림이 있다.
						</p>
						<p>
							<input type="radio" name="myTest5"
								value="5">뒷목의 통증이 심하고,고혈압이 있다.
						</p>
					</td>
				</tr>
				<tr>
					<th class="left" style="text-align: left;">6. 소화불량</th>
				</tr>
				<tr>
					<td class="left_n" style="text-align: left;">
						<p>
							<input type="radio" name="myTest6"
								value="0">없다
						</p>
						<p>
							<input type="radio" name="myTest6"
								value="1">약간만 신경 쓰거나 하면 소화가 안 될 때가 가끔 있다.
						</p>
						<p>
							<input type="radio" name="myTest6"
								value="2">평소에 먹던 대로 먹었는데도 이유 없이 소화가 안 되고 더부룩할 때가 가끔 있다.
						</p>
						<p>
							<input type="radio" name="myTest6"
								value="3">소화가 잘 안되거나 자주 체한다.
						</p>
						<p>
							<input  type="radio" name="myTest6"
								value="4">신경을 조금만 써도 거의 항상 소화가 안 된다.
						</p>
						<p>
							<input  type="radio" name="myTest6"
								value="5">항상 소화가 안 되어서 그 것 때문에 음식먹기가 두렵다.
						</p>
						<p>
							<input  type="radio" name="myTest6"
								value="6">소화가 잘 안되어 병원이나 한의원에서 치료를 자주 받는다.
						</p>
					</td>
				</tr>
				<tr>
					<th class="left" style="text-align: left;">7. 가슴통증</th>
				</tr>
				<tr>
					<td class="left_n" style="text-align: left;">
						<p>
							<input  type="radio" name="myTest7"
								value="0">없다
						</p>
						<p>
							<input  type="radio" name="myTest7"
								value="1">이유없이 불안하며, 겁이 많다.
						</p>
						<p>
							<input  type="radio" name="myTest7"
								value="2">약간만 신경쓰면 가슴이 답답하다. 가슴이 쉽게 두근거린다.
						</p>
						<p>
							<input  type="radio" name="myTest7"
								value="3">가슴이 답답하거나 가슴이 은은하게 아프다.
						</p>
						<p>
							<input  type="radio" name="myTest7"
								value="4">가슴이 답답하여 잠자기가 어렵거나 가슴과 손발이 뜨겁고 답답하다.
						</p>
						<p>
							<input  type="radio" name="myTest7"
								value="5">가슴이 답답할 때가 자주 있으며 두통이나 항강증,소화안됨 등이 동반된다.
						</p>
						<p>
							<input type="radio" name="myTest7"
								value="6">가슴이 심하게 답답하여 터질 것 같음이 자주 있으며 오래 지속된다.
						</p>
						<p>
							<input type="radio" name="myTest7"
								value="7">가슴과 등이 아프며, 그 통증이 바늘로 찌르는 것 같다.
						</p>
					</td>
				</tr>
				<tr>
					<th class="left" style="text-align: left;">8. 허리아픔</th>
				</tr>
				<tr>
					<td class="left_n" style="text-align: left;">
						<p>
							<input type="radio" name="myTest8"
								value="0">없다
						</p>
						<p>
							<input type="radio" name="myTest8"
								value="1">자주 허리를 삐거나 담이 결리나 저절로 풀린다.
						</p>
						<p>
							<input type="radio" name="myTest8"
								value="2">허리를 삐는 일이 잦고 치료를 하는데도 2-3일 이상 걸린다.
						</p>
						<p>
							<input type="radio" name="myTest8"
								value="3">은근한 통증이 거의 항상 있다.
						</p>
						<p>
							<input type="radio" name="myTest8"
								value="4">통증이 심하여 항상 허리에 신경이 쓰이고 자유롭지 못하다.
						</p>
						<p>
							<input type="radio" name="myTest8"
								value="5">다리와 발 저림을 동반하며 보행 시에도 통증이 있다.
						</p>
						<p>
							<input type="checkbox" name="myTest8"
								value="6">무리하게 힘을 썼거나 운동이나 노동 등으로 충격을 받았다(해당이 될 경우
							체크해주세요)
						</p>
					</td>
				</tr>
				<tr>
					<th class="left" style="text-align: left;">9. 등아픔</th>
				</tr>
				<tr>
					<td class="left_n" style="text-align: left;">
						<p>
							<input type="radio" name="myTest9"
								value="0">없다
						</p>
						<p>
							<input type="radio" name="myTest9"
								value="1">등이 가끔 결린다.
						</p>
						<p>
							<input type="radio" name="myTest9"
								value="2">등이 자주 결린다.
						</p>
						<p>
							<input type="radio" name="myTest9"
								value="3">등이 결리며 어깨와 팔 저림이나 손 저림까지 있다.
						</p>
						<p>
							<input  type="radio" name="myTest9"
								value="4">등이 아파서 숙면을 할 수가 없다
						</p>
					</td>
				</tr>
				<tr>
					<th class="left" style="text-align: left;">10. 기타증상</th>
				</tr>
				<tr>
					<td class="left_n" style="text-align: left;">
						<p>
							<input type="radio" name="myTest10"
								value="0">없다
						</p>
						<p>
							<input type="radio" name="myTest10"
								value="1">숨이 깊이 쉬어지지 않고, 기운이 딸린다.
						</p>
						<p>
							<input type="radio" name="myTest10"
								value="2">식은 땀이 난다.
						</p>
						<p>
							<input type="radio" name="myTest10"
								value="3">쉽게 화가 난다.
						</p>
						<p>
							<input type="radio" name="myTest10"
								value="4">쉽게 놀란다.
						</p>
						<p>
							<input type="radio" name="myTest10"
								value="2">몸이 춥고 사지가 냉하다.
						</p>
						<p>
							<input type="radio" name="myTest10"
								value="3">소변이 원활치 않다.
						</p>
						<p>
							<input type="radio" name="myTest10"
								value="4">전신부종이 있고, 특히 다리가 잘 붓는다.
						</p>
					</td>
				</tr>
				<tr>
					<td><input size="2" type="hidden" name="total">
						<input type="submit" value="결과보기" class="btn btn-sm btn-primary">
					</td>
					
				</tr>
			</tbody>
		</table>
	</div>
	
   </form>
	<%@include file="footer.jsp" %>
</body>
</html>