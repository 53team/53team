<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/modifyCheckForm</title>
</head>
<body>
<div>
	<form action="modifyCheckPro.do" method="post">
		<p>개인정보 보호를 위해 비밀번호를 한번 더 입력해 주세요<br>
		<label for="pwd">비밀번호</label>
		<input type="password" id="pwd" name="pwd" placeholder="최대 12자 영문/숫자" maxlength="12" required><br>
		<input type="submit" value="정보수정">
		<input type="reset" value="재입력">
	</form>
</div>
</body>
</html>