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
<script src="https://use.fontawesome.com/e23eda4ad0.js"></script>
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
.hidden{
	display: none;
}
</style>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <meta name="copyright" content="MACode ID, https://macodeid.com/">
  
  
</head>
<script type="text/javascript">
	const HIDDEN_CLASS = "hidden";
	
  	$(function () {
		$('#writeclick').click(function () {
			location.href="pCousultInsertForm";
		});
		
		$('#noclick').click(function() {
			var answer;
			answer = confirm("????????? ????????? ???????????????. ????????? ???????????????????");
			if(answer == true){
				location.href="login";//1???1????????? ???????????? ????????????????????? ???????????? ?????????.
			}
		});	
		
	});
  	
  	
	function fn_chkClick(index) {
		var i = index;
		var test;
		var check;
		var inputbarIndex = document.getElementById('inputbar'+index);
		var submitbarIndex = document.getElementById('submitbar'+index);
		inputbarIndex.classList.toggle(HIDDEN_CLASS);
			
		inputbarIndex.focus();
		submitbarIndex.classList.toggle(HIDDEN_CLASS);
		
	}
	
	 function chk(index) {
		var pwIndex = document.getElementById('pw'+index);
		var pw2Index = document.getElementById('inputbar'+index);
		
 	 	if(!pw2Index.value || pw2Index.value == "" ){
			alert("??????????????? ???????????????");
			pw2Index.focus();
			return false;
			
		}
	 	if (pwIndex.value != pw2Index.value) {
			alert("????????? ????????????");
			pw2Index.focus();
			return false;
		} 
		
		return true;
	} 
	

  </script>
<body>

  <!-- Back to top button -->
  <div class="back-to-top"></div>
  <%@include file="header.jsp" %>
	
	<div class="row" style=" margin: 3% auto; width: 65%; text-align: center; font-size: 18px; font-family: NanumBarunGothic;">
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; background-color: #5396E4"><a href="pConsultCount" style="color: white;">???????????????</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="oconsultList">????????????</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="reviewList">????????????</a></div>
            <div class="col" style="border: 1px solid; padding: 13px; border-color: #DCD3D5; "><a href="mediaList">??????&??????</a></div>
           
    </div>
    							
	<c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
	
	<table style="width: 68%; margin: 0 auto; margin-bottom: 1%">
	<%-- <div>Pconsult(1???1??????) ????????? ?????? : ${totalCnt}</div> --%>
		<thead>
			<tr style="font-family: NanumBarunGothic">
				<th>??????</th>
				<th>?????????</th>
				<th>??????</th>
				<th>??????</th>
				<th>?????????</th>
			</tr>	
		</thead>
		<tbody>
		
		<c:forEach items="${pList}" var="plist" varStatus="status" >
		<fmt:formatDate value="${plist.pdate }" var="pdate" pattern="yy-MM-dd"/>
			<tr style="font-family: NanumBarunGothic">
				<td style="width: 100px;">${plist.pnum}</td>
				<td>${plist.id }</td>
				
				<!-- ?????? -->
			
				<td style="width: 500px; text-align: left;">
				<c:choose>
				
				<c:when test="${varSessionId eq 'admin' }">
					<a href="pConsultDetail?pnum=${plist.pnum }">${plist.ptitle }</a>
				</c:when>
				
				
				<c:otherwise>
					<form id="dropBox" action="pConsultDetail" name="frm" onsubmit="return chk(${status.index})">
				 	<div id="subTitle" onclick="fn_chkClick(${status.index})" style="cursor: pointer; margin: 0; display: inline-block;">${plist.ptitle }</div>
					<!-- ???????????? ????????? -->
				 	<div id="dropdown" style="display: inline-block;">
                  		<div class="input-group input-group-sm mb-3" style="width: 100%;">
                          <span class="input-group-text" id="basic-addon1">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
                      		<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"></path>
                      		</svg>
                           </span>
                           	 <input type="hidden" id="pw${status.index}" value="${plist.pw }"><!-- pw??? ???????????? ???????????? ??????.. -->
                           	 <input type="hidden" name="pnum" value="${plist.pnum}">	<!-- pnum??? ??????????????? ???????????? ????????? ?????? name ?????? -->
                           	 
                             <!--???????????????????????? bar  -->
                             <input id="inputbar${status.index}"  type="password" class="form-control hidden" placeholder="???????????? 4?????? ??????" aria-label="Input group example" aria-describedby="basic-addon1" maxlength="4">
                    		
                    		 <!-- ?????? ?????? -->
                    		 <input id="submitbar${status.index}" type="submit" class="form-control2 hidden" value="??????" style="color: white; background-color: black; font-size: 13px; border: 0px;">
                    		
                    	 </div>
               		 </div>
               		 <!-- ???????????? / ????????????  -->
               		 <c:if test="${plist.adminReplyChk == 1 }">
               		 <span style="color: red; font-size: 13px;">[????????????]</span>
              		 </c:if>
              		 <c:if test="${plist.adminReplyChk == 0 }">
               		 <span style="color: gray; font-size: 13px;">[????????????]</span>
              		 </c:if>
              		
               	</form>
				</c:otherwise>
				</c:choose>	 
				
				</td>
				<!-- ?????? ??? -->
				
				<td style="width: 180px;">${pdate }</td>
				<td style="width: 100px;">${plist.pcount }</td>
			</tr>
			
		</c:forEach>
		</tbody>		
	</table>
	<div style="margin: 0 auto; text-align: center;">
	<c:if test="${pg.startPage > pg.pageBlock}">
		<a class="btn btn-primary btn-sm" href="pConsultCount?currentPage=${pg.startPage - pg.pageBlock }">[??????]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a class="btn btn-primary btn-sm" href="pConsultCount?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage > pg.totalPage }">
		<a class="btn btn-primary btn-sm" href="pConsultCount?currentPage=${pg.startPage + pg.pageBlock}">[??????]</a>
	</c:if>
	</div> 
	<c:if test="${varSessionId != null }">
		<div style="text-align: right; width: 68%; margin: 0 auto; margin-top: 2%; " >
			<button id="writeclick" type="submit"  style="font-family: NanumBarunGothic;" class="btn btn-info btn-sm">?????????</button>
		</div>
	</c:if>
	<c:if test="${varSessionId == null }">
		<div style="text-align: right; width: 68%; margin: 0 auto; margin-top: 2%; " >
			<button id="noclick" type="submit" style="font-family: NanumBarunGothic;" class="btn btn-info btn-sm">?????????</button>
		</div>
	</c:if>
	<%@include file="footer.jsp" %>
	<!-- <script src="js/pconsultList.js"></script> -->
</body>
</html>