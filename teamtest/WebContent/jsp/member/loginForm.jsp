<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
   <meta charset="utf-8">
   <title>member/loginForm</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/signin.css" rel="stylesheet">
</head>
<body>
<br><br><br>
<div class="container" id="smallbox">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			   <form action="loginPro.do" method="post" class="form-signin">
				   <h2 class="form-signin-heading">Please sign in</h2>
				   <label for="inputID" class="sr-only">ID</label>
				   <input type="text" id="inputID" name="id" class="form-control" placeholder="ID 최대 12자 영문/숫자" maxlength="12" required autofocus><br>
				   <label for="inputPassword" class="sr-only">비밀번호</label>
				   <input type="password" id="inputPassword" name="pwd" class="form-control" placeholder="Password 최대 12자 영문/숫자" maxlength="12" required><br>
				   <input type="submit" class="btn btn-lg btn-primary btn-block" value="로그인">
				   <input type="button" class="btn btn-lg btn-primary btn-block" value="회원가입" onclick="document.location.href='registerForm.do'">
			   </form>
			   <br>
		</div>
		</div>
	   <div class="col-md-2"></div>
	   <br>
   </div>
</body>
</html>