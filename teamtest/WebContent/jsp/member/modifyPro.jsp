<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/modifyPro</title>
</head>
<body>
<c:if test="${ result==1 }">
<h3>회원정보 수정 완료</h3>
</c:if>
<c:if test="${ result==0 }">
	<script>
		alert("입력된 두개의 비밀번호가 다릅니다. 회원정보 수정 페이지로 이동합니다");
	</script>
	<meta http-equiv="Refresh" content="0; url=modifyForm.do">
</c:if>
</body>
</html>