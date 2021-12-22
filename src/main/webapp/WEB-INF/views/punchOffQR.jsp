<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

#punchOperation{
	border: 1px solid; padding: 15px; border-color: #DCD3D5; background-color: #5396E4;
}
#punchOperationA{
	color: white;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jsQR.js"></script>

</head>
<%@ include file = "header.jsp" %>
<body>

<%@ include file = "empOperationNav.jsp" %>
<main style="text-align: center;">

	 <div id="test">

		<h1>QR 코드 리더</h1>

		<div id="output">

			<div id="outputMessage">

				QR코드를 카메라에 노출시켜 주세요

			</div>

    		<div id="outputLayer" hidden>

    			<span id="outputData"></span>

    		</div>

		</div>

	</div>

	<div>&nbsp;</div> 

	<div style="text-align: center;">


		<div id="frame">

			<div id="loadingMessage">

				🎥 <br/>웹캠이 활성화되어 있는지 확인하십시오

			</div>

			<canvas id="canvas"></canvas>

		</div>

	</div>

</main>
<%@ include file = "footer.jsp" %>
</body>

</html>

<script type="text/javascript">	

	document.addEventListener("DOMContentLoaded", function() {

		

		var video = document.createElement("video");		

		var canvasElement = document.getElementById("canvas");

		var canvas = canvasElement.getContext("2d");

		var loadingMessage = document.getElementById("loadingMessage");

		var outputContainer = document.getElementById("output");

		var outputMessage = document.getElementById("outputMessage");

		var outputData = document.getElementById("outputData");

		

		function drawLine(begin, end, color) {

			

			canvas.beginPath();

			canvas.moveTo(begin.x, begin.y);

			canvas.lineTo(end.x, end.y);

			canvas.lineWidth = 4;

			canvas.strokeStyle = color;

			canvas.stroke();

                }

	    

	        // 카메라 사용시

		navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } }).then(function(stream) {

			

      		        video.srcObject = stream;

      		        video.setAttribute("playsinline", true);      // iOS 사용시 전체 화면을 사용하지 않음을 전달

         		video.play();

      		        requestAnimationFrame(tick);

		});



		function tick() {

			

			loadingMessage.innerText = "⌛ 스캔 기능을 활성화 중입니다."

			

			if(video.readyState === video.HAVE_ENOUGH_DATA) {

				

        		      loadingMessage.hidden = true;

        		      canvasElement.hidden = false;

        		      outputContainer.hidden = false;

        		

        		      // 읽어들이는 비디오 화면의 크기

        		      canvasElement.height = video.videoHeight;

        	 	      canvasElement.width = video.videoWidth;

        		

        		      canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);

        		      var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);

				

        		      var code = jsQR(imageData.data, imageData.width, imageData.height, {



                                    inversionAttempts : "dontInvert",

        		      });

        		

                              // QR코드 인식에 성공한 경우

                              if(code) {

        			    

                                     // 인식한 QR코드의 영역을 감싸는 사용자에게 보여지는 테두리 생성

                                    drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#FF0000");

                                    drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#FF0000");

                                    drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#FF0000");

                                    drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#FF0000");



                                    outputMessage.hidden = true;

                                    outputData.parentElement.hidden = false;

          			

                                    // QR코드 메시지 출력

                                    outputData.innerHTML = code.data;

          							console.log(code.data);
									var qrId = code.data;
                                    // return을 써서 함수를 빠져나가면 QR코드 프로그램이 종료된다.

                                    return location.href="punchOff?qrId="+qrId;

                              }

        		

                              // QR코드 인식에 실패한 경우 

                              else {



                                    outputMessage.hidden = false;

                                    outputData.parentElement.hidden = true;

                              }

                      }

      		

      		      requestAnimationFrame(tick);

		}

	});

</script>