<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/withdrawalPro</title>
</head>
<body>
<c:if test="${ result==1 }">
	<h3>삭제완료</h3>
</c:if>
<c:if test="${ result==0 }">
<script>
		alert("비밀번호가 맞지 않습니다. 다시 입력하세요");
</script>
<meta http-equiv="Refresh" content="0; url=withdrawalForm.do">
</c:if>
</body>
</html>