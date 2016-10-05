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
	<section id="banner">
		<div class="inner">
			<font size="5" color="white">
			회원가입완료!<br>
			5초 후 메인으로 돌아갑니다.<br>
			</font>
			<a href="main.do">메인으로</a>
		</div>
	</section>
	<script type="text/javascript">
		setTimeout("location.href='main.do'", 5000)
	</script>
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