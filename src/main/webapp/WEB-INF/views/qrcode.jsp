<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.File, java.util.UUID" %>
<%@ page import = "java.awt.image.BufferedImage, javax.imageio.ImageIO" %>
<%@ page import = "com.google.zxing.qrcode.QRCodeWriter, com.google.zxing.common.BitMatrix, com.google.zxing.BarcodeFormat, com.google.zxing.client.j2se.MatrixToImageWriter" %>
<%
	String empId = request.getParameter("empId");
	int nCheck = 1;
	String savedFileName = "";
	
	//sessionId 확인
	if(empId == null || empId.equals("")){
		nCheck = 0;
	}
	else{
	//파일 설정
	File path = new File(application.getRealPath("/")+"img/");
	savedFileName = UUID.randomUUID().toString().replace("-","");
	if(!path.exists()) path.mkdirs();
	
	//QRCode 생성
	QRCodeWriter writer = new QRCodeWriter();
	BitMatrix qrCode = writer.encode(empId, BarcodeFormat.QR_CODE, 200,200);
	
	BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qrCode);
	
	ImageIO.write(qrImage, "PNG", new File(path, savedFileName+".png"));
	
	}
		
%>
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
<title>QR Code 생성하기</title>
</head>
<body>
	 <!-- Back to top button -->
  <div class="back-to-top"></div>
  <%@ include file="header.jsp" %>
  <%@ include file="empOperationNav.jsp" %>
<div style="text-align: center;">
<h1>QR Code가 생성되었습니다.</h1>
<%
	if(nCheck==1){
		String qrcode = request.getContextPath() + "/img/"+savedFileName + ".png";
		System.out.println("qrcode->"+qrcode);
		out.print("<a href='"+qrcode+"' download='"+ savedFileName+"'><img src='"+qrcode+"'/></a><p/>");
	}
	else{
		out.print("QR코드가 생성되지 않았습니다.");
	}
	
%>
<p>QR코드를 클릭하면 다운로드 됩니다.
</div>
 <%@ include file="footer.jsp" %>
</body>
</html>