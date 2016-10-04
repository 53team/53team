<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>member/registerForm</title>
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
   $('#result').click(function(){
      var i={id:$('#id').val()};
      $.ajax({
         type:"post",
         url:"registerIDCheck.do",
         data:i,
         success:function(data){
            var str = '<p id="result">';
             var loc = data.indexOf(str);
             var len = str.length;
             var result = data.substr(loc+len,1);
             if(result=="1"){
                alert("중복되는 아이디입니다");
                 $("#id").val("");
               }else if (result=="0")
                   alert("사용할 수 있는 아이디입니다");
         }
      });
   });
});
</script>
</head>
<body>
<form action="registerPro.do" method="post">
<div class="container">
	<div class="row">
	<br><br>
		<div class="col-md-2"></div>
		<div class="col-md-8" id="middlebox" >
			<div class="col-md-12" align="center">
				<br>
				<font size="5"><b>JOIN</b></font>
				<hr>
			</div>
			<div class="col-md-2"></div>
			<div class="col-md-7">
				<br><br>
				<div class="col-md-4" align="right">
					<label for="inputID">ID</label>
				</div> 
				<div class="col-md-8">
					<input type="text" id="id" name="id" class="form-control" placeholder="아이디" maxlength="12" required ><br>
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
					<input type="text" id="name" name="name" class="form-control" placeholder="이름"required><br>
				</div>
				<div class="col-md-4" align="right">
					<label for="phone">Phone</label>
				</div>
				<div class="col-md-8">
					<input type="tel" id="phone" name="phone"  class="form-control" placeholder="전화번호" required><br>
				</div>
				<div class="col-md-4" align="right">
					<label for="location">Location</label>
				</div>
				<div class="col-md-8">
				<select name="location" class="form-control" required>
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="강원">강원</option>
					<option value="충청">충청</option>
					<option value="경상">경상</option>
					<option value="전라">전라</option>
					<option value="제주">제주</option>
				</select>
				<br>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-5">
					<input type="submit" class="btn btn-lg btn-primary btn-block" value="가입하기">
				</div>
				<div class="col-md-5">
					<input type="reset" class="btn btn-lg btn-primary btn-block" value="다시쓰기">
					<br>
				</div>
				<div class="col-md-1"></div>
			</div>
			<div class="col-md-2">
			<br><br>
			<input type="button" id="result" class="form-control" value="중복확인"><br>
			</div>
		</div>
	</div>   
	<div class="col-md-2"></div>
</div>
</form>
</body>
</html>