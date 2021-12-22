<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%
	String context = request.getContextPath(); //경로
%>
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
	
	/*------------- Controller Ajax --------------*/
	function getTotalPoint(){ /* 함수실행  */
		let nameObj = new Array();
		let cnt = 0; 
		let chkValue = document.getElementsByTagName("input");
		const HIDDEN_CLASS = "hidden";
		
		for(var i=0; i<chkValue.length; i++){
			if(chkValue[i].type == "radio"){
				if( nameObj[cnt-1] != chkValue[i].name){	
					nameObj[cnt] = chkValue[i].name;
					cnt++;
					console.log("nameObj[cnt]->",nameObj[cnt]);
					
				}
			}	
		}
		
		let vMyTest  = new Array();
		
		for (var i = 0; i < nameObj.length; i++) { 
			let chkValue = document.getElementsByName(nameObj[i]);//myTest1~
			let oneArrSum = 0;
			for (var j = 0; j < chkValue.length; j++) { 
				if (chkValue[j].checked == true) { 
					
					oneArrSum =   oneArrSum + parseInt(chkValue[j].value);
					console.log(oneArrSum);
				} 
			}
			
			vMyTest[i] = oneArrSum;
		} 
		
		// 계산 결과 출력
		const yourname = document.getElementById("yourname");
		const resultname = yourname.value;
		const resultCon = document.getElementById("resultContainer");
		const condition = document.getElementById("condition");
		
		let conditionIs = "";
		resultCon.style.display = "block";
		
		//이름 출력하기
		$("#resultname").text(resultname);
		
 		$.ajax({
			url:"<%=context%>/myselfTest4", /* 컨트롤러의 url 호출 context는 경로 */
			data:{myTest1 : vMyTest[0]
				, myTest2 : vMyTest[1]
				, myTest3 : vMyTest[2]
				, myTest4 : vMyTest[3]
				, myTest5 : vMyTest[4]
				, myTest6 : vMyTest[5]
				, myTest7 : vMyTest[6]
				, myTest8 : vMyTest[7]
				, myTest9 : vMyTest[8]
				, myTest10 : vMyTest[9]
				, myTest11 : vMyTest[10]
				, myTest12 : vMyTest[11]
				, myTest13 : vMyTest[12]
				, myTest14 : vMyTest[13]
				, myTest15 : vMyTest[14]
			     }, 
			type:'POST',
			//리턴되는 값
			dataType:'text', /* text로 받는다 -> text or json이다 */
			/*컨트롤러 성공 시(리턴값이 올때)  */
			success:function(data){ /* data = 컨트롤러에서 리턴된 값(strCalTotal) */
				$('#total').val(data); /* input 태그일때 사용 */
				$('#total').html(data);
				$('#msg').html(data); /*sapn 태그일 때 사용  */
			
				if(data <= 15){
					//진단 결과
					conditionIs = "일반적인 상태(정상)";
					$("#condition").text(conditionIs);
					//처방 안내
					const testResult1 = document.getElementById("testResult1");
					testResult1.style.display = "block";
					
				}else if(data <= 30){
					conditionIs = "우울증 초기 단계(가끔 우울하지만 극복 가능한 상태)";
					$("#condition").text(conditionIs);
					const testResult2 = document.getElementById("testResult2");
					testResult2.style.display = "block";
					
				}else if(data <= 45){
					conditionIs = "우울증 심각 단계(심한 우울증이 의심되며 주변 주변 지인들의 도움이 필요)";
					$("#condition").text(conditionIs);
					const testResult3 = document.getElementById("testResult3");
					testResult3.style.display = "block";
				}else{
					conditionIs = "우울증 말기 단계(최대한 빨리 전문가의 상담치료가 필요)";
					$("#condition").text(conditionIs);
					const testResult4 = document.getElementById("testResult4");
					testResult4.style.display = "block";
				}
			}
		
		});		
	}

</script>
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
.hidden{
	display: none;
}
</style>
  
</head>
<body>

  <!-- Back to top button -->
  <div class="back-to-top">
  </div>
    <%@include file="header.jsp" %>
    <div class="row" style=" margin: 3% auto; width: 65%; text-align: center; font-size: 18px; font-family: NanumBarunGothic;">

            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="myselfTest">심장질환</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; background-color: #5396E4"><a href="myselfTest2" style="color: white;">우울증</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="myselfTest3">공황장애</a></div>
           
    </div>
    
    
     <form id="myselfTest">
    <div class="row" style="margin: 3% auto; width: 65%; text-align: center; font-size: 18px; font-family: NanumBarunGothic;">
    	<div class="container">
			<div class="row justify-content-md-center">
				<div class="col-4" style="background-color: lightgray">이름</div>
				<div class="col-4" style="text-align: left;"><input id="yourname" type="text" name="name"></div>	
			</div>
			
			<br>
			<p><b style="color: red;">우울증 자가진단</b> : 번호, 문항, 해당되지않음, 가끔그렇다, 자주느낀다, 항상 으로 구성<br>
										  					이 질문지는 여러분이 일상생활에서 경험할 수 있는 내용들로 구성되어 있습니다.<br>
										  					각 문장을 자세히 읽어보시고, 최근 3~4주 이내 얼마나 자주 그렇게 경험하거나 느끼시는지<br> 자신을 가장 잘 나타낸다고
										  					생각되는 번호에 표시하여 주십시오.</p>
		</div>		
		
	
	<table class="table table-striped" >
        <tr>
            <th scope="col" style="vertical-align: middle;">번호</th>
            <th scope="col" style="vertical-align: middle;">문항</th>
            <th scope="col">해당되지<br>않음</th>
            <th scope="col">가끔<br>그렇다</th>
            <th scope="col">자주<br>느낀다</th>
            <th scope="col" style="vertical-align: middle;">항상<br></th>
        </tr>
    <tbody>    
        <tr>
            <th scope="row">1</th>
            <td class="left">미래에 대한 희망이 없다.</td>
            <td><input type="radio" class="chkValue" name="myTest1"  value="0" id="myTest1" title="0" checked="checked"></td>
            <td><input type="radio" class="chkValue" name="myTest1" value="1" id="myTest1" title="1"></td>
            <td><input type="radio" class="chkValue" name="myTest1" value="2" id="myTest1" title="2"></td>
            <td><input type="radio" class="chkValue" name="myTest1" value="3" id="myTest1" title="3"></td>
        </tr>
        <tr>
             <th scope="row">2</th>
            <td class="left">이유없이 죄책감이 든다.</td>
            <td><input type="radio" class="chkValue" name="myTest2" value="0" id="RadioGroup2_0" title="0" checked="checked"></td>
            <td><input type="radio" class="chkValue" name="myTest2" value="1" id="RadioGroup2_1" title="1"></td>
            <td><input type="radio" class="chkValue" name="myTest2" value="2" id="RadioGroup2_2" title="2"></td>
            <td><input type="radio" class="chkValue" name="myTest2" value="3" id="RadioGroup2_3" title="3"></td>
        </tr>
        <tr>
            <th scope="row">3</th>
            <td class="left">하루종일 우울한 기분이 든다.</td>
            <td><input type="radio" class="chkValue" name="myTest3" value="0" id="RadioGroup3_0" title="0" checked="checked"></td>
            <td><input type="radio" class="chkValue" name="myTest3" value="1" id="RadioGroup3_1" title="1"></td>
            <td><input type="radio" class="chkValue" name="myTest3" value="2" id="RadioGroup3_2" title="2"></td>
            <td><input type="radio" class="chkValue" name="myTest3" value="3" id="RadioGroup3_3" title="3"></td>
        </tr>
        <tr>
            <th scope="row">4</th>
            <td class="left">나만 소외되는 느낌이 든다.</td>
            <td><input type="radio" class="chkValue" name="myTest4" value="0" id="RadioGroup4_0" title="0" checked="checked"></td>
            <td><input type="radio" class="chkValue" name="myTest4" value="1" id="RadioGroup4_1" title="1"></td>
            <td><input type="radio" class="chkValue" name="myTest4" value="2" id="RadioGroup4_2" title="2"></td>
            <td><input type="radio" class="chkValue" name="myTest4" value="3" id="RadioGroup4_3" title="3"></td>
        </tr>
        <tr>
            <th scope="row">5</th>
            <td class="left">열등감이 생기고 그로 인해 스트레스를 받는다.</td>
            <td><input type="radio" class="chkValue" name="myTest5" value="0" id="RadioGroup5_0" title="0" checked="checked"></td>
            <td><input type="radio" class="chkValue" name="myTest5" value="1" id="RadioGroup5_1" title="1"></td>
            <td><input type="radio" class="chkValue" name="myTest5" value="2" id="RadioGroup5_2" title="2"></td>
            <td><input type="radio" class="chkValue" name="myTest5" value="3" id="RadioGroup5_3" title="3"></td>
        </tr>
        <tr>
            <th scope="row">6</th>
            <td class="left">식습관이 변하지 않았는데 갑자기 체중증가 또는 감소 증상이 나타난다.</td>
            <td><input type="radio" class="chkValue" name="myTest6" value="0" id="RadioGroup6_0" title="0" checked="checked"></td>
            <td><input type="radio" class="chkValue" name="myTest6" value="1" id="RadioGroup6_1" title="1"></td>
            <td><input type="radio" class="chkValue" name="myTest6" value="2" id="RadioGroup6_2" title="2"></td>
            <td><input type="radio" class="chkValue" name="myTest6" value="3" id="RadioGroup6_3" title="3"></td>
        </tr>
        <tr>
            <th scope="row">7</th>
            <td class="left">과수면 또는 불면증에 시달린다.</td>
            <td><input type="radio" class="chkValue" name="myTest7" value="0" id="RadioGroup7_0" title="0" checked="checked"></td>
            <td><input type="radio" class="chkValue" name="myTest7" value="1" id="RadioGroup7_1" title="1"></td>
            <td><input type="radio" class="chkValue" name="myTest7" value="2" id="RadioGroup7_2" title="2"></td>
            <td><input type="radio" class="chkValue" name="myTest7" value="3" id="RadioGroup7_3" title="3"></td>
        </tr>
        <tr>
            <th scope="row">8</th>
            <td class="left">일상생활이 불만족스럽다.</td>
            <td><input type="radio" class="chkValue" name="myTest8" value="0" id="RadioGroup8_0" title="0" checked="checked"></td>
            <td><input type="radio" class="chkValue" name="myTest8" value="1" id="RadioGroup8_1" title="1"></td>
            <td><input type="radio" class="chkValue" name="myTest8" value="2" id="RadioGroup8_2" title="2"></td>
            <td><input type="radio" class="chkValue" name="myTest8" value="3" id="RadioGroup8_3" title="3"></td>
        </tr>
        <tr>
            <th scope="row">9</th>
            <td class="left">별일 아닌 것에 대해서도 눈물이 자주난다.</td>
            <td><input type="radio" class="chkValue" name="myTest9" value="0" id="RadioGroup9_0" title="0" checked="checked"></td>
            <td><input type="radio" class="chkValue" name="myTest9" value="1" id="RadioGroup9_1" title="1"></td>
            <td><input type="radio" class="chkValue" name="myTest9" value="2" id="RadioGroup9_2" title="2"></td>
            <td><input type="radio" class="chkValue" name="myTest9" value="3" id="RadioGroup9_3" title="3"></td>
        </tr>
        <tr>
            <th scope="row">10</th>
            <td class="left">자살충동을 느껴본 적이 있다.</td>
            <td><input type="radio" class="chkValue" name="myTest10" value="0" id="RadioGroup10_0" title="0" checked="checked"></td>
            <td><input type="radio" class="chkValue" name="myTest10" value="1" id="RadioGroup10_1" title="1"></td>
            <td><input type="radio" class="chkValue" name="myTest10" value="2" id="RadioGroup10_2" title="2"></td>
            <td><input type="radio" class="chkValue" name="myTest10" value="3" id="RadioGroup10_3" title="3"></td>
        </tr>
        <tr>
            <th scope="row">11</th>
            <td class="left">건강에 대해 자신이 없고 성생활이 무의미하다.</td>
            <td><input type="radio" class="chkValue" name="myTest11" value="0" id="RadioGroup11_0" title="0" checked="checked"></td>
            <td><input type="radio" class="chkValue" name="myTest11" value="1" id="RadioGroup11_1" title="1"></td>
            <td><input type="radio" class="chkValue" name="myTest11" value="2" id="RadioGroup11_2" title="2"></td>
            <td><input type="radio" class="chkValue" name="myTest11" value="3" id="RadioGroup11_3" title="3"></td>
        </tr>
        <tr>
            <th scope="row">12</th>
            <td class="left">나 자신에 대해 싫고 추한 느낌이 든다.</td>
            <td><input type="radio" class="chkValue" name="myTest12" value="0" id="RadioGroup12_0" title="0" checked="checked"></td>
            <td><input type="radio" class="chkValue" name="myTest12" value="1" id="RadioGroup12_1" title="1"></td>
            <td><input type="radio" class="chkValue" name="myTest12" value="2" id="RadioGroup12_2" title="2"></td>
            <td><input type="radio" class="chkValue" name="myTest12" value="3" id="RadioGroup12_3" title="3"></td>
        </tr>
        <tr>
            <th scope="row">13</th>
            <td class="left">항상 피곤해서 일상생활을 할 수가 없다.</td>
            <td><input type="radio" class="chkValue" name="myTest13" value="0" id="RadioGroup13_0" title="0" checked="checked"></td>
            <td><input type="radio" class="chkValue" name="myTest13" value="1" id="RadioGroup13_1" title="1"></td>
            <td><input type="radio" class="chkValue" name="myTest13" value="2" id="RadioGroup13_2" title="2"></td>
            <td><input type="radio" class="chkValue" name="myTest13" value="3" id="RadioGroup13_3" title="3"></td>
        </tr>
        <tr>
            <th scope="row">14</th>
            <td class="left">실패자 낙오자라는 생각을 자주한다.</td>
            <td><input type="radio" class="chkValue" name="myTest14" value="0" id="RadioGroup14_0" title="0" checked="checked"></td>
            <td><input type="radio" class="chkValue" name="myTest14" value="1" id="RadioGroup14_1" title="1"></td>
            <td><input type="radio" class="chkValue" name="myTest14" value="2" id="RadioGroup14_2" title="2"></td>
            <td><input type="radio" class="chkValue" name="myTest14" value="3" id="RadioGroup14_3" title="3"></td>
        </tr>
        <tr>
            <th scope="row">15</th>
            <td class="left" style="vertical-align: middle;">어떤 것의 결정을 스스로 하지 못한다.</td>
            <td><input type="radio" class="chkValue" name="myTest15" value="0" id="RadioGroup15_0" title="0" checked="checked"></td>
            <td><input type="radio" class="chkValue" name="myTest15" value="1" id="RadioGroup15_1" title="1"></td>
            <td><input type="radio" class="chkValue" name="myTest15" value="2" id="RadioGroup15_2" title="2"></td>
            <td><input type="radio" class="chkValue" name="myTest15" value="3" id="RadioGroup15_3" title="3"></td>
        </tr>
        
        <tr>
			<td colspan="10" style="text-align: center;"><input size="2" type="hidden" name="total">
<!-- 				<input type="button" value="결과보기" class="btn btn-sm btn-primary" onclick="getTestResult(); this.onclick='';">
 -->		
                    <input type="button" value="결과보기" class="btn btn-sm btn-primary" onclick="getTotalPoint(); this.onclick='';">
			</td>
		</tr>
    </tbody>    
</table>	
 </div>
 </form> 


	 <div class="container" style="margin: 3% auto; width: 65%; text-align: left; font-size: 18px; font-family: NanumBarunGothic;">
	  	<div class="row">
	  		<div class="col">
	  		<span id="resultname" style="font-size: 35px;"></span>의 자가진단 결과는 다음과 같습니다.
	  		</div>
	  	</div>
	  	<hr>


		<div class="row stacked" style="margin-bottom: 20px;">
			<div class="col-sm-4" style="text-align: center; background-color: gray; color: white"">
				<div class="cal-widget" style="margin-top: 40px;">
					<div class="cal-title" >TOTAL</div>
					<div class="cal-int" >
						<span id="total" style="font-size: 40px;"></span> 점
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
		
		<div class="row" id="resultContainer" style="display: none;">
			<div class="col">
							
						<p>
							결과 : <span id="condition" style="color: blue; font-size: 30px;">일반적인 상태 (정상)</span>
							<div class="row">
								<div class="col">
									<span style="color: gray; font-size: 15px;">이럴 경우 대처하는 방안은 다음과 같습니다.(아래 내용 참조)</span>
								</div>
							</div>
								<br>
							<div class="row" id="testResult1" style="display: none;">
								<div class="col" style="border: 1px dotted gray;">
									<br>
									<ul>
										<li>가벼운 운동을 한다.</li>
										<li>기분을 가볍고 즐겁게 유지한다.</li>
									</ul>
								</div>
							</div>
					
					
						
							<div class="row " id="testResult2" style="display: none;">
								<div class="col" style="border: 1px dotted gray;">
									<br>
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
					
						
							<div class="row" id="testResult3" style="display: none;">
								<div class="col" style="border: 1px dotted gray;">
									<span> 일상생활 속에서 많은 노력을 하였음에도 불구하고 내 기분을 내가 통제하지 못하는 경우,
									내 기분에 압도되는 경우에는 병원을 찾아 약물치료를 진행하는 것이 좋은지 정확하게 평가를 받아보는 것이 좋다.
									만약 의사가 SSRI등 세로토닌(항우울 작용을 하는 신경전달물질)을 높아지게 하는 약을 권유한다면, 일상생활속
									노력들과 약물치료를 병행하는 것이 좋다.</span><br>
								</div>
							</div>
							
						
							<div class="row" id="testResult4" style="display: none;">
								<div class="col" style="border: 1px dotted gray;">
									<span> 우울증이 심각하게 진전이 된 상황에서는 환청, 환각 등 망상과 사고장애가 있을 수 있다.
											이때는 약물치료가 매우 필수적이며 의사와 꾸준히 만나 정기적인 치료를 통해 나의 상태를 객관적으로 평가받고
											내가 복용하고 있는 약물의 용량과 종류를 조정하는 과정이 매우 중요하다. 또한 이 단계에서는 일상생활에서 본인이 스스로 일상생활의
											규칙을 찾고, 산책을 하고 운동 하는 등의 노력을 해야한다. </span><br>
									<span> </span>
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
			<button class="btn btn-sm btn-primary" onclick="location.href='myselfTest2'">다시하기</button>
			</div>
		</div>
	</div>
    
   
    <%@include file="footer.jsp" %>
</body>
</html>
    