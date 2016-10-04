<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
   <meta charset="utf-8">
	<title>member/modifyCheckForm</title>
</head>
<body>
<br><br><br>
<div class="container" id="smallbox">
	<div class="row">
		<div class="col-md-12" align="center">
			<br>
			<font size="5"><b>Modify</b></font><br>
			<font size="2">개인정보 보호를 위한 비밀번호 입력</font>
			<hr>
		</div>
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form action="modifyCheckPro.do" method="post" class="form-signin">
			   <input type="password" id="pwd" name="pwd" class="form-control" placeholder="Password" maxlength="12" required><br>
			   <input type="submit" class="btn btn-lg btn-primary btn-block" value="확인">
		   </form>
		   <br>
		</div>
		<div class="col-md-2"></div>
	   <br>
	</div>
</div>
</body>
</html>