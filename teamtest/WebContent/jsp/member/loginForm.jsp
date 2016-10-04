<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
   <meta charset="utf-8">
   <title>member/loginForm</title>
</head>
<body>
<br><br><br>
<div class="container" id="smallbox">
	<div class="row">
		<div class="col-md-12" align="center">
			<br>
			<font size="5"><b>Login</b></font>
			<hr>
		</div>
		<div class="col-md-2"></div>
		<div class="col-md-8">
		   <form action="loginPro.do" method="post" class="form-signin">
			   <input type="text" id="inputID" name="id" class="form-control" placeholder="ID" maxlength="12" required autofocus><br>
			   <input type="password" id="inputPassword" name="pwd" class="form-control" placeholder="Password" maxlength="12" required><br>
			   <input type="submit" class="btn btn-lg btn-primary btn-block" value="로그인">
			   <input type="button" class="btn btn-lg btn-primary btn-block" value="회원가입" onclick="document.location.href='registerForm.do'">
		   </form>
		   <br>
		</div>
		<div class="col-md-2"></div>
	   <br>
	</div>
</div>
</body>
</html>