<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/loginForm</title>
</head>
<body>
<div>
	<form action="loginPro.do" method="post">
	<label for="id">ID</label>
	<input type="text" id="id" name="id" placeholder="최대 12자 영문/숫자" maxlength="12" autofocus required><br>
	<label for="pwd">비밀번호</label>
	<input type="password" id="pwd" name="pwd" placeholder="최대 12자 영문/숫자" maxlength="12" required><br>
	<input type="submit" value="로그인">
	<input type="button" value="회원가입" onclick="document.location.href='registerForm.do'">
	</form>
</div>
</body>
</html>