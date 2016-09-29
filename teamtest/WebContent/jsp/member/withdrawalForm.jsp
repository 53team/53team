<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/withdrawalForm</title>
</head>
<body>
<div>
	<form action="withdrawalPro.do">
	<label for="pwd">비밀번호</label>
	<input type="password" id="pwd" name="pwd" placeholder="최대 12자 영문/숫자" maxlength="12" required>
	&nbsp;<input type="submit" value="회원 탈퇴">
	</form>
</div>
</body>
</html>