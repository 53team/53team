<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/modifyForm</title>
</head>
<body>
<div>
	<form action="modifyPro.do" method="post">
	<label for="id">ID</label>
	<c:out value="${ sessionScope.sid }"></c:out><br>
	<label for="pwd">비밀번호</label>
	<input type="password" id="pwd" name="pwd" placeholder="최대 12자 영문/숫자" maxlength="12" required><br>
	<label for="repwd">비밀번호 확인</label>
	<input type="password" id="repwd" name="repwd" placeholder="비밀번호 확인" maxlength="12" required>
	<font id="check" color="red"></font><br>
	<label for="name">이름</label>
	<input type="text" id="name" name="name" value="${name }" required><br>
	<label for="phone">전화번호</label>
	<input type="tel" id="phone" name="phone" placeholder="010-0000-0000" value="${phone }" required><br>
	<label for="location">지역</label>
	<input type="text" id="location" name="location" placeholder="서울" value="${location }" required><br>
	<input type="submit" value="회원정보 수정">
	<input type="reset" value="다시쓰기">
	<input type="button" value="회원탈퇴" onclick="document.location.href='withdrawalForm.do'">
	</form>
</div>
</body>
</html>