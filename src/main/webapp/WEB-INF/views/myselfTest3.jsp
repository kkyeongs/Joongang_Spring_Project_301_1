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

<script type="text/javascript">

	function save()
	{
		var frm = document.frmMain;
		var cnt = 0;
		var check = 0;
		for(i=1; i<12; i++)
		{
			for(j=0; j<2; j++)
			{
				if(eval("frm.item"+i)[j].checked ==  true)
				{
					check = check + 1;
					cnt = cnt + parseInt(eval("frm.item"+i)[j].value);
				}
			}
		}
		if(check != 11)
		{	
			alert("질문내용에 빠짐없이 체크해주세요.");
			return;	
		}

		if(cnt > 2 || frm.item12[0].checked ==  true  || frm.item13[0].checked ==  true)
		{
			document.getElementById("box1").style.display="block";
			document.getElementById("box2").style.display="none";
			return;
		}
		else
		{
			document.getElementById("box1").style.display="none";
			document.getElementById("box2").style.display="block";
			return;
		}		
	}

</script>
 
</head>
<body>

  <!-- Back to top button -->
  <div class="back-to-top">
  </div>
    <%@include file="header.jsp" %>
     <div class="row" style=" margin: 3% auto; width: 65%; text-align: center; font-size: 18px; font-family: NanumBarunGothic;">
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="myselfTest">심장질환</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="myselfTest2">우울증</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; background-color: #5396E4"><a href="myselfTest3" style="color: white;">공황장애</a></div>
    </div>
    
    <div class="row" style="margin: 3% auto; width: 65%; text-align: center; font-size: 18px; font-family: NanumBarunGothic;">
    <div class="col">
    <form action="TestResult3" method="post" name="frmMain" onsubmit="return false;">
    	<div class="container">
    		<div class="row justify-content-md-center">
				<div class="col-4" style="background-color: lightgray">성별
				</div>
				<div class="col-4" style="text-align: left;"><input type="radio" value="남자" name="gender">남자 &nbsp;
															<input type="radio" value="여자" name="gender">여자
				</div>
				
			</div>
			<div class="row justify-content-md-center">
				<div class="col-4" style="background-color: lightgray">이름</div>
				<div class="col-4" style="text-align: left;"><input type="text" name="name"></div>	
			</div>
			<br>
    		<p><b style="color: red;">공황장애 자가진단</b> : 번호, 문항, 예/아니오로 구성되어 있습니다.<br>
    		각 문장을 자세히 읽어보시고, 최근 3~4주 이내 얼마나 자주 그렇게 경험하거나 느끼시는지<br> 
    		자신을 가장 잘 나타낸다고 생각되는 곳에 체크해 주십시오.</p>
    	</div>
    	
   		<table class="table table-striped" >
				<tr>
					<td>1. 맥박이 빠르게 뛰고 심장박동이 빠르다.</td>
					<td><label><input type="radio" name="item1" id='item1' value="1"
						class="check">예</label></td>
					<td><label><input type="radio" name="item1" id='item1' value="0"
						class="check" checked="checked">아니오</label></td>
				</tr>
				<tr>
					<td>2. 손발에 떨림이 있다.</td>
					<td><label><input type="radio" name="item2" id='item2' value="1"
						class="check">예</label></td>
					<td><label><input type="radio" name="item2" id='item2' value="0"
						class="check" checked="checked">아니오</label></td>
				</tr>
				<tr>
					<td>3. 숨이 막히는듯한 느낌이 든다.</td>
					<td><label><input type="radio" name="item3" id='item3' value="1"
						class="check">예</label></td>
					<td><label><input type="radio" name="item3" id='item3' value="0"
						class="check" checked="checked">아니오</label></td>
				</tr>
				<tr>
					<td>4. 속이 거북하거나 구역감이 있다.</td>
					<td><label><input type="radio" name="item4" id='item4' value="1"
						class="check">예</label></td>
					<td><label><input type="radio" name="item4" id='item4' value="0"
						class="check" checked="checked">아니오</label></td>
				</tr>
				<tr>
					<td>5. 오한이나 화끈한 느낌이 있다.</td>
					<td><label><input type="radio" name="item5" id='item5' value="1"
						class="check">예</label></td>
					<td><label><input type="radio" name="item5" id='item5' value="0"
						class="check" checked="checked">아니오</label></td>
				</tr>
				<tr>
					<td>6. 손발이 저리거나 마비되는 느낌이 있다.</td>
					<td><label><input type="radio" name="item6" id='item6' value="1"
						class="check">예</label></td>
					<td><label><input type="radio" name="item6" id='item6' value="0"
						class="check" checked="checked">아니오</label></td>
				</tr>
				<tr>
					<td>7. 땀이 많다.</td>
					<td><label><input type="radio" name="item7" id='item7' value="1"
						class="check">예</label></td>
					<td><label><input type="radio" name="item7" id='item7' value="0"
						class="check" checked="checked">아니오</label></td>
				</tr>
				<tr>
					<td>8. 호흡이 가쁘다.</td>
					<td><label><input type="radio" name="item8" id='item8' value="1"
						class="check">예</label></td>
					<td><label><input type="radio" name="item8" id='item8' value="0"
						class="check" checked="checked">아니오</label></td>
				</tr>
				<tr>
					<td>9. 가슴에 통증이 있다.</td>
					<td><label><input type="radio" name="item9" id='item9' value="1"
						class="check">예</label></td>
					<td><label><input type="radio" name="item9" id='item9' value="0"
						class="check" checked="checked">아니오</label></td>
				</tr>
				<tr>
					<td>10. 어지러움증이 있다.</td>
					<td><label><input type="radio" name="item10" id='item10' value="1"
						class="check">예</label></td>
					<td><label><input type="radio" name="item10" id='item10' value="0"
						class="check" checked="checked">아니오</label></td>
				</tr>
				<tr>
					<td>11. 자신이 변한 것 같다.</td>
					<td><label><input type="radio" name="item11" id='item11' value="1"
						class="check">예</label></td>
					<td><label><input type="radio" name="item11" id='item11' value="0"
						class="check" checked="checked">아니오</label></td>
				</tr>
				<tr>
					<td style="background-color: lightpink;">12. 자제력을 잃을 것 같거나, 미칠 것 같은 두려움이 있다.</td>
					<td><label><input type="radio" name="item12" id='item12' value="1"
						class="check2">예</label></td>
					<td><label><input type="radio" name="item12" id='item12' value="0"
						class="check2" >아니오</label></td>
				</tr>
				<tr >
					<td style="background: lightpink;">13. 죽을 것 같은 공포가 있다.</td>
					<td><label><input type="radio" name="item13" id='item13' value="1"
						class="check2">예</label></td>
					<td><label><input type="radio" name="item13" id='item13' value="0"
						class="check2">아니오</label></td>
				</tr>
			</table>
    </form>
			<div class="row" style="margin: 3% auto; width: 65%; text-align: center; font-size: 18px; font-family: NanumBarunGothic;">
			  <div class="col">
				<div class="test-result">
					<a href="javascript:save();" class="btn btn-sm btn-primary">테스트
						결과보기</a>
					<div class="box" id='box1' style="display: none; margin-top: 20px;"><br><br>
						<p class="point" style="font-size: 30px">침, 그리고 찌르다 - 정신건강의학과 불안, 공황 자가진단 결과</p>
						<p class="de01">
							<span class="b">만약, <b style="color: red; font-size: 20px;">일반칼라의 질문 3개 이상, 분홍칼라의 심리 증상들 중에서 1개
								이상이 체크 되었다면 여러분은 공황증상을 경험 한 것 입니다. 그러나 공황을 경험 했다고 다 공황장애로 진단 받는
								것은 아닙니다.</b><br> <br> 
							</span>
						</p>	
							<span style="float: left;">
							<b style="font-size: 50px bold black; ">공황장애</b>는<br> 1) 예기치 않은 공황이 반복되고, 이후 또 다른 증상이 올 것에 대한 지속적으로 근심<br>
							: 위의 증상들이 반복 된다거나, 이후 또 유사 증상이 올 것 같아서 걱정이 됨 <br> <br>
							2) 공황 또는 그 결과 (ex: 자제력 상실, 심장마비, 미칠 것 같은 공포)에 대한 걱정 <br> :
							위의 증상들이 결국 나쁜 결과 (심장마비, 미칠 것 같은 공포)를 낳을 것 같아서 걱정이 됨 <br> <br>
							3) 공황에 의한 심각한 행동 변화 (출근이나 외출을 하지 못하는 등) 등 <br> : 위의 증상들 때문에
							최근 행동의 변화를 느낌 <br> <br> 3 가지중 한가지 이상이 적어도 한달 이상 지속 되어야
							진단을 내릴 수 있습니다.
							</span>
							<br>
							<br>

						<p class="txt" style=""><b>상기 자가검진은 대체적인 경향을 체크할 수 있도록 제공한 것이므로, 진단을 대신 할
							수 없으며, 자세한 사항은 정신건강의학과 전문의 또는 전문가와 상의 하시기 바랍니다.</b></p>
						<div style="display: inline-block;">
							<button class="btn btn-sm btn-primary" onclick="location.href='pConsultCount'">상담받기</button>
						</div>
						<div style="display: inline-block;">
							<button class="btn btn-sm btn-primary" onclick="location.href='myselfTest3'">다시하기</button>
						</div>	
							
					</div>

					<div class="box" id='box2' style="display: none;">
						<p class="point">침, 그리고 찌르다 - 정신건강의학과 불안,공황 자가진단 결과</p>
						<p class="de01">
							<span class="b" style="color: red; font-size: 30px;">공황증상을 경험하지 않았습니다.</span><br> <br>
						<p class="txt"><b>상기 자가검진은 대체적인 경향을 체크할 수 있도록 제공한 것이므로, 진단을 대신 할
							수 없으며, 자세한 사항은 정신건강의학과 전문의 또는 전문가와 상의 하시기 바랍니다.</b></p>
						<div style="display: inline-block;">
						<button class="btn btn-sm btn-primary" onclick="location.href='pConsultCount'">상담받기</button>
						</div>
						<div style="display: inline-block;">
						<button class="btn btn-sm btn-primary" onclick="location.href='myselfTest3'">다시하기</button>
						</div>	
						
					</div>
					
				</div>
			   </div>
			</div>
		</div>
	</div>
    <%@include file="footer.jsp" %>
</body>
</html>