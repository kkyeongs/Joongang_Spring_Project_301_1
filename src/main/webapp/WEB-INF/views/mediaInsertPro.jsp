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
		alert("글작성 성공");
		location.href="mediaList";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("글작성 실패");
		location.href="mediaList";
	</script>
</c:if>
</body>
</html>