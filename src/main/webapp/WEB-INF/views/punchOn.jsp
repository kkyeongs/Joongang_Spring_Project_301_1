<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var result = ${result}
if(result > 0){alert("출근 시간 등록 완료");location.href='main'}
else{alert("출근 시간 등록 실패"); location.href='punch'}	
	
</script>
</head>
<body>
<%@ include file="header.jsp" %>
punchOn 입니다!!!!
<%@ include file="footer.jsp" %>
</body>
</html>