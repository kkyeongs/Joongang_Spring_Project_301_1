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
		alert("가입 성공");
		location.href="main";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("가입 실패");
		location.href="memberJoinForm";
	</script>
</c:if>
</body>
</html>