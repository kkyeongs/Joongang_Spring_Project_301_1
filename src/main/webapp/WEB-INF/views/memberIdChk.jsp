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
<c:if test="${ result > 0 }">
	<script type="text/javascript">
		alert("사용 중인 아이디입니다. 다른 아이디를 입력해주세요 .")
		history.go(-1);
	</script>
 </c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">

	alert("사용 가능한 아이디입니다 :)");
	history.go(-1);
	</script>
</c:if>
</body>
</html>