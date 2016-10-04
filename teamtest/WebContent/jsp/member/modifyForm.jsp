<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/modifyForm</title>
<script src="//code.jquery.com/jquery-3.1.0.min.js"></script>
<script>
$(document).ready(function(){
   $('#inputPassword').keyup(function(){
      $('#check').text('');
   });
   $('#repwd').keyup(function(){
      if($('#inputPassword').val()==$('#repwd').val()){
         $('#check').text('');
          $('#check').html("암호가 동일합니다");
      } else {
          $('#check').text('');
          $('#check').html("암호가 다릅니다. 다시 입력해주세요");
      }
   });
</script>
</head>
<body>
<form action="modifyPro.do" method="post">
<div class="container">
	<div class="row">
	<br><br>
		<div class="col-md-2"></div>
		<div class="col-md-8" id="middlebox" >
			<div class="col-md-12" align="center">
				<br>
				<font size="5"><b>Modify</b></font>
				<hr>
			</div>
			<div class="col-md-2"></div>
			<div class="col-md-7">
				<br><br>
				<div class="col-md-4" align="right">
					<label for="inputID">ID</label>
				</div> 
				<div class="col-md-8">
					<input type="text" id="id" name="id" class="form-control" maxlength="12" value="${ sessionScope.sid }" readonly required><br>
				</div>
				<div class="col-md-4" align="right">
					<label for="inputPassword">PW</label>
				</div>
				<div class="col-md-8">
					<input type="password" id="inputPassword" name="pwd" class="form-control" placeholder="비밀번호" maxlength="12" required autofocus><br>
				</div>
				<div class="col-md-4" align="right">
					<label for="repwd">PW Check</label>
				</div>
				<div class="col-md-8">
					<input type="password" id="repwd" name="repwd" class="form-control" placeholder="비밀번호 확인" maxlength="12" required>
				<font id="check" color="red"></font><br>
				</div>
				<div class="col-md-4" align="right">
					<label for="name">Name</label>
				</div>
				<div class="col-md-8">
					<input type="text" id="name" name="name" class="form-control" placeholder="이름" value="${name }" required><br>
				</div>
				<div class="col-md-4" align="right">
					<label for="phone">Phone</label>
				</div>
				<div class="col-md-8">
					<input type="tel" id="phone" name="phone"  class="form-control" placeholder="전화번호" value="${phone }" required><br>
				</div>
				<div class="col-md-4" align="right">
					<label for="location">Location</label>
				</div>
				<div class="col-md-8">
					<select name="location" class="form-control" value="${location }" required>
						<c:if test="${location == '서울'}"><option value="서울" selected="selected">서울</option></c:if>
						<c:if test="${location != '서울'}"><option value="서울">서울</option></c:if>
						<c:if test="${location == '경기'}"><option value="경기" selected="selected">경기</option></c:if>
						<c:if test="${location != '경기'}"><option value="경기">경기</option></c:if>
						<c:if test="${location == '강원'}"><option value="강원" selected="selected">강원</option></c:if>
						<c:if test="${location != '강원'}"><option value="강원">강원</option></c:if>
						<c:if test="${location == '충청'}"><option value="충청" selected="selected">충청</option></c:if>
						<c:if test="${location != '충청'}"><option value="충청">충청</option></c:if>
						<c:if test="${location == '경상'}"><option value="경상" selected="selected">경상</option></c:if>
						<c:if test="${location != '경상'}"><option value="경상">경상</option></c:if>
						<c:if test="${location == '전라'}"><option value="전라" selected="selected">전라</option></c:if>
						<c:if test="${location != '전라'}"><option value="전라">전라</option></c:if>
						<c:if test="${location == '제주'}"><option value="제주" selected="selected">제주</option></c:if>
						<c:if test="${location != '제주'}"><option value="제주">제주</option></c:if>
					</select>
				<br>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-5">
					<input type="submit" class="btn btn-lg btn-primary btn-block" value="수정하기">
				</div>
				<div class="col-md-5">
					<input type="reset" class="btn btn-lg btn-primary btn-block" value="다시쓰기">
					<br>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
	</div>   
	<div class="col-md-2"></div>
</div>
</form>
</body>
</html>