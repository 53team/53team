<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/registerPro</title>
</head>
<body>
<c:if test="${ result==1 }">
<h3>회원가입 완료</h3>
</c:if>
<c:if test="${ result==0 }">
	<script>
		alert("입력된 두개의 비밀번호가 다릅니다. 가입 페이지로 이동합니다");
	</script>
	<meta http-equiv="Refresh" content="0; url=registerForm.do">
</c:if>
<c:if test="${ result==-1 }">
	<script>
		alert("중복된 아이디입니다. 가입 페이지로 이동합니다");
	</script>
	<meta http-equiv="Refresh" content="0; url=registerForm.do">
</c:if>
</body>
</html>