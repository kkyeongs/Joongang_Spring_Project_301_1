<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("해당 치료후기를 삭제하였습니다.");
		location.href="reviewList";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("치료후기 삭제 실패");
		history.go(-1);
	</script>
</c:if>

</body>
</html>