<!-- 진료내역 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="vendor/owl-carousel/js/owl.carousel.min.js"></script>
<script src="vendor/wow/wow.min.js"></script>
<script src="js/theme.js"></script>
<script type="text/javascript">
let selectType = searchOption.value;


function searchBy(searchOption){
	var inputType = document.getElementById("search");
		inputType.value = "";
		if(searchOption.value == "clinicSearchByClientName"){
			$("#optionType").attr("action","clinicSearchByClientName");
			
			inputType.type = "search";
		}
		else if(searchOption.value == "clinicSearchByDoctorName"){
			$("#optionType").attr("action","clinicSearchByDoctorName");
			inputType.type = "search";
		}
		else if(searchOption.value == "clinicSearchByDate"){
			$("#optionType").attr("action","clinicSearchByDate");
			inputType.type = "date";
			
		}
		
	}
	 function chk(){
			if(selectType == ""){
				alert("검색 방식을 선택하세요");
				return false;
			}
			else{
				return true;
			}
	}
  </script>
<link href="css/board.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/maicons.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet"href="vendor/owl-carousel/css/owl.carousel.css">
<link rel="stylesheet" href="vendor/animate/animate.css">
<link rel="stylesheet" href="css/theme.css">

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

#clinicOperation{
	border: 1px solid; padding: 15px; border-color: #DCD3D5; background-color: #5396E4;
}
#clinicOperationA {
	color: white;
}
#clinicWriteFormA {
	color: white;
}
</style>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <meta name="copyright" content="MACode ID, https://macodeid.com/">
  

</head>
<body>

  <!-- Back to top button -->
  <div class="back-to-top"></div>
   
    <%@include file="header.jsp" %>
    <%@ include file="empOperationNav.jsp"%>
    <c:set var="num" value="${pg.total-pg.start+1 }"></c:set>
    <c:set var="clientName" value="${search }"></c:set>
	<div style="text-align: center; font-family: 'GowunBatang-Regular';">
		<form name="optionType" id = "optionType">
		<select name="searchOption"  onchange="searchBy(this)" >
			<option value="" >==검색방식==</option>
			<option value="clinicSearchByDoctorName" >담당의</option>
			<option value="clinicSearchByClientName" >환자명</option>
			<option value="clinicSearchByDate" selected="selected" >진료일</option>
		</select>
			<input id="search" name="search" type="date" required="required" value="${search }">
			<input type="submit"value="검색" onclick="return chk()">
		</form>
	</div>    <p>
    <table style="width: 70%; margin: 0 auto; margin-bottom: 3%">
		<thead>
			<tr style="font-family: NanumBarunGothic">
				<th>번호</th>
				<th>환자명</th>
				<th>진료내역</th>
				<th>진료일</th>
				<th>담당의</th>
			</tr>	
		</thead>
		<tbody>
		
		<c:forEach items="${clinicList}" var="clinicList" >
		<fmt:formatDate value="${clinicList.cdate }" var="cdate" pattern="yy-MM-dd hh:mm:ss"/>
			<tr style="font-family: NanumBarunGothic">
				<td style="width: 100px;">${clinicList.cnum}</td>
				<td>${clinicList.name }</td>
				<td style="width: 500px; text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;<a href="clinicDetail?cnum=${clinicList.cnum }" style="color: black;">${clinicList.ccontent }</a></td>
				 <td style="width: 200px;">${cdate }</td>
				<td style="width: 118px;">${clinicList.ename }</td> 
			</tr>
		</c:forEach>
		
		</tbody>
		</table>
		<div style="margin: 0 auto; text-align: center;">
	<c:if test="${pg.startPage > pg.pageBlock}">
		<a class="btn btn-primary btn-sm" href="clinicSearchByDate?search=${search }&currentPage=${pg.startPage - pg.pageBlock }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a class="btn btn-primary btn-sm" href="clinicSearchByDate?search=${search }&currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage > pg.totalPage }">
		<a class="btn btn-primary btn-sm" href="clinicSearchByDate?search=${search }&currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	</c:if>
	</div> 
	<c:if test="${varSessionId != null }">
		<div style="text-align: right; width: 68%; margin: 0 auto; margin-top: 2%; " >
			<button id="clinicWriteForm" type="submit"  style="font-family: NanumBarunGothic;" class="btn btn-info btn-sm"><a id="clinicWriteFormA" href="clinicWriteForm">새 진료 작성</a></button>
		</div>
	</c:if>
    <%@include file="footer.jsp" %>
</body>
</html>