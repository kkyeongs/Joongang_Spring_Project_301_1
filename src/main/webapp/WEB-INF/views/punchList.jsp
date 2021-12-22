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
  let selectType = "";
 
		
	function searchBy(searchOption){ 
		var inputType = document.getElementById("search");
			inputType.value = "";		
		var searchType = document.getElementById("searchType");
			searchType.value = "";
			
			selectType = searchOption.value;
			
		if(searchOption.value == "punchSearchByEmpno"){
			$("#optionType").attr("action","punchList");
			inputType.type = "search";
			searchType.value = "1";
		}
		else if(searchOption.value == "punchSearchByDate"){
			$("#optionType").attr("action","punchList");
			inputType.type = "date";
			searchType.value = "2";
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

#punchOperation{
	border: 1px solid; padding: 15px; border-color: #DCD3D5; background-color: #5396E4;
}
#punchOperationA {
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
	<div style="text-align: center; font-family: 'GowunBatang-Regular';">
		<select name="searchOption"  onchange="searchBy(this)" >
		
			<option value=""  >==검색방식==</option>
		<c:choose>
			<c:when test="${searchType==0 }">
					<option value="punchSearchByEmpno" >직원번호</option>
					<option value="punchSearchByDate" >날짜</option>
			</c:when> 
			<c:when test="${searchType==1 }">
					<option value="punchSearchByEmpno" selected="selected">직원번호</option>
					<option value="punchSearchByDate" >날짜</option>
			</c:when> 
			<c:when test="${searchType==2 }">
					<option value="punchSearchByEmpno" >직원번호</option>
					<option value="punchSearchByDate" selected="selected">날짜</option>
			</c:when>
		</c:choose>
		
			
			
		</select>
		
		<c:choose>
			<c:when test="${searchType == 0 }">
				<form name="optionType" id = "optionType">
					<input id= "search" name="search"  required="required" >
					<input type="hidden" id="searchType" name="searchType">
					<input type="submit" value="검색" onclick="return chk()">
					
				</form>
			</c:when>
			<c:when test="${searchType =='1'}">
			<form name="optionType" id = "optionType">
			<input type="search" id= "search" name="search" value="${ search}" required="required" >
			<input type="hidden" id="searchType" name="searchType">
			<input type="submit" value="검색" onclick="return chk()">
		</form>
			</c:when>
		<c:when test="${searchType == '2'}">
		<form name="optionType" id = "optionType">
			<input type="date" id= "search" name="search" value="${ search}" required="required" >
			<input type="hidden" id="searchType" name="searchType">
			<input type="submit" value="검색" onclick="return chk()">
		</form>
		</c:when>	
		</c:choose>
		
		
	</div>    <p>
    <table style="width: 70%; margin: 0 auto; margin-bottom: 3%">
		<thead>
			<tr style="font-family: NanumBarunGothic">
				<th>직원번호</th>
				<th>날짜</th>
				<th>출근시간</th>
				<th>퇴근시간</th>
			</tr>	
		</thead>
		<tbody>
		
		<c:forEach items="${punchList}" var="punchList" >
		<fmt:formatDate value="${punchList.pundate }" var="pundate" pattern="yy-MM-dd"/>
			<tr style="font-family: NanumBarunGothic">
				<td style="width: 100px;">${punchList.empno}</td>
				<td style="width: 200px;">${pundate }</td>
				<td style="width: 118px;">${punchList.starttime }</td> 
				<td style="width: 118px;">${punchList.endtime }</td> 
			</tr>
		</c:forEach>
		
		</tbody>
		</table>
		<div style="margin: 0 auto; text-align: center;">
	<c:if test="${pg.startPage > pg.pageBlock}">
		<a class="btn btn-primary btn-sm" href="punchList?search=${search }&currentPage=${pg.startPage - pg.pageBlock }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pg.startPage }" end="${pg.endPage }">
		<a class="btn btn-primary btn-sm" href="punchList?search=${search }&currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${pg.endPage > pg.totalPage }">
		<a class="btn btn-primary btn-sm" href="punchList?search=${search }&currentPage=${pg.startPage + pg.pageBlock}">[다음]</a>
	</c:if>
	</div> 
    <%@include file="footer.jsp" %>
</body>
</html>