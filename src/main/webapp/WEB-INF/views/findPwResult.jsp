<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("이메일 전송 성공! 비밀번호를 변경해 주세요");
		location.href="login";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("이메일 전송 실패");
		location.href="login";
	</script>
</c:if>
</body>
</html>